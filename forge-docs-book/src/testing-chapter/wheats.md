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

We have found the following testing-writing stratgies useful when interacting with the wheat.
These are recommendations, you do not **have** to follow these strategies!

## Strategy 1

1. Write example behaviors that you believe the wheat would allow and non-examples that the wheat would rule out in terms of Forge’s example syntax.
   1. Run your test file to check your examples and non-examples against the wheat. Revise any that fail the check.
2. Study your examples and develop properties that are **necessary** for the wheat to hold. For each property:
   1. Add examples to the test suite for this necessary property, to make sure the property works as you intend.
   1. Using `assert necessary`, check that your property is really less specific than the wheat.
   1. If the property is not less specific than the wheat, add tests to your test-suite to figure out why.
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



