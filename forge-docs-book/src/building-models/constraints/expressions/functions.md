# Functions

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
