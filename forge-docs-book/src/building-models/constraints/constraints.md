# Constraints

```admonish danger title="TODO"
- Figure out how to talk about solvers, do we have another page for it? How do we address what Forge is doing "Under the Hood" ?
```

<!--
```admonish danger title="TODO"
- **PAGE IS UNFINISHED!**:
  - Needs re-wording past Rules vs. Instructions, perhaps refactoring to different page
  - Fit the linked list example in there somehow
  - Needs transition statement into constraint types and such
- Clarify or remove * relating to "can/will generate many instances of a model." Well, will Forge **always** do this?
- Add * caveat about "not all possible instances because of inherent bounds (and then link to bounds chapter)
``` -->

In Forge, we use _Constraints_ to represent the "rules" of the system we are modeling, and [Sigs](../sigs/sigs.md) to represent the "things" of the system we are modeling.

In order to understand constraints, we'll first touch on some key differences between modeling languages and traditional programming languages, and then explore an example to motivate and contextualize how constraints are used.

<!-- In order to understand constraints and how they work, we need some context about modeling languages: -->

(If you are already familiar with the overview and looking for the technical implementation of constraints in Forge, you can start [on this page](../constraints/constraint-types.md))

<!--
Recall that in the overview of [what a model is](../overview.md#models), we said that a model

> "...explicitly defines both the "things" that exist in the system, and the "rules" of the system." -->

## Rules vs. Instructions

Before talking about how we define the "rules" of a system in Forge, let's touch on an important distinction between traditional programming languages and Forge:

In many traditional programming languages, you give the computer a set of instructions and the computer follows those instructions. In OOP languages, you can also use objects to help structure your code and even organize the logic of instructions.

The goals of modeling languages are different than the goals of traditional programming languages, in that the goals of modeling languages are specifically to provide a set of tools to describe and express the structure and behavior of a model.

Because the goals are different, so are the ways of "programming" in the language.

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

Generally speaking: with fewer rules, there are more outputs which are considered valid instaces of the model! But of course, the point is to create a model whose acceptable instances match the acceptable instances of the system we are trying to represent. **The rules we write _constrain_ what we consider to be the acceptable behavior of the model, and are therefore called _Constraints_**!

This can be a tricky concept to grasp, so let's take a look at an example to motivate and contextualize how we should use constraints.

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

Many people are tempted to tell Forge

What Forge is basically doing....

---
