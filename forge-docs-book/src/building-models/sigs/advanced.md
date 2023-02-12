# Advanced Material (How do sigs and fields work?)

Forge's solver engine works entirely in terms of _sets_. Each `sig` name corresponds to the set of objects of that sig type in a given instance. Similarly, each field name `f` corresponds to a relation (set) with arity _1+arity(f)_. 

```admonish note title="Arity"
Recall that the _arity_ of a set is how many elements its member tuples contain. E.g., a set of objects would have arity 1, but a set of pairs of objects would have arity 2.
```

E.g.,

```
sig B {}
sig A {
    myField: set A -> B
}
```

is internally represented as a pair of sets `A` and `B` and a 3-ary relation named `myField` that must be a subset of `A -> A -> B` in any instance. 

Because every `run` is always equipped with a finite bound on every sig, the solver is then able to convert Forge constraints to a purely boolean logic problem, where every _possible_ membership in each set is assigned a unique boolean variable. 

~~~admonish example title="Compiling a Forge problem" 

```clike
#lang forge
sig Person {
    bestFriend: one Person
}
run {
    all p: Person | { 
        some disj p1, p2: Person | {
            p1.bestFriend = p 
            p2.bestFriend = p
        }
    }
} for exactly 4 Person
```

This model defines two sets: 
- `Person`, of arity 1; and
- `bestFriend`, of arity 2.

Since there are exactly 4 people allowed by the `run`, the contents of `Person` is fixed. But `bestFriend` may contain any pair of `Person` objects. There are $4 \times 4 = 16$ possible pairs, and so there are 16 boolean variables needed to define the `bestFriend` field.

You can see these reflected in the _primary variable_ portion of the statistical output Forge gives when running this file:
```
#vars: (size-variables 178); #primary: (size-primary 16); #clauses: (size-clauses 311)
```
~~~

For more information, see the CSCI 1710 lecture notes.