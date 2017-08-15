My Dotfiles for macOS
=====================

These are the dotfiles I use on my Macs, currently running Also included is my [iTerm2][iterm2] profile.

Forked from [here](https://github.com/joshukraine/dotfiles)


Mac Bootstrap Script
--------------------

This repo previously contained my entire provisioning solution for a new machine running a fresh install of macOS. I've now extracted the provisioning functionality into its own repository. Check it out:

&#9657; **Provision a new Mac with [Mac Bootstrap][mac-bootstrap].**

NOTE: Mac Bootstrap automatically clones and installs this dotfiles repo.


Prerequisites
-------------

The dotfiles assume you are running macOS with the following software preinstalled:

* [Oh-My-Zsh][oh-my-zsh]
* [Homebrew][homebrew]
* [Vim][vim]
* [Git][git]

All of the above and more are included in [Mac Bootstrap][mac-bootstrap]


Installation
------------

```sh
git clone https://github.com/joshukraine/dotfiles.git ~/dotfiles
source ~/dotfiles/install.sh
```


Post-install Tasks
------------------

After running `install.sh` there are still a couple of things that need to be done.

* Set up iTerm2 profile (see details below).
* Add personal data to `~/.gitconfig.local` and `~/.zshrc.local`.
* Complete [Brew Bundle][brew-bundle] with `brew bundle install --global`


Setting up iTerm2
----------------

Thanks to a [great blog post][blog-post] by Trevor Brown, I learned that you can quickly set up iTerm2 by exporting your profile. Here are the steps.

1. Open iTerm2.
2. Select iTerm2 > Preferences.
3. Under the General tab, check the box labeled "Load preferences from a custom folder or URL:"
4. Press "Browse" and point it to `~/dotfiles/iterm2/com.googlecode.iterm2.plist`.
5. Restart iTerm2.


Some of my favorite dotfile repos
---------------------------------

* Pro Vim (https://github.com/Integralist/ProVim)
* Trevor Brown (https://github.com/Stratus3D/dotfiles)
* Chris Toomey (https://github.com/christoomey/dotfiles)
* thoughtbot (https://github.com/thoughtbot/dotfiles)
* Lars Kappert (https://github.com/webpro/dotfiles)
* Ryan Bates (https://github.com/ryanb/dotfiles)
* Ben Orenstein (https://github.com/r00k/dotfiles)
* Joshua Clayton (https://github.com/joshuaclayton/dotfiles)
* Drew Neil (https://github.com/nelstrom/dotfiles)
* Kevin Suttle (https://github.com/kevinSuttle/OSXDefaults)
* Carlos Becker (https://github.com/caarlos0/dotfiles)
* Zach Holman (https://github.com/holman/dotfiles/)
* Mathias Bynens (https://github.com/mathiasbynens/dotfiles/)
* Paul Irish (https://github.com/paulirish/dotfiles)


Helpful web resources on dotfiles, et al.
-----------------------------------------

* http://dotfiles.github.io/
* https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
* http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449
* https://github.com/webpro/awesome-dotfiles
* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
* http://carlosbecker.com/posts/first-steps-with-mac-os-x-as-a-developer/
* https://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-1-core-files-and-custom-shell
