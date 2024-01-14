# Home

Forge is a lightweight modeling language, similar to [Alloy](https://alloytools.org), that has been designed for _teaching_ modeling and lightweight formal methods. It comprises three sublanguages or modes:

- **Froglet** (`#lang forge/bsl`), a language for modeling using only functions and partial functions;
- **Relational Forge** (`#lang forge`), an extension of Froglet to include relations and relational operators;
- **Temporal Forge** (`#lang forge/temporal`), an extension of Forge to include linear-temporal operators (akin to Alloy 6 or [Electrum](https://github.com/haslab/Electrum)).

Students can progress through this language hierarchy as new concepts are introduced in class; this lets the course avoid a steep language-learning curve and cover important practical material earlier than would otherwise be possible.

~~~admonish note title="If there are three languages, are there three versions of the documentation?"
**No!** In principle, we might ideally have three separate versions, but we are focusing (for now) on 
producing better documentation overall rather than taking on the subtle cross-language page-linking challenge. 

We will nevertheless try to maintain a reasonable separation. 
This means that, for example, the [glossary](./glossary.md) is organized by language, and might contain separate definitions for one term.
~~~
