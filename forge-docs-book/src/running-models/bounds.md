# Bounds

Forge is a _bounded_ model finder, meaning it can only look for instances up to a certain bound. You can specify bounds in two seperate ways in Forge: using numeric bounds or instance bounds.

## Numeric bounds

The most basic way of specifying bounds in Forge is providing a maximum number of objects for each `sig`. If no bound is specified, Forge defaults to allowing up to 4 of each `sig` (except for Ints, where the bound specifies the bitwidth).

E.g., to add a bound to a `run` command in a model with `Atom` and `Node` sigs, you would write something lioke:

```
run { ... } for 5 Atom
run { ... } for 5 Atom, 2 Node
```

Note that this sets an upper bound on the size of instances Forge will show you. In other words, Forge will only search for instances of size **up to** the bound you specify (except Ints, where the set of integers is always fixed exactly by the bitwidth). If you instead want to set an **exact** bound, you can do:

```
run { ... }  for exactly 5 Atom
run { ... }  for exactly 5 Atom, exactly 4 Node
```

You can also mix-and-match exact and upper bounds as follows:

```
run <pred> for 5 Atom, exactly 4 Node  -- up to 5 Atom, but exactly 4 Node
```

## Instance bounds

Instance bounds allow you to encode specific partial instances that you want Forge to run on. When creating an instance bound, you give upper and lower bounds in terms of concrete objects, not as numbers. This allows you to test your predicates on a specific instance, which can be convenient. It is also usefulfor optimization in some cases. The syntax for defining an instance bound is show below for a model with an `Atom` sig and binary relation `rel` from `Atom` to `Atom`:

```
inst myAtomWorld {
    Atom = `Atom0 + `Atom1 + `Atom2
    rel = `Atom0->`Atom1 + `Atom1->`Atom2 + `Atom2->`Atom1
}
```

Note that Forge expects concrete object names to be prefixed with a backquote; this is mandatory, and used to distinguish object names from sigs, fields, predicates, and other kinds of identifiers.

To run or check using this as a bound, you can simply do:

```
run { ... } for myAtomWorld
check { ... } for myAtomWorld
```

See the run section for more information on how to write `run` and `check` statements.

See the \[\[Instance Documentation|Concrete-Instance-Bounds]] for more information about writing instance bounds.
