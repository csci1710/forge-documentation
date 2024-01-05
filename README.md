# Forge Documentation mdbook

**The deployed documentation is viewable here:** https://csci1710.github.io/forge-documentation/

Alternatively, for local viewing, use the `deployed-pages` branch, which has pre-built HTML etc. 

## Instructions to Build

This is the source for the Forge documentation. It is built using mdbook.

See the user guide https://rust-lang.github.io/mdBook/guide/installation.html for more information.

TL;DR:

1. Install Rust & Cargo from https://rust-lang.github.io/mdBook/guide/installation.html#:~:text=Rust%20installation%20page
2. Run `cargo install mdbook`
3. Run `cargo install mdbook-admonish` 
4. Run `cargo install mdbook-katex`
5. `cd forge-docs-book` and `mdbook serve --open` to open the docs in a browser- mdbook will automatically rebuild the output _and_ automatically refresh your web browser when changes are made.

Check out the rest of the docs here: https://rust-lang.github.io/mdBook/guide/creating.html

## Want to contribute? 

Submit a pull request or mail Tim (Tim_Nelson@brown.edu).