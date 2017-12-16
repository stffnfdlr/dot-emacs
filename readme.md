# .emacs

This configuration uses `use-pacakge` to automatically install packages on load.

Sections are devided into pages delimited by the formfeed character `^L` <kbd>C-q C-l</kbd>. To navigate between sections use <kbd>C-x [</kbd> and <kbd>C-x ]</kbd>.

## Structure

* init.el has all of it
* /elpa for pacakges from melpa
* /lisp for manually installed packages
* custom.el for settings maintained by emacs'

## Setup

### Requirements

* Emacs 24.x
* Git

### Install

Install [GNU Emacs'](https://www.gnu.org/software/emacs/) latest stable from [brew](http://brew.sh/) or apt-get.

On OS X:
```bash
$ brew install emacs --with-cocoa
```
On Ubuntu:
```bash
$ sudo apt-get install git emacs
```

Afterwards clone this repo into your home directory as the directory `~/.emacs.d`.

```bash
$ git clone https://github.com/comkee/dot-emacs.git ~/.emacs.d
```
Rename `secrets.template.el` to `secrets.el`.
```bash
$ mv secrets.template.el secrets.el
```
And update its content.

Next, run Emacs and all packages will be required.

## Thanks 

[Jack Rusher](https://github.com/jackrusher)!

## License

See each package located at `~/.emacs.d/elpa/` for their licenses. The `~/.emacs.d/init.el` file is on the public domain.
