# Singleton and Maybe Sigs

```admonish danger title="TODO"
- Elaborate (PRIO_LOW)
```

<!-- Didn't make sense to talk about this before Field Multiplicity (introducing the concept of one/lone even though these arent 'field' multiplicities, so moved til after) -->

You can tell Forge that a given `sig` is always a singleton (i.e., only ever instantiated exactly once) or singleton-if-populated by using the `one` and `lone` keywords in the definition:

```
one sig SingletonObject {}
lone sig MaybeDoesntExist {}
```
