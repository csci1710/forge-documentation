# Overview

Forge is a language that allows us to define models of systems and explore instances of those models. Ok cool! So... **_what does that mean_**? Let's break it down:

<!-- --- -->

## Systems

A **system** can be generally thought of as a "world" where there are "things" that exist, and rules that govern how those "things" interact with each other. A system isn't necessarily a _computer_ system:

- A game of baseball is a world (system) where there are players, a ball, a field (things), and rules that govern how those things interact with each other.
- A family is a world where there are people, and rules that express how they are related to each other.
- A cryptographic protocol is a world where there are parties, messages, and rules that govern how those things interact with each other.
- A binary search tree is a world where there are nodes, and rules that govern how nodes are allowed to interact with each other.
- _There is no limit to the type or complexity of a system that we can discuss!_

---

## Models

A **model** is a representation of a system. It explicitly defines both the "things" that exist in the system, and the "rules" of the system.

Sets the bounds of all possible states/instances of the system.

If we wanted to model a group of friends, we might define our model to have the following structure and properties\*:

- There are `Person`s in the system.
- Each `Person` has a list of `Person`s, representing their friends.
- Each `Person` must have at least one `Person` in their friends list.

\*This seems like a very reasonable model for what we want to do, but we'll discuss some potential errors later on when talking about [instances](./overview.md#instances).

```admonish todo title="TODO: ELABORATE/REFINE LANGUAGE"

We use models to _explore_ systems ...

Notice, of course, that representations are different than the.

We can represent physical systems using a modeling language

The modeling language is the clay, and the system is the car.

In order to explore systems, we have to quantify the things and rules that exist in the system.

we have to have a representation of the system that we can explore. This representation is called a _model_.
```

### A Note on Imperfect Representations

It is very difficult to completely model some systems, especially if the system is complex and involves.

We can simplify, omit, and focus our efforts.

In the same way that you can use clay to model a car, you can use a model to represent a system. You could use the clay model to accurately determine the aerodynamics of the car's profile in a wind tunnel, but you'd have a hard time exploring how the doors of the car operate. What you can explore is limited by how the system is modeled.

Examining our model of the group of friends, we notice some simplifications/abstractions we have made:

- We have omitted
- _... and more!_

We don't have to fully describe a `Person` in our model, we just have to describe the relevant properties of a `Person`

Learning how to model a system is one of the key challenges of formal methods and modeling!
Your results are only as good as your model is!
Figuring out how to represent real-world constructs in the context of a modeling language...
There are limitations...
There are many important considerations...

---

## Instances

An **instance** is a concrete set of things and their relationships with each other, which abide by the rules of a model.

Instances are generated ... abiding by the structure and rules of our model. If the model we have made is too strict, and the rules
we won't be able to generate an instance. (_TODO: Talk about unsatisfiability/link to it somewhere else_)

It is a particular set of things that exist in a system and how those things interact with each other. Forge allows us to define models of systems and explore instances of those models.

It shows a single concrete possible state/combination of the things

Using the definition of our linked list model we saw while discussing [models](./overview.md#models), we might see the following instances.

- Node A has a value of 1, and a `next` node of Node B. Node B has a value of 2, and points to Node A. (Circularly linked list!)
-

We don't actually want

and concretely

If we are modeling a

It allows us to explore outcomes (instances) that abide by a set of rules (constraints) that we define.

---

## Modeling in Forge: Sigs and Constraints

Awesome! Hopefully this all makes sense in the abstract- but we're here to learn how to use Forge to model and explore our own systems. In Forge, we use [`Sigs`](./sigs.md) to define the "things" that exist in a system, and [`Constraints`](./constraints.md) to define the "rules" of the system.

Next, we'll learn how to use [`Sigs`](./sigs.md) and [`Constraints`](./constraints.md) to build our own models!
