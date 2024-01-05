# Addendum for Alloy Users

All Forge languages (as of January 2024) are restricted versions of Alloy 6, with some added features. 

Relational Forge syntax and semantics are nearly identical to Alloy 5. Similarly, Temporal Forge approximates Alloy 6. There are some minor differences. E.g.:
- All Forge languages eschew the `fact` construct and `sig`-facts in favor of using predicates.
- Forge disallows some complex field declaration. Instead, Forge fields always have exactly one multiplicity keyword and a product of sig names.
- Forge introduces `test expect` blocks for testing, among other improved testing features. It also supports partial instances via the `inst` keyword.
- Due to user-experience concerns, we have changed the name of the `after` temporal operator to `next_state`.
