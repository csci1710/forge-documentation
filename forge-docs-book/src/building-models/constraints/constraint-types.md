# Constraint Types

Elements of Forge constraints are one of three types:

- **formulas**, which evaluate to booleans;
- **expressions**, which evaluate to relations, and
- **integer expressions**, which evaluate to integers (possibly with overflow, depending on the current bitwidth).

Attempting to use operators with the wrong kind of arguments (e.g., taking the `and` of two `sig`s) will produce an error in Forge when you try to run your model.

### Formula Operators

For the following `<fmla>` means an arbitrary formula. Some operators have alternative forms, which we tag with "alt:". Use whichever is most natural and convenient to you.

- `not <fmla>`: true when `<fmla>` evaluates to false. alt: `!`
- `<fmla-a> and <fmla-b>`: true when both `<fmla-a>` and `<fmla-b>` evaluate to true. alt: `&&`
- `<fmla-a> or <fmla-b>`: true when either `<fmla-a>` is true or `<fmla-b>` evaluates to true. alt: `||`
- `<fmla-a> implies <fmla-b>`: true when either `<fmla-a>` evaluates to false or both `<fmla-a>` and `<fmla-b>` evaluate to true. alt: `=>`
- `<fmla-a> iff <fmla-b>`: true when `<fmla-a>` evaluates to true exactly when `<fmla-b>` evaluates to true. alt: `<=>`
- `{<fmla-a> => <fmla-b> else <fmla-c>}`: takes the value of `<fmla-b>` if `<fmla-a>` evaluates to true, and takes the value of `<fmla-c>` otherwise.

### Cardinality and Membership Formulas

The following formulas produce booleans based on expression arguments:

- `no <expr>`: true when `<expr>` is **empty**
- `lone <expr>`: true when `<expr>` contains **zero or one** elements
- `one <expr>`: true when `<expr>` contains **exactly one** element
- `some <expr>`: true when `<expr>` contains **at least one** element
- `<expr-a> in <expr-b>`: true when `<expr-a>` is a **subset** of or equal to `<expr-b>`
- `<expr-a> = <expr-b>`: true when `<expr-a>` and `<expr-b>` contain exactly the **same elements**

### Quantifiers

In the following, `<x>` is a variable, `<expr>` is an expression of arity 1, and `<fmla>` is a formula (that can use the variable `<x>`). You can quantify over a unary set in the following ways:

- `some <x>: <expr> | { <fmla> }`: true when `<fmla>` is true for at least one element in `<expr>`
- `all <x>: <expr> | { <fmla> }`: true when `<fmla>` is true for all elements in `<expr>`

Forge also provides 3 additional quantifiers, which encode somewhat richer constraints than the above:

- `no <x>: <expr> | { <fmla> }`: true when `<fmla>` is false for all elements in `<expr>`
- `lone <x>: <expr> | { <fmla> }`: true when `<fmla>` is true for zero or one elements in `<expr>`
- `one <x>: <expr> | { <fmla> }`: true when `<fmla>` is true for exactly one element in `<expr>`

But the above 3 quantifiers (`no`, `lone`, and `one`) should be used carefully. Because they invisibly encode extra constraints, they do not commute the same way `some` and `all` quantifiers do. E.g., `some x : A | some y : A | myPred[x,y]` is always equivalent to `some y : A | some x : A | myPred[x,y]`, but `one x : A | one y : A | myPred[x,y]` is **NOT** always equivalent to `one y : A | one x : A | myPred[x,y]`. (Why not? Try it out in Forge!)

If you want to quantify over several variables, you can also do the following:

- `some <x>: <expr-a>, <y>: <expr-b> | { <fmla> }`;
- `some <x>, <y>: <expr> | { <fmla> }`; and
- (similarly for all other quantifiers).

**Warning!** Beware combining the `no`, `one`, and `lone` quantifiers with multiple variables at once; the meaning of, e.g., `one x, y: A | ...` is "there exists a **unique pair** `<x, y>` such that `...`". This is different from the meaning of `one x: A | one y: A | ...`, which is "there is a unique `x` such that there is a unique `y` such that ...".

**Quantifying Over Disjoint Objects**

Sometimes, it might be useful to try to quantify over all pairs of elements in `A`, where the two in the pair are distinct atoms. You can do that using the `disj` keyword, e.g.:

- `some disj x, y : A | ...` (adds an implicit `x != y and ...`); and
- `all disj x, y : A | ...` (adds an implicit `x != y implies ...`)

### Predicates

If you have a set of constraints that you use often, or that you'd like to give a name to, you can define a _predicate_ using the `pred` keyword:

```
pred <pred-name> {
   <fmla-1>
   <fmla-2>
   ...
   <fmla-n>
}
```

Newlines between formulas in a `pred` will be combined implicitly with `and`s, helping keep your predicates uncluttered. Predicates can also be defined with arguments, which will be evaluated via substitution. For instance, in a family-tree model, you could create:

```
pred parentOrChildOf[p1, p2: Person] {
  p2 = p1.parent1 or
  p2 = p1.parent2 or
  p1 = p2.parent1 or
  p1 = p2.parent1
}
```

and then write something like `some p : Person | parentOrChildOf[Tim, p]`. Predicates may be used like this anywhere a formula can appear.

### Relational Expressions

There are also the following operators that produce expressions, not formulas:

- `<expr-a> + <expr-b>`: returns the **union** of the two exprs i.e. all elements in either of the two exprs;
- `<expr-a> - <expr-b>`: returns the **set difference** of the two exprs i.e. everything in expr-a that is not also in expr-b;
- `<expr-a> & <expr-b>`: returns the **intersection** of the two exprs i.e. all elements in both expr-a and expr-b;
- `<expr-a> . <expr-b>`: returns the **relational join** of the two exprs;
- `<expr-a> -> <expr-b>`: returns the **cross product** of the two exprs;
- `<expr-a>[<expr-b>]`: is equivalent to `<expr-b> . <expr-a>`;
- `~<expr>`: returns the transpose of `<expr>`, assuming it is has arity 2;
- `^<expr>`: returns the transitive closure of `<expr>`, assuming it is has arity 2;
- `*<expr>`: returns the reflexive-transitive closure of `<expr>`, assuming it is has arity 2; and
- `{<fmla> => <expr-a> else <expr-b>}` returns `<expr-a>` if `<fmla>` evaluates to true, and `<expr-b>` otherwise.

**Relational Join**

Relational join ("dot join") combines two relations by seeking common values in the rightmost column and leftmost column of its arguments. More precisely, if $A$ is arity $N$ and $B$ is arity $M$, then the join of $A$ with $B$ is the $N+M-2$-ary relation:

$${(a_1, ..., a_{N-1}, b_2, ..., b_M) | \;\exists x\; | (a_1, ..., a_{N-1}, x) \in A \text{ and } (x, b_2, ..., b_M) \in B}$$

**Note for Alloy Users**

Forge does not currently support the Alloy operators `<:`, `:>`, or `++`; if your models require them, please contact the Forge team.

### Functions

In the same way that predicates define reusable constraints, _functions_ define reusable expressions. Define functions with the `fun` keyword:

```
fun <fun-name>[<args>]: <result-type> {
   <expr>
}
```

As with predicates, arguments will be evaluated via substitution. For example:

```
fun inLawA[p: Person]: one Person {
  p.spouse.parent1
}
```

Functions may be used anywhere expressions can appear.

### Let-expressions

You can bind an expression to an identifier locally by using a `let` form:

```
let <id> = <expression> |
  <formula>
```

This is useful to avoid coat bloat due to re-use. E.g., if `s` is a state:

```
let s2 = Traces.nextState[s] |
  canTransition[s, s2]
```

### Temporal operators

For more information on temporal operators, which are only handled if `option problem_type temporal` is given to Forge, see Electrum Mode. We maintain these on a separate page because the meaning of constraints can differ in Electrum mode. Concretely, in Electrum mode Forge will **only** find instances that form a lasso trace.
