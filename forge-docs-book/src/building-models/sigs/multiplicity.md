# Field Multiplicity

```admonish danger title="TODO"
- Define Arity (PRIO_HIGH)
  - Precursor understanding to introduce the concept of Arity to begin with (PRIO_HIGH)
- Func & Pfunc definition refresher (PRIO_HIGH)
- Elaborate
- Examples
- ...
```

Given a field `f` with type `A`, the set of possible multiplicities is:

- `set`: a set of values (this field may contain any number of objects);
- `one`: a singleton value (this field always contains a single object); and
- `lone`: either a singleton value or no value (this field contains 0 or 1 object).

Given a higher-arity field `f` with type `A -> ... -> Y -> Z`, multiplicities constrain the nature of the _tuples_ in the field. The set of possible multiplicities is:

- `set`: a set of tuples (this field may contain any number of tuples);
- `func`: the field is a total function from `A -> ... -> Y` to `Z` (every possible input tuple must have exactly one output value); and
- `pfunc`: the field is a partial function from `A -> ... -> Y` to `Z` (every possible input tuple has either one output value or is not mapped by the function).

Fields declared as `pfunc` are analogous to maps or dictionaries in an object-oriented programming language: some keys may not map to values, but if a key is mapped it is mapped to exactly one value.
