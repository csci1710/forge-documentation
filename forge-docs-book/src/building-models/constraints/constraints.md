# Constraints

```admonish danger title="TODO"
- This page is currently a jumble of random stuff, need to reorganize/refactor/create accordingly.
- Figure out how to talk about solvers, do we have another page for it? How do we address what Forge is doing "Under the Hood" ?
```

<!--
```admonish danger title="TODO"
- **PAGE IS UNFINISHED!**:
  - Needs re-wording past Rules vs. Instructions, perhaps refactoring to different page
  - Fit the linked list example in there somehow
  - Needs transition statement into constraint types and such
- Clarify or remove * relating to "can/will generate many instances of a model." Well, will Forge **always** do this?
- Add * caveat about "not all possible instances because of inherent bounds (and then link to bounds chapter)
``` -->

In Forge, we use _Constraints_ to represent the "rules" of the system we are modeling, and [Sigs](../sigs/sigs.md) to represent the "things" of the system we are modeling.

A reader familiar with ... might skip to []() for the technical docs...

- students/grades example:
  Take an english rule, break it down. what syntax do we need to express this as a rule?

- By the way, weird context dependence thing, talk about next...
  \
  \
  \
  \
  \
  \
  \
  \
  \
  \
  \
  \

\
\
\
\
\
\
\
\
\
\
\
\

In order to understand constraints, we'll first touch on some key differences between modeling languages and traditional programming languages, and then explore an example to motivate and contextualize how constraints are used.

<!-- In order to understand constraints and how they work, we need some context about modeling languages: -->

(If you are already familiar with the overview and looking for the technical implementation of constraints in Forge, you can start [on this page](../constraints/constraint-types.md))

---

Elements of Forge constraints are one of three types:

- **formulas**, which evaluate to booleans;
- **expressions**, which evaluate to relations, and
- **integer expressions**, which evaluate to integers (possibly with overflow, depending on the current bitwidth).

Attempting to use operators with the wrong kind of arguments (e.g., taking the `and` of two `sig`s) will produce an error in Forge when you try to run your model.

### Temporal operators

For more information on temporal operators, which are only handled if `option problem_type temporal` is given to Forge, see Electrum Mode. We maintain these on a separate page because the meaning of constraints can differ in Electrum mode. Concretely, in Electrum mode Forge will **only** find instances that form a lasso trace.

---

_Constraints_ are comprised of **formulas**, and **expressions**. Formulas evaluate to a boolean value (true or false), and expressions evaluate to a "thing" in our model.

By combining...writing

We can enforce that something is always/sometimes/never true...

-
- Talk about the goals specifically

When writing constraints for our model, we need to be able to do two things:

<!--
Recall that in the overview of [what a model is](../overview.md#models), we said that a model

> "...explicitly defines both the "things" that exist in the system, and the "rules" of the system." -->

---

<!--
_TODO: BEFORE TALKING ABOUT IMPL DETAILS OF CONSTRAINTS IN FORGE, LET'S TALK ABOUT HOW CONSTRAINTS PLAY INTO BUILDING MODELS BY LOOKING AT AN EXAMPLE_ -->

... TBD WIP

### TBD, maybe even remove separation

_TESTING LANGAUGE BELOW, NOT FINAL:_

Recall that one

Let's bring back the [linked list](../../building-models/sigs/sigs.md#admonition-example-sig-w-one-field) example we saw when learning about sigs:

```
sig Node {
    next: one Node
}
```

If the point of modeling linked-lists is to learn things about the linked-list systems, we have to

<!--
![LinkedList-Normal](../../../images/constraints/LinkedList-normal.png)
![LL-Weird-A](../../images/constraints/LinkedList-weird-A.png) -->

![Linked-List-Weird-B](../../images/constraints/LinkedList-weird-B.png)

Let's look at the example we first introduced when discussing sigs, [a linked list](../../building-models/sigs/sigs.md#admonition-example-sig-w-one-field)

We _constrain_ the acceptable outputs of the model by defining more rules and being more specific about the constraints of the model. In general, the more rules we add, the fewer acceptable outputs.

a model with a lack of rules just means that you are allowing lots of things to be acceptable instances of the model!

Forge will by default try and give you all possible instances

<!-- In Forge, the computer already has a set of instructions: construct instances of the model based on how you defined the "things" and "rules" of the model. -->

Many people are tempted to tell Forge

What Forge is basically doing....

---
