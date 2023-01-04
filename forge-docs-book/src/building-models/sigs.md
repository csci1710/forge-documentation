# Sigs

```admonish danger title="TODO"
Break this page up into separate smaller pages, especially w/ the lack of a page table-of-contents
```

_Sigs_ are the basic building block of any model in Forge. You can think of a `sig` as analogous to a class in an object-oriented programming language. You can declare a `sig` in the following way:

```
sig <name> {}
```

A `sig` can also have one or more _fields_, which define relationships between that `sig` and other `sig`s and types.

```
sig <name> {
    <field>,
    <field>,
    ...
    <field>
}
```

```admonish note title="Syntax Note"
Ensure that there is a **comma after every field except for the last one**. This is a common source of compilation errors when first defining a model!
```

## Fields

Each _field_ in a `sig` has:

- a _**name**_;
- a [_**multiplicity**_](sigs.md#multiplicity) (`set`, `one`, `lone`, `pfunc`, or `func`);
- a [_**type**_](sigs.md#types)_**.**_

Put together, a field takes the form:

```
name: multiplicity type
```

### Examples:

```admonish example title="Example: Sig w/ One Field"
**Basic Sig with Fields (Linked List):**

A model of a circularly-linked list might have a `sig` called `Node`. `Node` might then have a field `next: one Node` to represent the contents of every `Node`'s `next` reference. We use `one` here since every `Node` has exactly one successor.&#x20;

~~~
sig Node {
next: one Node
}
~~~
```

```admonish example title="Example: Sig w/ Multiple Fields"
**Basic Sig with Fields (Binary Tree):**

A model of a binary tree might have a `sig` called `Node`. `Node` might then have three fields:

- `left: lone Node` and `right: lone Node` to represent the `Node`'s children. We use `lone` here since the left/right child can either be empty, or contain exactly one `Node`.
- `val: one Int` to represent the value of each Node, where we have decided that every `Node` should have an Integer value. We use `one` here because each `Node` should have exactly one Integer as its value.

~~~
sig Node {
    left: lone Node,
    right: lone Node,
    val: one Int
}
~~~
```

```admonish note title="Int?"
**`Int`** is a type provided by Forge. Read more about [valid types](sigs.md#types), and [Integers in Forge](../integers.md).
```

```admonish example title="Sig w/ No Fields"

#### Example - Basic Sig without Fields:

Not every `sig` in a model needs to have fields to be a useful part of the model! `sig`s with no fields are often used in conjunction with other `sig`s that reference no-field `sig`s.

One such example might look like this:

~~~
sig Student {}
sig Group {
    member: set Student
}
~~~
```

### Multiplicity

Given a field `f` with type `A`, the set of possible multiplicities is:

- `set`: a set of values (this field may contain any number of objects);
- `one`: a singleton value (this field always contains a single object); and
- `lone`: either a singleton value or no value (this field contains 0 or 1 object).

Given a higher-arity field `f` with type `A -> ... -> Y -> Z`, multiplicities constrain the nature of the _tuples_ in the field. The set of possible multiplicities is:

- `set`: a set of tuples (this field may contain any number of tuples);
- `func`: the field is a total function from `A -> ... -> Y` to `Z` (every possible input tuple must have exactly one output value); and
- `pfunc`: the field is a partial function from `A -> ... -> Y` to `Z` (every possible input tuple has either one output value or is not mapped by the function).

Fields declared as `pfunc` are analogous to maps or dictionaries in an object-oriented programming language: some keys may not map to values, but if a key is mapped it is mapped to exactly one value.

### Types

```admonish danger title="TODO"
**TODO:** What is a type? What are valid types? What is a "built-in"? Int? ...\
\
Perhaps have types on another page/entry?
```

### Low-Level Details

Forge's engine translates each field `f` to a relation with arity _1+arity(f)_. E.g.,

```
sig A {
    myField: set A -> B
}
```

is internally represented as a relation named `myField` of type `A -> A -> B`.

## Inheritance

Sigs may inherit from other sigs via the `extends` keyword:

```clike
sig Cat {
    favoriteFood: one Food
}
sig ActorCat extends Cat {}
sig ProgrammerCat extends Cat {}
```

This means that any `ProgrammerCat` object is also a `Cat` object, and so will have a `favoriteFood` field.

```admonish warning title="Warning!"
**Sigs are Disjoint by Default!** Any two sigs `A` and `B` will never contain an object in common unless one is a descendent of the other. So in this example, no `Cat` can ever be both a `ProgrammerCat` and `ActorCat`.
```

## Singleton and Maybe Sigs

You can tell Forge that a given `sig` is always a singleton (i.e., only ever instantiated exactly once) or singleton-if-populated by using the `one` and `lone` keywords in the definition:

```
one sig SingletonObject {}
lone sig MaybeDoesntExist {}
```
