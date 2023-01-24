

# Testing

## TODO
[] Organizing tests (`test suite for`)
[] Testing recipe (should this go here?)

Forge supports three different testing constructs: `example`s, `assert`s, and `test expect` blocks. 

If tests pass, they do not open the visualizer, making them well-suited for building test suites for your Forge models.

### Examples

The `example` syntax lets you test whether a specific individual instance is satisfied by some predicate in your model. Here's an illustrative `example` statement, from a model of the game Tic-TacToe, where the board indexes are `A`, `B`, and `C`:

```
example diagonalPasses is {some brd: Board | winningDiag[brd, X] } for {
  Board = `Board0
  X = `X0
  O = `O0
  A = `A0
  B = `B0
  C = `C0
  inverse = A->C + B->B + C->A
  places = Board -> (A -> A + B -> B + C -> C ) -> X
}
```

The block within the second pair of braces must always be a concrete instance. That is, a series of assignments for each sig and field to some set of tuples, defined over object names. Object names must be preceded by a backquote; this reinforces the idea that they are objects in a specific instance, rather than names in the model.

_Don't_ try to assign to the same field twice. If you want a field to contain multiple entries, use `+` instead. Remember that `=` in the context of an instance is _assignment_, not a constraint, and that most constraints won't work inside an instance.

Sig names may be used in place of objects only if the block has previously defined the value of the sig exactly, allowing straightforward substitution.

### Assert

The `assert` syntax allows you to write tests in terms of strong and weak properties of a predicate. For example, if you have two predicates `isFrog` and `isAmphibian`:

```
assert isAmphibian is necessary for isFrog
```

Tests that `isAmphibian` is a required or essential condition for `isFrog`. In other words, `isFrog` cannot occur without `isAmphibian`.

For two predicates `isPoodle` and `isDog`:

```
assert isPoodle is sufficient for isDog
```
Tests that if `isPoodle` holds, then so must `isDog`. If you want, you could also add optional bounds.

```
assert isPoodle is sufficient for isDog for 3 Dog
```


### Test-Expect Blocks

If you want to do arbitrary runs/checks for testing purposes, use a `test expect` block. Here, you don't need to provide a concrete, specific instance for the tests, but can check general properties. Here's an example `test expect` block with a variety of assertions:

```
test expect {
    {foo} is sat    -- we expect foo to be sat and raise an error otherwise
    {bar} is unsat  -- we expect bar to be unsat and raise an error otherwise
    mytest : {foo} is sat        -- tests can (and should!) be named
    {foo} for 3 Node is sat      -- bounds can be given
    {foo} for inst is sat        -- concrete instances can be given
}
```

### Interaction with Check-ex-spec

~~If you are using a version of Forge that supports Check-ex-spec, and are working on a Check-ex-spec assignment, both of these two forms will be recognized by Check-ex-spec as providing a concrete test. However, not all assignments are supported by Check-ex-spec; see writeups for more details.~~


## Organizing Your Tests


