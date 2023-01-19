# Relational Expressions

```admonish danger title="TODO"
- Idea of "Columns", idea of "Joins"
```

There are also the following operators that produce expressions, not formulas:

- `<expr-a> + <expr-b>`: returns the **union** of the two exprs i.e. all elements in either of the two exprs;
- `<expr-a> - <expr-b>`: returns the **set difference** of the two exprs i.e. everything in expr-a that is not also in expr-b;
- `<expr-a> & <expr-b>`: returns the **intersection** of the two exprs i.e. all elements in both expr-a and expr-b;
- `<expr-a> . <expr-b>`: returns the **relational join** of the two exprs;
- `<expr-a> -> <expr-b>`: returns the **cross product** of the two exprs;
- `<expr-a>[<expr-b>]`: is equivalent to `<expr-b> . <expr-a>`;
- `~<expr>`: returns the transpose of `<expr>`, assuming it is has arity 2;
- `^<expr>`: returns the transitive closure of `<expr>`, assuming it is has arity 2;
- `*<expr>`: returns the reflexive-transitive closure of `<expr>`, assuming it is has arity 2; and
- `{<fmla> => <expr-a> else <expr-b>}` returns `<expr-a>` if `<fmla>` evaluates to true, and `<expr-b>` otherwise.

**Relational Join**

Relational join ("dot join") combines two relations by seeking common values in the rightmost column and leftmost column of its arguments. More precisely, if $A$ is arity $N$ and $B$ is arity $M$, then the join of $A$ with $B$ is the $N+M-2$-ary relation:

$${(a_1, ..., a_{N-1}, b_2, ..., b_M) | \;\exists x\; | (a_1, ..., a_{N-1}, x) \in A \text{ and } (x, b_2, ..., b_M) \in B}$$

**Note for Alloy Users**

Forge does not currently support the Alloy operators `<:`, `:>`, or `++`; if your models require them, please contact the Forge team.
