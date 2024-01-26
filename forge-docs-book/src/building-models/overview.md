# Overview

<!-- ```admonish danger title="TODO"
- [Elaborate A](#admonition-todo-elaborate-a)
- [Elaborate B](#admonition-todo-elaborate-b)
- [Unsat](#admonition-todo-unsat)
- no motivation behind person example
- car is a real world thing, obviously we care about the aerodynamics, obvious and immediate motivation.
- running smoke over the car and capturing a picture is an instance.
- just talk about systems, models, instances using the car analogy. now let's talk about how we would be doing it w/ a computer. 
```
  -->


Forge is a language that allows us to define models of systems and explore instances of those models. But **_what does that mean_**? Let's break it down:

<!-- --- -->

## Systems

A **system** is just a particular way that various objects interact.  A system isn't necessarily a _computer_ system, although it can be. For example:

- The game of baseball is a system involving players, a ball, a field and bases, etc. along with rules that govern how those things interact with each other.
- Family trees are a system where there are people, and rules that express how they are related to each other.
- A cryptographic protocol is a system where there are parties, messages, cryptographic primitives, and rules that govern how messages can be encrypted, decrypted, sent, and received.
- Binary search trees are a system where there are nodes, values, connections between nodes, and rules that govern how nodes can be created, removed, and positioned relative to one another.
_There is no limit to the type or complexity of a system that we can discuss_, although different tools and techniques are useful for working with different kinds of systems.

---

## Models

A **model** is a _representation_ of a system that faithfully includes some but not all of the system's complexity. There are many different ways to model a system, all of which have different advantages and disadvantages. Think about what a car company does before it produces a new car design. Among other things, it creates multiple models. E.g.,
* it models the car in some computer-aided design tool; and then
* creates a physical model of the car, perhaps with clay, for testing in wind tunnels etc.

There may be many different models of a system, all of them focused on something different, and all of them useful for something. (As the statisticians say, "all models are wrong, but some models are useful".)

<!-- The model's description of a system effectively establishes the bounds of all possible states/instances of the system -->

Models define a notion of what kinds of things exist in the system and (some of) the "rules" governing the system. In a well-crafted model, we can explore what scenarios are possible in the system, which gives us insight and the ability to reason about the system itself---within the bounds of what the model expresses. 

### Example: Friends

If we wanted to model a group of friends, we might define our model to have the following structure and properties\*:

- There's a type of object, `Person`, in the system.
- Each `Person` has a list of `Person`s, representing their friends.
- Each `Person` must have at least one `Person` in their friends list.

(\*This seems like a very reasonable model for what we want to do, but we'll discuss some potential errors later on when talking about [instances](./overview.md#instances)).

### A Note on Imperfect Representations

It is very difficult to fully model some systems, especially if the system is complex and involves many intricate sub-systems. That being said, _we don't need to fully model a system to be able to make useful inferences_. We can simplify, omit, and abstract concepts/attributes to make models that approximate the system while preserving the fundamentals that we're interested in.

We can see this principle applied in the car-manufacturing example above. You could use a solid clay model of a car to accurately determine the car's aerodynamics in a wind tunnel, but you'd have a hard time exploring how the doors of the car operate or how any of the interior parts work. What you can explore is limited by how the system is modeled. If all you care about is exploring the aerodynamic profile of a car, then we can safely abstract out the internals of the car and focus on the shape. There's no need to represent things in our model that we aren't interested in exploring!

Likewise, in our "friend group" system example, we don't have to fully describe a `Person` in our model, we just have to describe the relevant properties of a `Person`. We abstract the idea of "friendship," combining all types of friends (best friend, acquaintance, etc.) into a single concept of "friend." We omit from our model the concept of a `Person`'s dietary restrictions and myriad other things. These are all choices (_sometimes unintentional_) that affect the scope of our model. If we wanted to distinguish between types of friends, or examine familial relationships as well, we would have to expand the model to include those concepts.

Learning how to model a system is a key skill for engineers, not just within "formal methods". Abstraction is one of the key tools in Computer Science, and modeling lies at the heart of abstraction.

---

## Instances

An **instance** is a concrete scenario that abides by the rules of a model, containing _specific_ objects and their relationships with each other.

<!-- We can draw rough analogues to object-oriented programming here:

- A Class is a Model: The Class isn't something you can directly interact with, but defines how the instances of the objects are created
- An Object (after it is instantiated) is an Instance: It contains specific values and data in the form defined by the class it was instantiated from. -->

<!-- An instance represents one of the possible combinations of the things that exist in a system and their interactions according to the rules we defined. Continuing our "friend group" example, here are three separate instances that abide by the rules of our model:

- **Person A** has **Person B** as a friend, and **Person B** has **Person A** as a friend.
- **Person A** has **Person B** as a friend, **Person B** has **Person C** as a friend, and **Person C** has **Person A** as a friend\*.
- **Person A** has **Person A** as a friend\*.

\*Oops... we seem to have gotten some strange instances! Does it make sense for Person A to be friends with Person B, but Person B not be friends with Person A? What about the scenario where everyone is their own friend? Let's recall the model of our system:

> - There are `Person`s in the system.
> - Each `Person` has a list of `Person`s, representing their friends.
> - Each `Person` must have at least one `Person` in their friends list. -->

<!-- ![Forge Instance Meme](../../images/lfsmeme9_v3.png) -->

<!-- ```admonish todo title="TODO: Elaborate B"
Elaborate/Finish this section:\

Well... I _guess_ those instances follow all the rules but that definitely could be different from what we expected to be valid instances! Scenarios like these should inspire reflection-
```

We'll eventually talk about generating instances from our model in Forge in the section on [running models](./running-models/running.md).

### A Note on the _Lack_ of Instances

```admonish todo title="TODO: Unsat"
Touch on UNSAT here:\

Instances are generated ... abiding by the structure and rules of our model. If the model we have made is too strict, and the rules
we won't be able to generate an instance. (_TODO: Talk about unsatisfiability/link to it somewhere else_)
```

---

```admonish todo
add a system, model, instance example chain for stuff like
- clay car...
etc...
```

--- -->

## Next Steps

In Forge, we use [`sig`s](./sigs.md) to define the "things" that exist in a system, and [constraints](./constraints.md) to define the "rules" of the system.
