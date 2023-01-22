# Instances [TIM]

Forge instances give the context in which constraints are evaluated. E.g., an instance might describe:
  - Tim's family tree, going back 3 generations;
  - CSCI courses offered at Brown this semester, with information on who teaches each;
  - the current state of a chessboard;
  - an entire game of tic-tac-toe;
  - etc.
What an instance contains depends on the current model. Family-tree instances would make sense if the model had defined people, a parenthood relationship, etc.---but not if it was about the game of chess!

Informally, an instance gives concrete values for `sig`s and their fields. Which objects actually exist in the world, and what do their fields contain? Because `sig` definitions can involve concepts like inheritance, partial functions, and uniqueness, the precise definition is a bit involved.

An _instance_ is a collection of finite sets for each `sig` and field in the model. For each `sig S` in the model, an instance contains a set $S$ where:
  - if `S` has a parent `sig P`, then the contents of $S$ must be a subset of the contents of $P$;
  - if `S` has multiple child sigs, the contents of those children don't overlap; 
  - if `S` is declared `abstract` and has child sigs, then any object in $S$ must also be present in $C$ for some `sig C` that extends `sig S`; and
  - if `S` is declared `one` or `lone`, then $S$ contains exactly one or at most one object, respectively.
For each field `f` of type `S1 -> ... -> Sn` of `sig S` in the model, an instance contains a set $f$ where:
  - $f$ is subset of the cross product $S\times S_1 \times ... \times S_N$;
  - if `f` is declared `one` or `lone`, then $f$ can only contain exactly one or at most one object, respectively;
  - if `f` is declared `func`, then it gives a _total_ function: there is exactly one entry in $f$ for each $(s, s_1, ..., s_{n-1}) in $S\times S_1 \times ... \times S_(n-1)$.
  - if `f` is declared `pfunc`, then it gives a _partial_ function or dictionary: there is at most one entry in $f$ for each $(s, s_1, ..., s_{n-1}) in $S\times S_1 \times ... \times S_(n-1)$.

```admonish tip title="Fields are not objects"
It is sometimes useful to use terminology from object-oriented programming to think about Forge models. For example, we can think of a `pfunc` field like a dictionary in Python or a map in Java. However, _a field is not an object_. This matters for at least two reasons:
- We can't write a constraint like "every `pfunc` field in the model is non-empty", because there's no set of `pfunc` objects to examine.
- Two different objects in an instance will be considered non-equal in Forge, even if they belong to the same `sig` and have identical field contents. In contrast, two fields themselves are equal in Forge if they have identical contents---they are to sets that involve objects, not objects themselves.
```
  
```admonish info title="Tuples and Arity"
An ordered list of elements is called a _tuple_, and we'll sometimes use that term to refer to elements of the `sig` and field sets in an instance. The number of elements in a tuple is called its _arity_. Since any single `sig` or field set will contain tuples with the same arity, we can safely talk about the arity of these sets as well. E.g., in the above definition, a field `f` of type `S1 -> ... -> Sn` in `sig S` would always correspond to a set with arity $n+1$.
```

<!-- ```admonish note
If you've taken CSCI 0220, you might recall the term [_relation_](https://en.wikipedia.org/wiki/Finitary_relation). Formally,  
``` -->



mention that when we say `<expr>` and `<fmla>` we mean in the context of the instance
