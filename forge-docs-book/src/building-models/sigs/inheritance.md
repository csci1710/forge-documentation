# Inheritance

Sigs may inherit from other sigs via the `extends` keyword:

```clike
sig Cat {
    favoriteFood: one Food
}
sig ActorCat extends Cat {}
sig ProgrammerCat extends Cat {}
```

This means that any `ProgrammerCat` object is also a `Cat` object, and so will have a `favoriteFood` field.

```admonish warning title="Warning!"
**Sigs are Disjoint by Default!** Any two sigs `A` and `B` will never contain an object in common unless one is a descendent of the other. So in this example, no `Cat` can ever be both a `ProgrammerCat` and `ActorCat`.
```
