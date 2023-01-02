# Installation

## Dependencies

To run Forge, you will need to have installed:

- [Racket](https://download.racket-lang.org/all-versions.html) (we suggest the latest version, which was 8.3 as of writing);
- Java 11 or later (which you can get [here](https://www.oracle.com/java/technologies/javase-downloads.html) if you don't have it)

## Installing Forge

To install Forge, you have two options. The first is to install from Racket’s package system, and the second is to work from the latest development build.

### Standard Package System

For the standard package-system installation, after installing Racket, run `raco pkg install forge` from your command line. Alternatively, you can run Racket's IDE, DrRacket, and navigate to _File > Install Package_. Type _forge_ as the package name and choose **Install** (if it's already installed, it'll be an **Update** button, which it's good to do regularly as we will be pushing new features/content throughout the semester).

### Latest Development Build

For the latest development build, you’ll need to:

- clone our Git repository (`git clone https://github.com/tnelson/forge`);
- cd to the repository (`cd forge`);
- check out the development branch (`git checkout dev`);
- cd to the Forge package directory (`cd forge` again); and
- finally, install the package (`raco pkg install`).

Note the lack of `forge` at the end of the final command; `raco` will install from the package system if you say `raco pkg install forge`, but if you just say `raco pkg install` it uses the current directory.

## Installing Forge's VSCode Extension

- Download the latest release from [here](https://github.com/csci1710/forge-language-extension-vscode/releases/). You should download the file that says "forge-language-server-\[version].vsix".
- Open VSCode and click on the Extensions button on the left hand side of the window.
- Click the three dots on the top.
- Select “Install from VSIX” and select the file you just downloaded.

## Checking your installation

Once Racket, Forge, and Java are installed, you should confirm that everything is working properly. Create a textfile `test.frg` with only the contents `#lang forge` and then, from your command line, type `racket test.frg`. If this runs without error, congratulations, Forge should now be installed!
