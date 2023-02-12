# Relational Expressions

```admonish danger title="TODO"
- Idea of "Columns", idea of "Joins"
- Do joins need to have same arity?
```

<!-- There are also the following operators that produce expressions, not formulas: -->

_Relational Expressions_ use relational operators to produce expressions (not formulas) from other expressions.

### List of Relational Expression Operators:

- [`+ (union)`](./relational-expressions.md#-union)
- [`- (set difference)`]()
- [`& (intersection)`]()
- [`.  [] (relational join)`]()
- [`-> (cross product)`]()
- [`~ (transpose)`]()
- [`^ (transitive closure)`]()
- [`* (reflexive transitive closure)`]()
- [`=> else`]()

(Unlike [Formula Operators](../../formulas/operators.md), the parentheticals are _not alternative syntax_. They are the mathematical names)

**Note for Alloy Users**

Forge does not currently support the Alloy operators `<:`, `:>`, or `++`; if your models require them, please contact the Forge team.

---

## `+ (union)`

> `<expr-a> + <expr-b>`

returns the **union** of the two exprs i.e. all elements in either of the two exprs.

---

## `- (set difference)`

> `<expr-a> - <expr-b>`

returns the **set difference** of the two exprs i.e. everything in expr-a that is not also in expr-b.

---

## `& (intersection)`

> `<expr-a> & <expr-b>`

returns the **intersection** of the two exprs i.e. all elements in both expr-a and expr-b

---

## `.` _and_ `[] (relational join)`

> `<expr-a> . <expr-b>`

returns the **relational join** of the two exprs

<!-- [TODOLINK]() -->

- `<expr-a>[<expr-b>]`: is equivalent to `<expr-b> . <expr-a>`;

---

## `-> (cross product)`

> `<expr-a> -> <expr-b>`

returns the **cross product** of the two exprs

<!-- [TODOLINK]() -->

---

## `~ (transpose)`

> `~<expr>`

returns the transpose of `<expr>`, assuming it is has arity 2

<!-- [TODOLINK]() -->

---

## `^ (transitive closure)`

> `^<expr>`

returns the transitive closure of `<expr>`, assuming it is has arity 2

<!-- [TODOLINK]() -->

---

## `* (reflexive transitive closure)`

> `*<expr>`

returns the reflexive-transitive closure of `<expr>`, assuming it is has arity 2; and

<!-- [TODOLINK]() -->

---

- `*<expr>`: returns the reflexive-transitive closure of `<expr>`, assuming it is has arity 2; and
- `{<fmla> => <expr-a> else <expr-b>}` returns `<expr-a>` if `<fmla>` evaluates to true, and `<expr-b>` otherwise.

## Set Comprehension

> `{x1: T1, ..., xn: Tn | <fmla>}` evaluates to a set of arity-n tuples. A tuple of objects `o1, ... on` is in the set if and only if `<fmla>` is satisfied when `x1` takes the value `o1`, etc. 

For example, `{s: Student, i: Faculty | some c: Course | { some s.grades[c] and c.instructor = i} }` would evaluate to the set of student-faculty pairs where the student has taken a course from that faculty member.