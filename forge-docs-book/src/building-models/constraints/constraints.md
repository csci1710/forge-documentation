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

Then we have a contingency: _if_ a student has gotten an A.B., then something is required. In Forge, this becomes an implication inside the quantifier: 

```
all s: Student | s.degreeGranted = AB implies {...}
```

But let's look more closely at the part we wrote: `s.degreeGranted = AB`. For a given student, that is also either true or false. But something important is different inside the `=`: `s.degreeGranted` doesn't denote a boolean, but rather an _object_ (which will perhaps be equal to `AB`). Let's finish writing the constraint and then color-code the different parts:

```
all s: Student | s.degreeGranted = AB implies {
  some disj course1, course2: Course | course1.pathway = course2.pathway
}
```




<!--
Forge, under the hood, already has

So our job is to write rules, which the existing instructions...

Modeling languages are fundamentally different in that the programmer

With different goals, we have a different development paradigm. -->

(Very) Roughly:

- In OOP languages, we build <ins>software</ins> using "things" and "**<ins>instructions</ins>**."
- In Forge, we build <ins>models</ins> using "things" and "**<ins>rules</ins>**."

We've already discussed "things" in Forge ([`sigs`](../sigs/sigs.md)) and how they are roughly analogous to "things" in OOP languages (objects). However, "**instructions**" and "**rules**" are quite different...

You are most likely familiar with writing programs in some languages like Python, Java, C, Racket, Javascript, etc. If you want the computer to perform a task, you have to explicitly write **instructions** to tell the computer to do that (i.e. writing a for loop to print the numbers 1-100).

<!-- Forge, on the other hand, already has instructions (solver\*) -->

Forge, on the other hand, already has instructions: Forge outputs all possible instances/states of a model based on the way you have defined the model. Forge will only output instances of the model that follow all of the **rules** you have written.

 <!-- uses **rules** that you write to only provide you with valid instances of a model. This is a fundamentally different way to think about "building" something, for the following reason: -->

<!-- analyzes the model you define and outputs all the possible instances that follow the structure and rules of the model\*. With fewer rules, more things are acceptable instances of the model! -->

- Given a lack of **instructions**, a Java program won't do anything.
- Given a lack of **rules**, Forge will generate all possible [instances](../overview.md#instances) of the given model.\*



In Forge, we use _Constraints_ to represent the "rules" of the system we are modeling, and [Sigs](../sigs/sigs.md) to represent the "things" of the system we are modeling.

A reader familiar with ... might skip to []() for the technical docs...

- students/grades example:
  Take an english rule, break it down. what syntax do we need to express this as a rule?

- By the way, weird context dependence thing, talk about next...
  \
  \
  \
  \
  \
  \
  \
  \
  \
  \
  \
  \

\
\
\
\
\
\
\
\
\
\
\
\

In order to understand constraints, we'll first touch on some key differences between modeling languages and traditional programming languages, and then explore an example to motivate and contextualize how constraints are used.

<!-- In order to understand constraints and how they work, we need some context about modeling languages: -->

(If you are already familiar with the overview and looking for the technical implementation of constraints in Forge, you can start [on this page](../constraints/constraint-types.md))

---

Elements of Forge constraints are one of three types:

- **formulas**, which evaluate to booleans;
- **expressions**, which evaluate to relations, and
- **integer expressions**, which evaluate to integers (possibly with overflow, depending on the current bitwidth).

Attempting to use operators with the wrong kind of arguments (e.g., taking the `and` of two `sig`s) will produce an error in Forge when you try to run your model.

### Temporal operators

For more information on temporal operators, which are only handled if `option problem_type temporal` is given to Forge, see Electrum Mode. We maintain these on a separate page because the meaning of constraints can differ in Electrum mode. Concretely, in Electrum mode Forge will **only** find instances that form a lasso trace.

---

_Constraints_ are comprised of **formulas**, and **expressions**. Formulas evaluate to a boolean value (true or false), and expressions evaluate to a "thing" in our model.

By combining...writing

We can enforce that something is always/sometimes/never true...

-
- Talk about the goals specifically

When writing constraints for our model, we need to be able to do two things:

<!--
Recall that in the overview of [what a model is](../overview.md#models), we said that a model

> "...explicitly defines both the "things" that exist in the system, and the "rules" of the system." -->

---

<!--
_TODO: BEFORE TALKING ABOUT IMPL DETAILS OF CONSTRAINTS IN FORGE, LET'S TALK ABOUT HOW CONSTRAINTS PLAY INTO BUILDING MODELS BY LOOKING AT AN EXAMPLE_ -->

... TBD WIP

### TBD, maybe even remove separation

_TESTING LANGAUGE BELOW, NOT FINAL:_

Recall that one

Let's bring back the [linked list](../../building-models/sigs/sigs.md#admonition-example-sig-w-one-field) example we saw when learning about sigs:

```
sig Node {
    next: one Node
}
```

If the point of modeling linked-lists is to learn things about the linked-list systems, we have to

<!--
![LinkedList-Normal](../../../images/constraints/LinkedList-normal.png)
![LL-Weird-A](../../images/constraints/LinkedList-weird-A.png) -->

![Linked-List-Weird-B](../../images/constraints/LinkedList-weird-B.png)

Let's look at the example we first introduced when discussing sigs, [a linked list](../../building-models/sigs/sigs.md#admonition-example-sig-w-one-field)

We _constrain_ the acceptable outputs of the model by defining more rules and being more specific about the constraints of the model. In general, the more rules we add, the fewer acceptable outputs.

a model with a lack of rules just means that you are allowing lots of things to be acceptable instances of the model!

Forge will by default try and give you all possible instances

<!-- In Forge, the computer already has a set of instructions: construct instances of the model based on how you defined the "things" and "rules" of the model. -->


```admonish info title="Next steps"


```

