# Installation

## Dependencies

To run Forge, you will need to have installed:

- [Racket](https://download.racket-lang.org/all-versions.html) (we suggest the latest version, which was 8.3 as of writing);
- Java 11 or later (which you can get [here](https://www.oracle.com/java/technologies/javase-downloads.html) if you don't have it)

## Installing Forge

To install Forge, you have two options. The first is to install from Racket’s package system, and the second is to work from the latest development build.

### Standard Package System

For the standard package-system installation, after installing Racket, run `raco pkg install forge` from your command line. Alternatively, you can run Racket's IDE, DrRacket, and navigate to _File > Install Package_. Type _forge_ as the package name and choose **Install** (if it's already installed, it'll be an **Update** button, which it's good to do regularly as we will be pushing new features/content throughout the semester).

#### Forge Version

When you run a Forge file, you'll be told the _Forge version_ you're running. This is important information to include with questions, etc. We'll be announcing Forge updates on EdStem roughly every week.

### Latest Development Build

For the latest development build, you'll need to:

- clone our Git repository (`git clone https://github.com/tnelson/forge`);
- cd to the repository (`cd forge`);
- check out the development branch (`git checkout dev`);
- finally, install the `forge` and `froglet` packages (`raco pkg install ./forge ./froglet`).

Note the `./` in the command! If you write `raco pkg install forge froglet`, that will install both from the package server. Adding `./` makes the install use those local folders. It's also important to have both `./forge` and `./froglet` in the single command; they depend on each other, so leaving one out will cause `raco` to install it from the package server, not your local drive.

## Installing VSCode Extension for Forge

- Download the latest release from [here](https://github.com/csci1710/forge-language-extension-vscode/releases/). You should download the file that says "forge-language-server-\[version].vsix".
- Open VSCode and click on the Extensions button on the left hand side of the window.
- Click the three dots on the top.
- Select “Install from VSIX” and select the file you just downloaded.

We may be issuing updates to the extension via EdStem as the semester progresses.

## Installing VSCode Extension for GPT-3

This extension allows you to write questions to GPT-3 from your editor. 

---
### Requirements

- Your Brown Provided API Key.
- Your Brown-provided User Id.

--- 

[Once downloaded, the extension can be installed following the instructions here.](https://code.visualstudio.com/docs/editor/extension-marketplace#_install-from-a-vsix)

When the extension is installed, a prompt will appear for you to enter in your API key and your User Id. You must use the extension **only with the API key provided by the course**, obtained from filling out the [responsible-use form](https://docs.google.com/forms/d/e/1FAIpQLSe18e5qNnaZm6JBMsAM3cNJiEC43ElsLyL6IJIN6U3WDOR1-w/viewform?usp=sf_link).

---


### Functionality
#### Ask GPT
Sends user input to GPT for processing. The response will appear in a modal.

> Default key binding set to `alt + g` (Windows) or `cmd + g` (Mac)
> Ask GPT in the Status Bar

#### Ask GPT inline
Queries GPT-3 with highlighted text. The response is automatically injected **below** the highlighted docs.

> Default key binding set to `alt + q` (Windows) or `cmd + q` (Mac)


#### Re-enter API Key

> - Open command palette and run `Update OpenAI API Key` (alt + m on Windows, cmd + m on Mac)
> - Enter your correct API Key into the prompt 
> - Reload VSCODE

#### Re-enter UserId

> - Open command palette and run `Update UserId` (alt + u on Windows, cmd + u on Mac)
> - Enter your correct UserId into the prompt 
> - Reload VSCODE
---


## Checking your installation

Once Racket, Forge, and Java are installed, you should confirm that everything is working properly. Create a textfile `test.frg` with only the contents `#lang forge/bsl` and then, from your command line, type `racket test.frg`. If this runs without error, congratulations, Forge should now be installed!

If you encounter any issues installing, please report them on EdStem! We'll do our best to get you help as soon as possible.

## Updating Forge

Please remember to update using the method appropriate for your install. 

### If you installed via Racket's package system

Do:
  *  `raco pkg update forge` and 
  *  `raco pkg update froglet`.  
or click `Update` for both in the DrRacket package manager.

### If you installed via Git 

Do:
  * `cd` to the location of the Forge repository on your system;
  * make sure you're in the branch you want (`main` for published updates, `dev` for our development build);
  * `git pull` in the repository, and then 
  * `raco setup forge` and `raco setup froglet` (to rebuild the packages). 

Confirm that these packages are installed properly from local directories using `raco pkg show froglet` and `raco pkg show forge`. If one is installed from a directory on your machine, and another via the Racket package system, issues can occur. You should see both say `link <path on your machine>`. If one says `catalog ...` then it's installed via Racket's servers. 