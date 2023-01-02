# Home

Forge is a lightweight modeling language, similar to [Alloy](https://alloytools.org), that has been designed for _teaching_ modeling and lightweight formal methods. It comprises three sublanguages or modes:

- **Froglet** (`#lang forge/bsl`), a core language for modeling using object-oriented intuitions;
- **Forge** (`#lang forge`), an extension of Frglet to include relations and relational operators;
- **Temporal Forge**, an extension of Forge to include linear-temporal operators (akin to Alloy 6 or [Electrum](https://github.com/haslab/Electrum)).

Students progress through this language hierarchy as new concepts are introduced in class; this lets the course avoid a steep language-learning curve and cover important practical material earlier than would otherwise be possible.\

```admonish warning title="Warning"
The original documentation is in need of hierarchical refactoring and better contextual explanations. _(i.e. Better section names - "Built-In" = ?...)_&#x20;
```

```admonish todo title="TODO"
- [ ] Add general overview page - what is a model? what is a predicate? What is an instance? What is a predicate? Very brief high level overview page (all material obviously covered in class, but supplementary nonetheless- maybe even pull from class notes?)
- [ ] Refactor Sigs page v1
  - [x] Sigs Basic
  - [x] Fields Basic
  - [ ] Elaborate 'Types' on Sigs Page
  - [ ] Provide Clearer Description for 'Field Multiplicity' on Sigs Page
  - [ ] Provide Clearer Context for "Low level details" - seems out of place and confusing. Maybe move it in addition to expanding upon it
- [ ] Provide Description for 'Arity' on Sigs Page (I would even consider adding a whole new page/entry for 'Arity' since its a fundamental concept that will also appear in certain error messages and such)
- [ ] ...
- [ ] Go through the rest of the pages and expand this TODO list
- [ ] Refactor/Categorize rest of the pages more intuitively&#x20;
```

```admonish todo title="TODO (mdbook related)"
- [ ] Add a preprocessor/backend for a page table-of-contents for page navigation
  - mdbook-pagetoc [https://github.com/slowsage/mdbook-pagetoc](https://github.com/slowsage/mdbook-pagetoc)
  - (However, [https://github.com/slowsage/mdbook-pagetoc](https://github.com/zjp-CN/mdbook-theme) seems to be more fleshed out?)
- [ ] Add a preprocessor/backend to improve search functionality
  - [https://github.com/ang-zeyu/infisearch](https://github.com/ang-zeyu/infisearch)
- *Reference List for a bunch of third-party plugins:*
  - [https://github.com/rust-lang/mdBook/wiki/Third-party-plugins](https://github.com/rust-lang/mdBook/wiki/Third-party-plugins)
- Admonish Library reference: [https://tommilligan.github.io/mdbook-admonish/reference.html](https://tommilligan.github.io/mdbook-admonish/reference.html)
```
