### Operators

For the following `<fmla>` means an arbitrary formula. Some operators have alternative forms, which we tag with "alt:". Use whichever is most natural and convenient to you.

- `not <fmla>`: true when `<fmla>` evaluates to false. alt: `!`
- `<fmla-a> and <fmla-b>`: true when both `<fmla-a>` and `<fmla-b>` evaluate to true. alt: `&&`
- `<fmla-a> or <fmla-b>`: true when either `<fmla-a>` is true or `<fmla-b>` evaluates to true. alt: `||`
- `<fmla-a> implies <fmla-b>`: true when either `<fmla-a>` evaluates to false or both `<fmla-a>` and `<fmla-b>` evaluate to true. alt: `=>`
- `<fmla-a> iff <fmla-b>`: true when `<fmla-a>` evaluates to true exactly when `<fmla-b>` evaluates to true. alt: `<=>`
- `{<fmla-a> => <fmla-b> else <fmla-c>}`: takes the value of `<fmla-b>` if `<fmla-a>` evaluates to true, and takes the value of `<fmla-c>` otherwise.
