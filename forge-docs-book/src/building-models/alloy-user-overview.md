# Addendum for Alloy Users

Forge syntax and semantics are nearly identical to Alloy 6. There are some minor differences. E.g.:
- Forge eschews the `fact` construct and `sig`-facts in favor of using predicates.
- Forge disallows some complex field declaration (Forge fields always have exactly one multiplicity keyword and a product of sig names).
- Forge introduces `test expect` blocks for testing, among other improved testing features. It also supports partial instances via the `inst` keyword.
- Activating `option problem_type temporal` enables the use of Alloy6-style LTL. Due to user-experience concerns, we have changed the name of the `after` operator to `next_state`.
