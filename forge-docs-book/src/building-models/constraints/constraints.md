# Constraints

```admonish danger title="TODO"
- **PAGE IS UNFINISHED!**:
  - Needs re-wording past Rules vs. Instructions, perhaps refactoring to different page
  - Fit the linked list example in there somehow
  - Needs transition statement into constraint types and such
- Clarify or remove * relating to "can/will generate many instances of a model." Well, will Forge **always** do this?
- Add * caveat about "not all possible instances because of inherent bounds (and then link to bounds chapter)
```

In Forge, we use _Constraints_ to represent the "rules" of the system we are modeling, and [Sigs](../sigs/sigs.md) to represent the "things" of the system we are modeling. In order to understand constraints and how they work, we need some context about modeling languages:

(If you are already familiar with the overview and looking for the technical implementation of constraints in Forge, you can start [on this page](../constraints/constraint-types.md))

<!--
Recall that in the overview of [what a model is](../overview.md#models), we said that a model

> "...explicitly defines both the "things" that exist in the system, and the "rules" of the system." -->

## Context & High-Level Overview

### Rules vs. Instructions

Before talking about how we define the "rules" of a system in Forge, let's touch on an important distinction between traditional programming languages and Forge:

In many traditional programming languages, you give the computer a set of instructions and the computer follows those instructions. In OOP languages, you can also use objects to help structure your code and even organize the logic of instructions.

Roughly:

- In OOP languages, we build <ins>software</ins> using "things" and "**<ins>instructions</ins>**."
- In Forge, we build <ins>models</ins> using "things" and "**<ins>rules</ins>**."

We've already discussed "things" in Forge ([`sigs`](../sigs/sigs.md)) and how they are roughly analogous to "things" in OOP languages (objects). However, "**instructions**" and "**rules**" are quite different...

- Given a lack of **instructions**, a Java program won't do anything.
- Given a lack of **rules**, Forge will generate all possible [instances](../overview.md#instances) of a given model.\*

Forge is not a traditional programming language, it's a modeling language! Forge analyzes the model you define and outputs all the possible instances that follow the structure and rules of the model\*. With fewer rules, more things are acceptable instances of the model!

The point is to create a model that behaves in the way the system we are trying to represent behaves. The rules we write **constrain** the acceptable behavior of the model, and are therefore called _Constraints_!

---

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
