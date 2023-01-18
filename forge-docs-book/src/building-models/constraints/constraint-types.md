# Constraint Types

Elements of Forge constraints are one of three types:

- **formulas**, which evaluate to booleans;
- **expressions**, which evaluate to relations, and
- **integer expressions**, which evaluate to integers (possibly with overflow, depending on the current bitwidth).

Attempting to use operators with the wrong kind of arguments (e.g., taking the `and` of two `sig`s) will produce an error in Forge when you try to run your model.

### Temporal operators

For more information on temporal operators, which are only handled if `option problem_type temporal` is given to Forge, see Electrum Mode. We maintain these on a separate page because the meaning of constraints can differ in Electrum mode. Concretely, in Electrum mode Forge will **only** find instances that form a lasso trace.
