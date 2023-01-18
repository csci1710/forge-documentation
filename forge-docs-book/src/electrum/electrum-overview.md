# Electrum Overview

Electrum mode extends Forge with temporal operators to ease specification and checking of dynamic systems. This mode draws heavily on the [Electrum work](http://haslab.github.io/Electrum/) by INESC TEC and ONERA, but there are differences.

To enable Electrum mode, pass `option problem_type temporal` to Forge. This will cause a number of changes in how Forge processes your models, the largest one being that it will now always search for **lasso traces** (see below) rather than arbitrary instances. The maximum length of the trace is given by `option max_tracelength <k>` and defaults to `5`.

### Variable state

Electrum mode allows `var` annotations to be placed on `sig` and field definitions. Such an annotation indicates that the contents of the corresponding relation may vary over time. For instance, saying `sig Vertex { var edges: set Vertex }` defines a directed graph whose edge relation may vary. Writing `var sig Student {}` denotes that the set of students need not remain constant.

#### A Note on Meaning

From the point of view of the constraints you're about to write, a trace is an **infinite** object. However, the solver underlying Forge needs to finitize the problem in order to solve it. The solution to this, given a finite state-space, is to invoke the Pigeonhole Principle and seek traces that end in a loop: "lassos".

However, this abstraction choice is not without a cost. If your system takes a great deal of steps before it loops back (e.g., an integer counter that overflows), Forge may tell you that there are no traces. Always pay attention to your `max_tracelength` option, and be convinced that it is sufficient to include the lassos you're interested in.

### Added relational operators

Electrum mode adds one relational operator: priming (`'`). Any relational expression that is primed implicitly means "this expression **in the next state**". Thus, you can use priming to easily phrase transition effects. E.g., `cookies' in cookies` would mean that in every transition, the set of `cookies` never grows over time (will either shrink or remain the same).

### Added formula operators

Electrum mode adds a number of formula operators, corresponding to those present in Linear Temporal Logic (LTL) and Past-Time Linear Temporal Logic.

- `next_state <fmla>` is true in a state `i` if and only if: `fmla` holds in state `i+1`.
- `always <fmla>` is true in a state `i` if and only if: `fmla` holds in every state `>=i`.
- `eventually <fmla>` is true in a state `i` if and only if: `fmla` holds in some state `>=i`.

#### Standard LTL Operators

- `<fmla-a> until <fmla-b>` is true in a state `i` if and only if: `fmla-b` holds in some state `j>=i` and `fmla-a` holds in all states `k` where `i <= k < j`. Note that the obligation to see `fmla-a` ceases in the state where `fmla-b` holds.

A natural question to ask is: what happens if `fmla-b` holds at multiple points in the future? However, this turns out not to matter: the definition says that the `until` formula is true in the current state if `fmla-b` holds at **some** point in the future (and `fmla-a` holds until then).

- `<fmla-a> releases <fmla-b>` is true in a state `i` if and only if: `fmla-a` holds in some state `j>=i` and `fmla-b` holds in all states `k` where `i <= k <= j`, or `fmla-a` never occurs in a later state and `fmla-b` holds forever after. Note that the intuitive role of the two formulas is reversed between `until` and `releases`, and that, unlike `until`, the obligation extends to the state where `fmla-a` holds.

#### Past-time LTL Operators

- `prev_state <fmla>` is true in a state `i` if and only if: `fmla` holds in state `i-1`. `prev_state <fmla>` is canonically false if `i=0`, since there is no prior state.
- `historically <fmla>` is true in a state `i` if and only if: `fmla` holds in every state `<=i`.
- `once <fmla>` is true in a state `i` if and only if: `fmla` holds in some state `<=i`.

### Historical Note for Alloy Users

Alloy 6 and Electrum use the keywords `after` and `before` where Forge uses `next_state` and `prev_state`. We changed Forge to use these (admittedly more verbose) keywords in the hopes they are more clear. For example, `after` sounds like it could be a binary operator; in English, we might say "turn left after 3 stops". Also, `next_state` is definitely a formula about the following state whereas `after` does not communicate the same sense of immediacy.
