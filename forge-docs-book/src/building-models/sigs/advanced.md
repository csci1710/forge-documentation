# Advanced

Included here is some advanced information about Sigs in Forge.

## Low-Level Details

Forge's engine translates each field `f` to a relation with arity _1+arity(f)_. E.g.,

```
sig A {
    myField: set A -> B
}
```

is internally represented as a relation named `myField` of type `A -> A -> B`.
