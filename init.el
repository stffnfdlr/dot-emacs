;;; init.el --- -*- lexical-binding: t; -*-

;; Hide UI elements. Unconditional on purpose: under a daemon start
;; window-system is nil during init, but these global modes also
;; govern GUI frames created later by emacsclient.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; Set up package
;; Archive names are referenced by the :pin properties in config.org.
(require 'package)
(setq package-archives '(("elpa-gnu" . "https://elpa.gnu.org/packages/")
                         ("elpa-nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(setq package-archive-priorities '(("melpa-stable" . 50)
                                   ("elpa-gnu" . 10)
                                   ("melpa" . 0)))
(package-initialize)

;;; use-package and bind-key are built into Emacs since version 29.
(require 'use-package)
(require 'bind-key)

;; On a fresh install, fetch archive contents so :ensure can install packages.
(when (not package-archive-contents)
  (package-refresh-contents))

;;; Load config
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(custom-safe-themes
   '("2ade04230c5a9a82729a33be6e942441942b8532311274b4f8155edcded5b0ca"
     default))
 '(package-selected-packages
   '(apheleia avy cider consult corfu csv-mode diff-hl diminish docker
         dockerfile-mode embark embark-consult exec-path-from-shell
         expand-region gnuplot jinx ledger-mode magit marginalia
         markdown-mode nix-mode notmuch ob-typescript olivetti orderless
         org-contrib org-journal org-roam ox-gfm plantuml-mode
         rainbow-delimiters smartparens svelte-mode typescript-mode verb
         vertico web-mode writegood-mode yaml-mode))
 '(sgml-basic-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
