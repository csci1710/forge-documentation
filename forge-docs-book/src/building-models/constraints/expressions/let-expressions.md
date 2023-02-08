# Let-Expressions

```admonish todo title="TODO"
- TODO: Add documentation about using "let" in the evaluator
```

You can bind an expression to an identifier locally by using a `let` form:

```
let <id> = <expression> |
  <formula>
```

This is useful to avoid coat bloat due to re-use. E.g., if `s` is a state:

```
let s2 = Traces.nextState[s] |
  canTransition[s, s2]
```
