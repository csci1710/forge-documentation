# Integers

There are two types of "integers" in Forge: integer **values** (e.g. 4) and integer **objects** (e.g. the object representing 4). You can think of this as roughly similar to the primitive-`int` vs. object-`Integer` distinction in Java, although the analogy is not perfect. Forge will usually be able to automatically convert between these two, but we will still document the difference.

By the way, sometimes you'll see us refer to an object as an _atom_; this alternate term is used in some other contexts (like our solver engine), and we'll discuss this about mid-way through the semester. 

### Integer Operators

In the following, `<atoms>` represents a set of integer atoms and `<value>`, `<value-a>` and `<value-b>` are integer values. 

- `add[<value-a>, <value-b> ...]`: returns the value of the sum `value-a` + `value-b` + ...
- `subtract[<value-a>, <value-a> ...]`: returns the value of the difference `value-a` - `value-b` - ... 
- `multiply[<value-a>, <value-b> ...]`: returns the value of the product `value-a` \* `value-b` \* ...
- `divide[<value-a>, <value-b> ...]`: returns the value of the left-associative integer quotient (`value-a` / `value-b`) / ...
- `remainder[<value-a>, <value-b>]`: returns the remainder for doing integer division. Note that if `value-a` is negative, the result will also be negative, and that integer wrap-around may affect the answer.
- `abs[<value>]`: returns the absolute value of `value`
- `sign[<value>]`: returns 1 if `value` is > 0, 0 if `value` is 0, and -1 if `value` is < 0

### Comparison operators on values

You can compare integer values using the usual `=`, `<`, `<=`, `>`, and `>=`.

### Counting 

Given an arbitrary expression `e`, the expression `#e` evaluates to the cardinality of (i.e., number of elements in) `e`. In Froglet, this is nearly always either `0` or `1`, although full Forge allows expressions that evaluate to sets. 

#### Counting in Froglet

It is often useful to count even in Froglet, where expressions usually evaluate to either `none` or some singleton object. For example, in a tic-tac-toe model we might want to count the number of `X` entries on the board. In both Froglet and Forge, we can write this using a combination of `#` and [set comprehension](../building-models/constraints/expressions/relational-expressions/relational-expressions.md) (normally not available in Froglet): `#{row, col: Int | b.board[row][col] = X}`. 

Concretely:

> `#{x1: T1, ..., xn: Tn | <fmla>}` 

evaluates to an integer value reflecting the number of tuples `o1, ... on` where `<fmla>` is satisfied when `x1` takes the value `o1`, etc. 

### Aggregation and Conversion 

To convert between sets of integer atoms and integer values there are the following operations:

- `sing[<value>]`: returns an integer atom representing the given value;
- `sum[<atoms>]`: returns an integer value: the sum of the values that are represented by each of the int atoms in the set;
- `max[<atoms>]`: returns an integer value: the maximum of all the values represented by the int atoms in the set; and
- `min[<atoms>]`: returns an integer value: the minimum of all the values represented by the int atoms in the set.

While you might use `sum`, `max`, and `min`, you shouldn't need to use `sing`---Forge now automatically converts between integer values and integer objects.

### Sum Aggregator

You should be cautious using `sum[...]` once you start using the full Forge language, and have access to relations. Suppose you have `sig A { i: one Int }`, and want to sum over all of the `i` values, but duplicates exist. Then `sum[A.i]` would _not_ count duplicates separately, since `A.i` evaluates to a _set_, which can have no duplicates. 

Because of this problem, Forge provides a second way to use `sum` which does count duplicates:

```
sum <x>: <set> | { <int-expr> }
```

Above, `x` is a variable name, `set` is the set you are quantifying over (currently only arity-1 sets are supported), and `int-expr` is an expression that evaluates to an **integer value**. The result of this entire expression is also an **integer value**. This counts duplicate integer values provided the atoms (of any type) in "relation" are different. The following example illustrates the difference between the two different uses of `sum`.

~~~admonish example title="Sum aggregator"
In the instance:

```
inst duplicates {
    A = `A0 + `A1
    time = `A0 -> 1 + `A1 -> 1
}
```

- `sum[A.time]` evaluates to the value 1; and
- `sum a: A | sum[a.time]`  evaluates to the value 2.
~~~


### The Successor Relation

Forge also provides a successor relation, `succ` (`Int -> Int`) where each `Int` atom points to its successor (e.g. the `Int` atom 4 points to 5). The maximum `Int` atom does not point to anything.

### Integer Scope

Integers in Forge are **bounded** up to a fixed bitwidth that you specify. The default is 4 bits, and this allows Forge to represent, and reason about, the $2^4 = 16$ integers in the interval $\[-8, 7]$. Forge uses 2's complement arithmetic, and thus generally handles overflow in the same way a programming language would, just with (usually) smaller minimum and maximum values.

```admonish warning title="Bounded integers and overflow" 
Remember that a bound on `Int` is the _bitwidth_ allowed, not the number of integers! This is different from all other types in Forge.

Moreover, performing arithmetic on Forge integers may trigger integer overflow or underflow.

**Example**: With a bitwidth of `4`, `add[7, 1]` evaluates to `-8`.

For more on integer bounds, see \[\[Bounds|Bounds]].
```
