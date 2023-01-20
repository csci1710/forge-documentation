# Operators

Formula operators are used to create formulas from other formulas.

For the following `<fmla>` means an arbitrary formula.

Some operators have alternative syntax (marked by **_alt_**) which are equivalent, use whichever is most natural and convenient to you.

### List of Availible Operators:

- [`not (!)`](./operators.md#not)
- [`and (&&)`](./operators.md#and)
- [`or (||)`](./operators.md#or)
- [`implies (=>)`](./operators.md#implies)
  - [`else`](./operators.md#implies-else)
- [`iff (<=>)`](./operators.md#iff)

---

## `not`

> `not <fmla>`

**true** when `<fmla>` evaluates to **false**

_alt:_ `!`

<!-- ```admonish example
test 123
~~~
tesdt 123
~~~
``` -->

---

## `and`

> `<fmla-a> and <fmla-b>`

**true** when both `<fmla-a>` and `<fmla-b>` evaluate to **true**.

_alt:_ `&&`

---

## `or`

> `<fmla-a> and <fmla-b>`

**true** when either `<fmla-a>` is **true** or `<fmla-b>` evaluates to **true**.

_alt:_ `||`

---

## `implies`

> `<fmla-a> implies <fmla-b>`:

**true** when either `<fmla-a>` evaluates to **false**, or both `<fmla-a>` and `<fmla-b>` evaluate to **true**.

_alt_ `=>`

### `implies else`

> `{<fmla-a> implies <fmla-b> else <fmla-c>}`

takes the value of `<fmla-b>` when `<fmla-a>` evaluates to **true**, and takes the value of `<fmla-c>` otherwise.

---

## `iff`

> `<fmla-a> iff <fmla-b>`

true when `<fmla-a>` evaluates to **true** exactly when `<fmla-b>` evaluates to **true**.

(iff = "if and only if")

_alt:_ `<=>`

---
