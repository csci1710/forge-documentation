# What is a Wheat?

Included in Forge assignments are solution file(s) for each part of the assignment.
These are referred to as _wheats_, and have the `.wheat` file extension.
These _wheats_ allow you to check your understanding of the problem using tests. As long as you can
express your question about the assignment as a test, you can receive an authorotative answer from the wheat!

To run tests in your test file (e.g. `stacks.test.frg`) using the wheat solution, follow these steps:

- Replace `open` statements to your implementation file (ex. `stacks.frg`) with the associated wheat.
  For example, you may replace `open "stacks.frg"` with `open "stacks.wheat"`. _Ensure not open both files at the same time._
- Run your tests file in Racket. All associated tests will be run against the _wheat_ instead of your implementation.

_Wheats_ only implement top level predicates of a project. Tests that deal with the specific internals of _your_ implementation
will not be able to be run against the wheat.

# Test Writing Strategies

**We recommend the following recipe for writing tests**. While we have found these very helpful, you do not *have* to follow these strategies.

## Strategy 1

1. Write example behaviors that you believe the wheat would allow and non-examples that the wheat would rule out in terms of Forge’s example syntax.
   1. Run your test file to check your examples and non-examples against the wheat. Revise any that fail the check.
2. Study your examples and develop properties that are **necessary** for the wheat to hold. For each property:
   1. Add examples to the test suite for this necessary property, to make sure the property works as you intend.
   1. Using `assert necessary`, check that your property is really necessary for the wheat.
   1. If the property is not necessary for the wheat, add tests to your test-suite to figure out why.
3. Now test that the conjunction of your necessary properties is **sufficient** for the wheat.
   1. If this test succeeds, you are done. This conjunction reflects all the characteristics of a correct solution.
   1. If this test fails, Forge will provide you with counter-example(s) illustrating scenarios where all your necessary properties are true, but the wheat is not.
   1. Write some of these counter examples as non-examples of the wheat. Return to step 2



## Strategy 2

For each predicate `p` surfaced by the wheat:

1. Write behaviors that p would allow and behaviors that the p would rule out in terms of either Forge’s example syntax or sufficient properties of the wheat. 
    1. Run your test file to check these tests against the wheat. Revise any that fail the check.
2. Study these tests and develop properties that are necessary for p to hold. For each *necessary* property (`n`):
    1. Add tests (examples or sufficient properties) of `n` to make sure the property works as you intend.
    2. Using `assert necessary`, check that `n` is really less specific than p.
    3. If `n` is not less specific than p, add tests to your test-suite to figure out why.
3. Now test that the conjunction of your necessary properties is **sufficient** for the wheat.
   1. If this test succeeds, you are done. This conjunction reflects all the characteristics of a correct solution.
   1. If this test fails, Forge will provide you with counter-example(s) illustrating scenarios where all your necessary properties are true, but the wheat is not.
   1. Write some of these counter examples as non-examples of the wheat. Return to step 2


## Walking through Strategy 1

Let's put Strategy 1 into action by  figuring out how to implement a predicate describing a directed tree.

```
sig Node {edges: set Node}

pred  {
   ...
}
```

 **Step 1**: Write some examples and counter-examples of this predicate, and make sure they pass the wheat.

```

test suite for isUndirectedTree {
    example line is {isDirectedTree} for
    {
        Node = `Node0 + `Node1 + `Node2 
        edges = `Node0->`Node1 + `Node1->`Node2 
    }

    example MultipleRoots is {not isDirectedTree} for
    {
        Node = `Node0 + `Node1 + `Node2 + `Node3 + `Node4
        edges = `Node0->`Node1 + `Node1 -> `Node2 + `Node1->`Node3 + `Node4->`Node1
    }
 }
```

**Step 2**: The two examples above pass the wheat. We now look at them, trying to see if they describe a necessary property of `isDirectedTree`.
While there are many such properties, one that immediately comes to mind is: "Each node in the tree can have at most one parent.".

As a result, you may write the following weak property:

```
pred atMostOneParent {
    edges.~edges in iden
}
```

We should substantiate this property with some tests. Notice that these are tests for `atMostOneParent`, not `isDirectedTree`.
```
test suite for atMostOneParent {
        example points is {atMostOneParent} for
    {
        Node = `Node0 + `Node1 + `Node2 
        no edges
    }
    // More tests

}
```

Now, we can assert that this is indeed a necessary property of the wheat.

```
assert atMostOneParent is necessary for isDirectedTree
```

If this fails the wheat, add more examples to the test suite for `atMostOneParent` to figure out why.
Perhaps the property needs to be revised.

Repeat **Step 2** to come up with more necessary properties.


** Step 3**: Say we now have 2 properties necessary for isDirectedTree: `noLoops` and `atMostOneParent`.
Write a predicate to check the conjunction of these 2 properties and check if it is
sufficient for the wheat. If this test succeeds, your necessary properties characterize the wheat. You can
use these properties to write your solution!


```
pred allNecessary {
    noLoops
    atMostOneParent
}

assert allNecessary is sufficient for isDirectedTree
```

In this case, however, these 2 proeprties are not sufficient for `isDirectedTree`. Upon running this test
against the wheat, Forge will provide you with an instance where 
all your necessary properties are true, but the wheat is not.

Write this out as an counter-example (ie a non-example of the wheat), and return to step 2.


