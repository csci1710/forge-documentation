
Inlcuded in Forge assignments are solution file(s) for each part of the assignment. 
These are referred to as *wheats*, and have the `.wheat` file extension.

These *wheats* allow you to check your understanding of the problem using tests. As long as you can
express your question about the assignment as a test, you can receive an authorotative answer from the wheat!


We have found the following testing-writing stratgies useful when interacting with the wheat.
These are recommendations, you do not **have** to follow these strategies!



## Test Writing Strategy 1


1. Write example behaviors that you believe the wheat would allow and non-examples that the wheat would rule out in terms of Forge’s example syntax.
    1. Run your test file to check your examples and non-examples against the wheat. Revise any that fail the check.
2. Study your examples and develop properties that are **necessary** for the wheat to hold. For each property:
    1. Add examples to the test suite for this necessary property, to make sure the property works as you intend.
    1. Using `assert necessary`, check that your property is really less specific than the wheat.
    1. If the property is not less specific than the wheat, add tests to your test-suite to figure out why.
3. Now test that  the conjunction of your weak properties is **sufficient** for the wheat. 
   1. If this test succeeds, you are done. This conjunction reflects all the characteristics of a correct solution.
   1. If this test fails, Forge will provide you with counter-example(s) illustrating scenarios where all your necessary properties are true, but the wheat is not. 
   2. Write some of these counter examples as non-examples of the wheat. Return to step 2


