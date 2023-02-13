# Operators

Formula operators are used to create bigger formulas from other formulas.

### List of Available Operators:

For the following `<fmla>` means an arbitrary formula.

- Negation: [`not (!)`](./operators.md#not)
- Conjunction: [`and (&&)`](./operators.md#and)
- Disjunction: [`or (||)`](./operators.md#or)
- Implication: [`implies (=>)`](./operators.md#implies)
  - If-then-else: [`else`](./operators.md#implies-else)
- Bi-implication: [`iff (<=>)`](./operators.md#iff)

```admonish note title="Alternative syntax"
Some operators have alternative syntax (marked by **_alt_**) which are equivalent. Use whichever is most natural and convenient to you.
```

---
## `not` (_alt:_ `!`)

> `not <fmla>`
> 
> `! <fmla>`

**true** when `<fmla>` evaluates to **false**

```admonish example
If `some p.spouse` is true when the person `p` is married, `not (some p.spouse)` denotes the opposite, being true whenever `p` is _not_ married.
```

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
