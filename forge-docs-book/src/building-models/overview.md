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

A **model** is a representation of a system. It explicitly defines both the "things" that exist in the system, and the "rules" of the system. The model's description of a system effectively establishes the bounds of all possible states/instances of the system. We can therefore use the model to explore what scenarios are possible within the bounds of our model, and therefore make inferences and assertions about the system it represents.

If we wanted to model a group of friends, we might define our model to have the following structure and properties\*:

- There are `Person`s in the system.
- Each `Person` has a list of `Person`s, representing their friends.
- Each `Person` must have at least one `Person` in their friends list.

(\*This seems like a very reasonable model for what we want to do, but we'll discuss some potential errors later on when talking about [instances](./overview.md#instances)).

### A Note on Imperfect Representations

It is very difficult to fully model some systems, especially if the system is complex and involves many intricate sub-systems. That being said, we don't need to fully model a system to be able to make useful inferences about the system.

We can simplify, omit, and abstract concepts/attributes to make models that approximate the system while preserving the fundamental parts of the system we are analyzing.

We can easily see this principle applied in physical engineering! For example, you could use a solid clay model of a car to accurately determine the aerodynamics of the car's profile in a wind tunnel, but you'd have a hard time exploring how the doors of the car operate or how any of the interior parts work. What you can explore is limited by how the system is modeled. If all you care about is exploring the aerodynamic profile of a car, then we can safely abstract out the internals of the car and focus on the shape of the car. There's no need to represent things in our model that we aren't interested in exploring!

In our "friend group" system example, we don't have to fully describe a `Person` in our model, we just have to describe the relevant properties of a `Person`.

We abstract the idea of "friendship," combining all types of friends (best friend, acquaintance, etc.) into a single concept of "friend." We omit from our model the concept of a `Person`'s dietary restrictions. These are all choices (_sometimes unintentional_) that affect the scope of our model.

If we wanted to distinguish between types of friends, or examine familial relationships as well, we would have to expand the model to include those concepts.

```admonish todo title="TODO: Tim (Meaningful conclusion/motivation paragraph) For example:"
_Learning how to model a system is a key skill, not just within formal methods and modeling, but in fundamentally changing the way you approach identifying and being able to identify the limitations of the models you create.!_
```

---

## Instances

An **instance** is a concrete scenario that abides by the rules of a model, containing _specific_ and _concrete_ things and their relationships with each other.

<!-- We can draw rough analogues to object-oriented programming here:

- A Class is a Model: The Class isn't something you can directly interact with, but defines how the instances of the objects are created
- An Object (after it is instantiated) is an Instance: It contains specific values and data in the form defined by the class it was instantiated from. -->

An instance represents a single of the possible combinations of the things that exist in a system and their interactions according to the rules we defined. Continuing our "friend group" example, here are three separate instances that abide by the rules of our model:

- **Person A** has **Person B** as a friend, and **Person B** has **Person A** as a friend.
- **Person A** has **Person B** as a friend, **Person B** has **Person C** as a friend, and **Person C** has **Person A** as a friend\*.
- **Person A** has **Person A** as a friend\*.

\*Oops... we seem to have gotten some strange instances! Does it make sense for Person A to be friends with Person B, but Person B not be friends with Person A? What about the scenario where everyone is their own friend? Let's recall the model of our system:

> - There are `Person`s in the system.
> - Each `Person` has a list of `Person`s, representing their friends.
> - Each `Person` must have at least one `Person` in their friends list.

```admonish todo title="TODO: Tim (Elaboration/Finish this section)"
Well... I _guess_ those instances follow all the rules but that definitely could be different from what we expected to be valid instances! Scenarios like these should inspire reflection-
```

We'll eventually talk about generating instances from our model in Forge in the section on [running models](./running-models/running.md).

### A Note on the _Lack_ of Instances

```admonish todo title="TODO: Touch on UNSAT here"
Instances are generated ... abiding by the structure and rules of our model. If the model we have made is too strict, and the rules
we won't be able to generate an instance. (_TODO: Talk about unsatisfiability/link to it somewhere else_)
```

---

## Modeling in Forge: Sigs and Constraints

Awesome! Hopefully this all makes sense in the abstract- but we're here to learn how to use Forge to model and explore our own systems. In Forge, we use [`Sigs`](./sigs.md) to define the "things" that exist in a system, and [`Constraints`](./constraints.md) to define the "rules" of the system.

Next, we'll learn how to use [`Sigs`](./sigs.md) and [`Constraints`](./constraints.md) to build our own models in Forge!
