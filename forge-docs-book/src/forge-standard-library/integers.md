# Integers

Forge provides you some integers by default to work with in your spec as well as operators on those integers. There are two types of integers in Forge: integer **values** (e.g. 4) and integer **objects** (e.g. the object representing 4). You can think of this as roughly similar to the `int` vs. `Integer` distinction in Java, but don't take the analogy as perfect.

By the way, sometimes you'll see us refer to an object as an _atom_; this is just an alternate term, and we'll say why later on in the course.

### Operators

In the following, "atoms" is a set of integer atoms and "value" is an integer value. The following operators operate on integer values:

- `add[<value-a>, <value-b> ...]`: returns the value of the sum value-a + value-b + ...
- `subtract[<value-a>, <value-a> ...]`: returns the value of the difference value-a - value-b - ...
- `multiply[<value-a>, <value-b> ...]`: returns the value of the product value-a \* value-b \* ...
- `divide[<value-a>, <value-b> ...]`: returns the value of the left-associative integer quotient (value-a / value-b) / ...
- `remainder[<value-a>, <value-b>]`: returns the remainder for doing integer division. Note that if value-a is negative, the result will also be negative. Note that integer wrap-around may affect the answer.
- `abs[<value>]`: returns the absolute value of value
- `sign[<value>]`: returns 1 if value is > 0, 0 if value is 0, and -1 if value is < 0

### Comparison operators on values

You can compare integer values using the operators `=`, `<`, `<=`, `>`, and `>=`.

### Converting between Int atoms and int values

To convert between sets of integer atoms and integer values there are the following operations:

- `sing[<value>]`: returns a set containing the int atom that represents the given value
- `sum[<atoms>]`: returns the sum of the values that are represented by each of the int atoms in the set
- `max[<atoms>]`: returns the maximum of all the values represented by the int atoms in the set
- `min[<atoms>]`: returns the minimum of all the values represented by the int atoms in the set

**Important**: As of version `1.0.0`, Forge will usually be able to automatically convert between these two kinds of integers. So, usually, you won't have to use `sing`, and you'll rarely use `sum` unless you need to sum multiple values.

### Sum Aggregator

You should be cautious using `sum[...]` once you start using the full Forge language, and have access to relations. Suppose you have `sig A { i: one Int }`, and want to sum over all of the `i` values, but duplicates exist. Then `sum[A.i]` would _not_ count duplicates separately, since `A.i` evaluates to a _set_, which can have no duplicates. In contrast, `sum a: A | a.i` will include duplicates.

#### Details on `sum`

```
sum <x>: <relation> | { <int-expr> }
```

Above, "x" is a variable name, "relation" is the relation you are quantifying over (currently only arity-1 relations are supported), and "int-expr" is an expression that evaluates to an **integer value**. The result of this entire expression is also an **integer value**. This counts duplicate integer values provided the atoms (of any type) in "relation" are different. The following example illustrates the difference between the two different uses of `sum`.

In the instance:

```
inst duplicates {
    A = `A0 + `A1
    time = `A0 -> 1 + `A1 -> 1
}
```

```
sum[A.time]  -- evaluates to the value 1
sum a: A | sum[a.time]  -- evaluates to the value 2
```

### The Successor Relation

Forge also exposes the `succ` relation (`Int -> Int`) where each int atom points to its successor (e.g. the int atom 4 points to 5). The maximum int atom does not point to anything.

### Integer Scope

Integers in Forge are **bounded** up to a fixed bitwidth that you specify. The default is 4 bits, and this allows Forge to represent, and reason about, the $2^4 = 16$ integers on the interval $\[-8, 7]$. Forge uses 2's complement arithmetic, and thus generally handles overflow in the same way a programming language would, just with (usually) smaller minimum and maximum values.

**WARNING**: Remember that a bound on `Int` is the _bitwidth_ allowed, not the number of integers! This is different from all other types in Forge.

**Example**: With a bitwidth of `4`, `add[7, 1]` evaluates to `-8`.

For more on integer bounds, see \[\[Bounds|Bounds]].
