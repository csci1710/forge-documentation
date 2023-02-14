# Concrete Instance Bounds

### Instances

The types of problems that Forge creates and solves consist of 3 mathematical objects:

- A set of signatures and relations (the **language** of the problem);
- A set of logical/relational formulas (the **constraints** of the problem);
- A set of bounds on sigs and relations (the **bounds** of the problem).

Forge presents a syntax that helps users keep these concerns separated. The first two concerns are represented by `sig` and `pred` declarations. The third concern is usually addressed by numeric bounds, but numeric bounds must always be converted (usually invisibly to the user) into set-based lower and upper bounds that specify what _must_ be in an instance and what _may_ be in an instance.

The `inst` syntax provides the ability to manipulate these set-based bounds directly, instead of via numeric bounds. Because bounds declarations interface more directly with the solver than constraints, at times they can yield performance improvements.

### Syntax

An instance declaration contains a `{}`-enclosed sequence of bounds declarations. A bounds declaration is one of the following, where `A` is a sig name or field name.

- `#Int = k`: use bitwidth `k` (where `k` is an integer greater than zero); 
- `A = <bounds-expr>`: exactly specify the contents of the sig or field
- `A in <bounds-expr>`: specify upper bounds on a sig or field 
- `A ni <bounds-expr>`: specify lower bounds on a sig or field 
- `r is linear` : use bounds-based symmetry breaking to make sure `r` is a linear ordering on its types (useful for optimizing model-checking queries in Forge)
- `r is plinear` : similar to `r is linear`, but possibly not involving the entire contents of the sig. I.e., a total linear order on `A'`->`A'` for some subset `A'` of `A`.

A `<bounds-expr>` is a union (`+`) of products (`->`) of object names (each prefixed by backquote). Bounds expressions must be of appropriate arity for the sig or field name they are bounding. 

~~~admonish example title="Bounds expressions"
```
A = `Alice+`Alex+`Adam
f = `Alice->`Alex + 
    `Adam->`Alex
g in `Alice->2 
```
where `A` is a sig, `f` is a field of `A` with value in `A`, and `g` is a field of `A` with integer value. Note that integers should be used directly, without backquotes.
~~~


## Semantics

Bounds declarations are resolved _in order_ before the problem is sent to the solver. The right-hand side of each bounds declaration is evaluated given all preceding bounds declarations, which means that using `sig` names on the right-hand side is allowed so long as those sigs are _exact bounded_ by some preceding bounds declaration. 

A bounds declaration cannot define bounds for a sig unless bounds for its ancestors are also defined. Bounds inconsistencies will produce an error message.

<!-- The semantics of comparison commands using `=`, `in`, or `ni` are asymmetrical.  -->

