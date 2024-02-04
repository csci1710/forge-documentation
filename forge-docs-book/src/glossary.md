# Glossary

This glossary is meant to cover terms that aren't easily searched for via the search bar. E.g., it lists "arity" but not specific Forge language constructs like `pred` or `sig`. 

## Terms


The _arity_ of a relation is the number of columns in the relation; that is, the number of elements of a tuple in that relation. 

An _atom_ is a distinct object within an instance. 

An [_instance_](https://csci1710.github.io/forge-documentation/building-models/overview.html) is a concrete scenario that abides by the rules of a model, containing specific _atoms_ and their relationships to each other.

A [_model_](https://csci1710.github.io/forge-documentation/building-models/overview.html) is a representation of a system. In Forge, a model comprises a set of `sig` and `field` definitions, along with constraints.


## Glossary of Errors 

This section contains tips related to some error terminology in Forge. 

### Errors Related to Bounds

#### Please specify an upper bound for ancestors of ...

If `A` is a `sig`, and you get an error that says "Please specify an upper bound for ancestors of A", this means that, while you've defined the contents of `A`, Forge cannot infer corresponding contents for the parent `sig` of `A` and needs you to provide a binding. 


~~~admonish example title="Example"
Given this definition:
```
sig Course {}
sig Intro, Intermediate, UpperLevel extends Course {} 
```
and this example:
```
example someIntro is {wellformed} for {
    Intro = `CSCI0150
}
```
the above error will be produced. Add a bound for `Course`:
```
example someIntro is {wellformed} for {
    Intro = `CSCI0150
    Course = `CSCI0150
}
```
~~~


