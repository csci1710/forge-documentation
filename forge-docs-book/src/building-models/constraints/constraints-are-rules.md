# Constraints are Rules

```admonish danger title="TODO"
- Page content currently seems a bit out of place/currently doesn't have a good transition backward/forwards or a very natural place to talk about.
- Instruction by Analogy is... well... yeah... need some advice from Tim/Siddhartha!
- Add example (linked list)
```

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

## Why Rules are Important (an Example)
