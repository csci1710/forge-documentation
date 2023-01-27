# Options

Forge has a number of options that affect how it functions and how its solver is configured. They all have the same form: `option <key> <value>`. **Settings are case sensitive.** The available setting keys are:

* `verbose`: governs the amount of information provided in the REPL. `1` is standard; `0` will omit statistical information (useful for test suites); `10` will print exceedingly verbose debugging information. Values between `1` and `10` gradually increase verbosity.
* `solver`: sets the solver used by Forge's worker process. The default is `SAT4J`, a Java-based solver. Other solvers can be more performant, and produce different instance orderings, depending on model. The `MiniSatProver` solver will enable extraction of unsat cores. Support for native solvers varies by OS. Currently: 
  * MacOS (x64 and arm64 `.dylib`):
    * `MiniSat`, `MiniSatProver`, and `Glucose`
  * Linux (`.so`): 
    * `MiniSat`, `MiniSatProver`, and `Glucose`
  * Windows (`.dll`):
    * `MiniSatProver`
* `logtranslation`: controls how much of the translation from Forge to boolean logic is logged. The default is `0`; must be `1` or higher to extract unsatisfiable cores.
* `coregranularity`: controls how fine-grained an unsatisfiable core will be returned. Default is `0`. Suggested value is `1` if you want to see cores.
* `core_minimization`: controls whether cores are guaranteed minimal. Default is `off`. For minimal cores, use `rce`; `hybrid` is not guaranteed minimal but is often better than `off` while being faster than `rce`.
* `sb`: controls maximum size of symmetry-breaking predicate. `20` is default. Higher numbers increase Forge's ability to rule out equivalent instances, at a potential performance cost.
* `skolem_depth`: gives how many layers of universal quantifiers to Skolemize past. Default is `0`; to disable Skolemization, give `-1`.
* `engine_verbosity`: sets the Logger level used by Pardinus (default=0). The following table is current as of version 1.5.0 (when the option was added):
```
case 0 : return Level.OFF;
case 1 : return Level.SEVERE;
case 2 : return Level.WARNING;
case 3 : return Level.INFO;
case 4 : return Level.FINE;
case 5 : return Level.FINER;
case 6 : return Level.FINEST;
default : return Level.ALL;
```
* `run_sterling`: decides whether to use the Sterling visualizer. Default is `on`. To disable, give `off`.
* `sterling_port`: sets the port used by the Racket web-server that Sterling connects to. The default picks an unused ephemeral port.
* `problem_type`: used to enable `temporal_mode` for Alloy6-style LTL support.

~~~admonish warning title="Location matters!"

Options apply from the point they occur onward until either the file ends or the same setting is changed. For instance, only the second `run` command in this example will print verbose debugging information.

```
sig Node {edges: set Node}
run {}
option verbose 10
run {}
option verbose 1
run {}
```
~~~
