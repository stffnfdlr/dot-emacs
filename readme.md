# .emacs

This is Steffen's [emacs](https://www.gnu.org/software/emacs/) configuration. Its written in [org-mode](https://orgmode.org/)'s literate programming style and uses `use-pacakge` to automatically install, load, and configure packages.

Sections are devided into bullet points.

## Structure

* `init.el` for startup.
* `config.org` list all packages and their configuration.
* `config.el` auto generated and read-in by emacs.
* `elpa/` for pacakges from melpa.
* `lisp/` for manually installed packages.

## Setup

### Requirements

* Emacs 24.x
* Git

### Install

Install [GNU Emacs'](https://www.gnu.org/software/emacs/) latest stable from [brew](http://brew.sh/) or apt-get.

On OS X:
```
$ brew cask install emacs
```
On Ubuntu:
```
$ sudo apt-get install git emacs
```

Afterwards clone this repo into your home directory as the directory `~/.emacs.d`.

```
$ git clone https://github.com/comkee/dot-emacs.git ~/.emacs.d
```
Rename `secrets.template.el` to `secrets.el`.
```
$ mv secrets.template.el secrets.el
```
And update their content.

Next, run Emacs and all packages will be required.

## Emacs as Daemon on OSX

### Add Binaries
Cocoa `vi /usr/local/bin/emacsc`

```
#!/bin/sh
set -e
/Applications/Emacs.app/Contents/MacOS/Emacs "$@"
```

Terminal `vi /usr/local/bin/emacst`
```
#!/bin/sh
set -e
/Applications/Emacs.app/Contents/MacOS/Emacs -nw "$@"
```

`sudo chmod a+rx emacst`

## Thanks

[Jack Rusher](https://github.com/jackrusher)!

## License

See each package located at `~/.emacs.d/elpa/` for their licenses. The `~/.emacs.d/init.el` file is on the public domain.
