# Constraints

Once the model has defined the kinds of objects it deals with, it defines how those objects can interact. This process is sometimes called "adding constraints" or "rules".

<!--
```admonish danger title="TODO"
- **PAGE IS UNFINISHED!**:
  - Needs re-wording past Rules vs. Instructions, perhaps refactoring to different page
  - Fit the linked list example in there somehow
  - Needs transition statement into constraint types and such
- Clarify or remove * relating to "can/will generate many instances of a model." Well, will Forge **always** do this?
- Add * caveat about "not all possible instances because of inherent bounds (and then link to bounds chapter)
``` -->

## Rules vs. Instructions

This idea of a "constraint" is key in Forge (and in many other modeling languages), and it's very different from programming in a language like Java, Pyret, or Python.

When you're programming traditionally, you give the computer a set of instructions and it follows those instructions. This is true whether you're programming functionally or imperatively, with or without objects, etc. In contrast, modeling languages like Forge work differently. The goal of a Forge model isn't to _run instructions_, but rather to express relationships between objects and rules that govern systems. 

Here's a useful comparison to help reinforce the difference (with thanks to Daniel Jackson):
- Given a lack of **instructions**, a program does nothing.
- Given a lack of **constraints**, a model allows everything.

## Example: Concentration Requirements

Let's get concrete. [The concentration requirements for an A.B. in CSCI](https://cs.brown.edu/degrees/undergrad/concentrating-in-cs/concentration-requirements-2020/new-ab-requirements/) state that to get an A.B., a student must (among other things) complete a pathway, which comprises two upper-level courses that are considered related. We might rewrite this as:

> "Every student who gets an A.B. must have passed two 1000-level courses in the same pathway."

If we're modeling concentration requirements, we might decide to create `sig`s for `Student`, `Course`, `Pathway`, and so on, with fields you'd expect. For example, we might create:

```
sig Student {
  -- dictionary of grades for courses taken and passed
  grades: pfunc Course -> Grade
}
```

But this only describes the shape of the data, not the concentration requirements themselves! To do that, we need to create some constraints. The sentence above states a requirement for _every student_. Generally the department follows this rule. But it's possible to imagine some semester where the department makes a mistake, and gives an A.B. degrees to someone who hadn't actually finished a pathway. The sentence is something that could be true or false in any given semester:

> "<span style="color:blue">Every student</span> who gets an A.B. must have passed two 1000-level courses in the same pathway."

In Forge, we'd write this using a quantifier: 

```
all s: Student | ...
```

Then we have a condition that triggers a requrement: _if_ a student has gotten an A.B., then something is required. In Forge, this becomes an implication inside the quantifier: 

```
all s: Student | s.degreeGranted = AB implies {...}
```

Let's look more closely at the part we wrote: `s.degreeGranted = AB`. For a given student, that is also either true or false. But something important is different inside the `=`: `s.degreeGranted` doesn't denote a boolean, but rather an _object_ (which will perhaps be equal to `AB`). A similar thing is true for `s`, `course1`, and `course2`. Let's finish writing the constraint and then color-code the different parts:

<pre><code><span style="color:green">all <span style="color:red">s</span>: Student |</span> <span style="color:red">s.degreeGranted</span> <span style="color:green">=</span> <span style="color:red">AB</span> <span style="color:green">implies { 
  some disj <span style="color:red">course1</span>, <span style="color:red">course2</span>: Course |</span> <span style="color:red">course1.pathway</span> <span style="color:green">=</span> <span style="color:red">course2.pathway</span>
<span style="color:green">}</span>
</code>
</pre>

### Writing Constraints: Formulas vs. Expressions

The top-level constraints that Forge works with must always evaluate to booleans, but the inner workings of constraints can speak about specific objects, the values of their fields, and so on. We'll make the distinction between these two different kinds of syntax:
* _Formulas_ always evaluate to booleans---i.e., either true or false; and
* _Expressions_ always evaluate to objects or sets of objects. 

```admonish warning title="Forge isn't 'truthy'"
Unlike what would happen in a programming language like JavaScript or Python, attempting to use an expression in place of a formula, or vice versa, will produce an error in Forge when you try to run your model. For example, if we wrote the constraint `all s: Student | s.grades`, what would that mean? That every `s` exists? That every `s` has passed some class? Something different? To avoid this ambiguity, Forge doesn't try to infer your meaning, and just gives an error.
```

### Context for Evaluating Constraints: Instances

Notice that there's always a context that helps us decide whether a constraint yields true or false. In the above example, the context is a collection of students, courses taken and degrees granted. For some other model, it might be a tic-tac-toe board, a run of a distributed system, a game of baseball, etc. We'll call these  _instances_.

* _Instances_ contain objects and field values that make it possible to tell whether constraints have been satisfied or not. 

<!-- A reader familiar with ... might skip to []() for the technical docs...

(If you are already familiar with the overview and looking for the technical implementation of constraints in Forge, you can start [on this page](../constraints/constraint-types.md)) -->

---

<!--
_TODO: BEFORE TALKING ABOUT IMPL DETAILS OF CONSTRAINTS IN FORGE, LET'S TALK ABOUT HOW CONSTRAINTS PLAY INTO BUILDING MODELS BY LOOKING AT AN EXAMPLE_ -->

<!-- Let's bring back the [linked list](../../building-models/sigs/sigs.md#admonition-example-sig-w-one-field) example we saw when learning about sigs:

```
sig Node {
    next: one Node
}
```

If the point of modeling linked-lists is to learn things about the linked-list systems, we have to -->

<!--
![LinkedList-Normal](../../../images/constraints/LinkedList-normal.png)
![LL-Weird-A](../../images/constraints/LinkedList-weird-A.png) -->

<!-- ![Linked-List-Weird-B](../../images/constraints/LinkedList-weird-B.png)

Let's look at the example we first introduced when discussing sigs, [a linked list](../../building-models/sigs/sigs.md#admonition-example-sig-w-one-field)

We _constrain_ the acceptable outputs of the model by defining more rules and being more specific about the constraints of the model. In general, the more rules we add, the fewer acceptable outputs.

a model with a lack of rules just means that you are allowing lots of things to be acceptable instances of the model!

Forge will by default try and give you all possible instances -->

<!-- In Forge, the computer already has a set of instructions: construct instances of the model based on how you defined the "things" and "rules" of the model. -->

## Next Steps

The next sections describe [formula](./formulas/formulas.md) and [expression](./expressions/expressions.md) syntax in more detail. A reader familiar with this syntax is free to skip to the section on [instances](./instances.md), or progress to [running models](../../running-models/running.md) in Forge.

```admonish info title="Temporal Models"
For more information on _temporal_ operators, which are only handled if `option problem_type temporal` is given to Forge, see the page on [Temporal Mode](../../electrum/electrum-overview.md). We maintain these in separate chapter because the meaning of constraints in this mode can differ subtly, and temporal mode is only introduced later in the course.
```
