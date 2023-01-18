# Sterling Visualizer

When you run your spec, depending on the type of run you use, Forge will either look for instances that satisfy the predicates you wrote, or look for counterexamples to the assertion you wrote. When it finds them (or doesn't) it launches a window in your browser that displays the instances. See the run and check sections for the different displays Sterling has in various scenarios.

The basic representation of the visualization is a graph showing all the atoms in that instance and the relations between them. You can also view an alternate depiction of the instance in the table view tab. To keep visualizations neat, Sterling will not show you any Int atoms that are not in any relation in that instance.

**Temporal Mode**

In temporal mode, and when the trace found is of length greater than 1, Sterling will enable a few new features:

- You can advance back and forth through the trace by using the arrow buttons in the edge styling panel. Next to these buttons, Sterling will say which state the lasso loops back to. For instance, "Loop: 1" would mean that the lasso loops back to the second state (states are 0-indexed).
- Rather than one "Next" button, you'll see two: one labeled "Next" and the other "Next Config".
  - The "Next Config" button will ask the solver for a new trace that _varies the non-variable relations_ of your model. If all your relations are variable, or if other constraints prevent a different non-variable subset of the instance from satisfying your run, this button will lead to a no-more-instances screen.
  - The "Next" button will ask the solver for a new trace that _holds the non-variable relations constant_. If there are no other traces possible without changing the non-variable relations, this button will lead to a no-more-instances screen.

#### Evaluator

The evaluator provides a repl that lets you query instances with a language very similar to Forge itself. There are some minor differences between the evaluator language and Forge itself:

- Individual atoms can be directly referenced by name
- Exact values of expressions are returned
- Higher order quantification is allowed

Other minor differences may exist as language features are added.

The evaluator can also be given commands like `--version` (`-v`) to show the version of Forge being used or `--help` (`-h`) to show the file being run.

**Temporal Mode**

If running in temporal mode, the evaluator is run in the context of the first state of the trace shown. To ask about later traces, use the `'` or `after` operators. Remember that `after` applies to formulas, and `'` applies to relational expressions. So in a directed graph you could ask whether there are `edges` in the second state via `some edges'` or `after some edges`.

#### Custom Visualizations: Script View

You can find documentation on the Alloy visualization library, which you use to write scripts in Sterling, [here](https://alloy-js.github.io/alloy-ts/). A basic example, to help you get started, can be found [here](http://cs.brown.edu/courses/csci1710/pages/notes/js/feb8.js). A more advanced example, involving "visualizing" music, is [here](https://github.com/miasantomauro/mia-isp-spring-2021/tree/main/musical%20scales).
