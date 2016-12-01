# .emacs

This configuration uses `use-pacakge` to automatically install packages on load.

Sections are devided into pages delimited by the formfeed character `^L` (`C-q C-l`).

## Requirements
* Emacs 24.x
* Git

## Install

Install [GNU Emacs'](https://www.gnu.org/software/emacs/) latest stable from [brew](http://brew.sh/) or apt-get.

On OS X:
```bash
$ brew install emacs --cocoa
```
On Ubuntu:
```bash
$ sudo apt-get install git emacs
```

Afterwards clone this repo into your home directory as the directory `~/.emacs.d`.

```bash
$ git clone https://github.com/comkee/dot-emacs.git ~/.emacs.d
```

Next, run Emacs and all packages will be required.

## Thanks 

[Jack Rusher](https://github.com/jackrusher)!

## License

See each package located at `~/.emacs.d/elpa/` for their licenses. The `~/.emacs.d/init.el` file is on the public domain.
