(load (concat user-emacs-directory "secrets.el"))
(setq user-full-name full-name
      user-mail-address email-address)
(print user-full-name)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(setq package-archive-priorities '(("melpa-stable" . 50)
                                   ("gnu" . 10)
                                   ("marmalade" . 10)
                                   ("melpa" . 0)))
(unless package--initialized (package-initialize t))
;; bootstrap use-package (http://www.lunaryorn.com/)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; and call it?
(eval-when-compile (require 'use-package))
(when (not package-archive-contents)
  (package-refresh-contents))

;; (use-package auto-package-update
;;   :config
;;   (setq auto-package-update-delete-old-versions t)
;;   (setq auto-package-update-hide-results t)
;;   (auto-package-update-maybe))

(setq byte-compile-warnings '(cl-functions))

(setq default-directory "~/")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

(global-auto-revert-mode t)

;; These functions are useful. Activate them.
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(put 'dired-find-alternate-file 'disabled nil)

(setq make-backup-files nil)

(setq auto-save-default nil)

(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top
(setq slime-net-coding-system 'utf-8-unix)

(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)

(defalias 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode 1)

(setq x-select-enable-clipboard t
      x-select-enable-primary t)

(setq visible-bell t)

(setq x-stretch-cursor t)

(when (string-equal system-type "darwin")
  ;; Non-native fullscreen
  (setq ns-use-native-fullscreen nil)
  ;; delete files by moving them to the trash
  (setq delete-by-moving-to-trash t)
  (setq trash-directory "~/.Trash")

  ;; Don't make new frames when opening a new file with Emacs
  (setq ns-pop-up-frames nil)

  ;; set the Fn key as the hyper key
  (setq ns-function-modifier 'hyper)

  ;; Use Command-` to switch between Emacs windows (not frames)
  (bind-key "s-`" 'other-window)

  ;; Use Command-Shift-` to switch Emacs frames in reverse
  (bind-key "s-~" (lambda() () (interactive) (other-window -1)))

  ;; Because of the keybindings above, set one for `other-frame'
  (bind-key "s-1" 'other-frame)

  ;; Fullscreen!
  (setq ns-use-native-fullscreen nil) ; Not Lion style
  (bind-key "<s-return>" 'toggle-frame-fullscreen)

  ;; buffer switching
  (bind-key "s-{" 'previous-buffer)
  (bind-key "s-}" 'next-buffer)

  ;; disable the key that minimizes emacs to the dock because I don't
  ;; minimize my windows
  (global-unset-key (kbd "C-z"))

  ;; Not going to use these commands
  (put 'ns-print-buffer 'disabled t)
  (put 'suspend-frame 'disabled t))

(global-set-key (kbd "M-o") 'other-window)

(when (eq system-type 'darwin)
  (set-frame-font "Menlo 14")
                                        ; Use Spotlight to search with M-x locate
  (setq locate-command "mdfind"))

(add-to-list 'load-path (concat user-emacs-directory "eigengrau/"))
(require 'eigengrau-theme)

(load-theme 'eigengrau t)



(use-package cider
  :ensure t
  :pin melpa-stable
  :config
  (setq nrepl-use-ssh-fallback-for-remote-hosts t))

(use-package company
  :ensure t
  :defer t
  :config
  (setq company-tooltip-limit 10)
  (setq company-idle-delay 0.3)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-require-match nil)
  (setq company-tooltip-flip-when-above t)
  (setq company-transformers '(company-sort-by-occurrence))
  :init (global-company-mode))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package exec-path-from-shell
  :ensure t
  :pin melpa-stable)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(use-package expand-region
  :ensure t
  :pin melpa-stable
  :bind ("C-=" . er/expand-region))

(use-package avy
  :ensure t
  :pin melpa-stable
  :bind
  ("C-:" . avy-goto-char))

(use-package ivy
  :ensure t
  :pin melpa-stable
  :config
  (ivy-mode 1)
  (setq ivy-count-format " %d/%d ")
  (setq ivy-use-virtual-buffers t)
  (setq ivy-use-selectable-prompt t)
  (setq enable-recursive-minibuffers t)
  (setq projectile-completion-system 'ivy)
  (setq magit-completing-read-function 'ivy-completing-read)
  :bind
  (:map ivy-minibuffer-map
        ("<return>" . ivy-alt-done)))

(use-package counsel
  :ensure t
  :pin melpa-stable
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-c g" . counsel-git)
  ("C-x l" . counsel-locate)
  :config
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package swiper
  :ensure t
  :pin melpa-stable
  :bind
  ("C-s" . swiper)
  ("C-c C-r" . ivy-resume))

(use-package magit
  :ensure t
  :pin melpa-stable
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :ensure t
  :pin melpa-stable
  :init
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(use-package notmuch
  :ensure t
  :pin melpa-stable
  :bind ("C-c m" . notmuch)
  :init
  (setq notmuch-saved-searches
        (quote
         ((:name "inbox" :query "tag:inbox AND -tag:sent" :key "i" :sort-order newest-first)
          (:name "sent" :query "tag:sent" :key "t" :sort-order newest-first)
          (:name "drafts" :query "tag:draft" :key "d")
          (:name "all mail" :query "*" :key "a" :sort-order newest-first))
         ))
  )

(autoload 'notmuch "notmuch" "notmuch mail" t)

(use-package olivetti
  :ensure t
  :pin melpa-stable)

(setq org-directory "~/Dropbox (Personal)/org/")

(setq todo-file (expand-file-name "agenda.org" org-directory))
(setq memex-file (expand-file-name "memex.org" org-directory))
(setq quote-file (expand-file-name "quote.org" org-directory))

(use-package org
  :ensure t
  :pin org
  :init
  ;; Enable syntax highlighting in #+BEGIN_SRC sections.
  (setq org-src-fontify-natively t)
  ;; Add log/notebook entries into :LOGBOOK: drawer.
  (setq org-log-into-drawer t)
  :config
  (setq org-export-coding-system 'utf-8)
  (setq org-default-notes-file todo-file)
  (setq org-agenda-files '("~/Dropbox (Personal)/org/agenda.org"
                           "~/Dropbox (Personal)/org/gcal.org"))
  (setq calendar-week-start-day 1)
  ;; Indent text lines that are not headlines are prefixed with
  ;; spaces to vertically align with the headline text.
  (setq org-startup-indented t)
  ;; Turn off manual indentation
  (setq org-adapt-indentation nil)
  (setq org-indent-indentation-per-level 1)
  ;; Deactivate ‘^’ and ‘_’ to be used to indicate super- and subscripts
  (setq org-use-sub-superscripts nil)
  ;; Allow `a.`, `A.`, `a)` and `A)` list style
  (setq org-list-allow-alphabetical t)
  ;; Don’t ask every time when executing a code block.
  (setq org-confirm-babel-evaluate nil)
  ;; Remove clutter form agenda view
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)
  ;;
  (setq org-src-tab-acts-natively t)
  ;; Sync Google Calendar
  ;;(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
  ;;(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
  (setq org-capture-templates
        '(("t" "Todo" entry
           (file+headline todo-file "Capture")
           "* TODO %^{Title}\n%?\n:LOGBOOK:\n- Added: %U\n:END:")
          ("f" "Todo from file" entry
           (file+headline todo-file "Capture")
           "* TODO %^{Title}\n%?\n:PROPERTIES:\n- File: [[%F][%f]]\n:END:\n:LOGBOOK:\n- Added: %U\n:END:")
          ("r" "Toread article" entry
           (file+headline todo-file "READING")
           "* SOMEDAY %^{Title} :READING:\n:PROPERTIES:\n:SOURCE: %^{Source}\n:END:\n:LOGBOOK:\n- Added: %U\n:END:")
          ("b" "Toread book" entry
           (file+headline todo-file "READING")
           "* SOMEDAY %^{Title} :READING:\n:PROPERTIES:\n:AUTHOR: %^{Author}\n:SOURCE: %^{Source}\n:END:\n:LOGBOOK:\n- Added: %U\n:END:")
          ("m" "Memex" entry
           (file memex-file)
           "* %^{Title}\n%?")
          ("q" "Quote" entry
           (file quote-file)
           "* %^{Quote}\n:PROPERTIES:\:AUTHOR: %^{Author}\:SOURCE: %^{Source}\:PAGE: %^{Page}\:END:\:LOGBOOK:\n- Added: %U\n:END:")
          )
        )
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "NEXT(n!)" "|" "DONE(d@/!)")
          (sequence "WAITING(w@)" "SOMEDAY(s!)" "|")
          (sequence "|" "CANCELLED(c@)"))
        )
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)))

(use-package paredit
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'prog-mode-hook #'enable-paredit-mode))

(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (projectile-global-mode))

(use-package python
  :ensure t
  :config
  (setq python-shell-interpreter "python3")
  (setenv "PYTHONIOENCODING" "utf-8")
  (setenv "LANG" "en_US.UTF-8"))

(use-package rainbow-delimiters
  :ensure t
  :pin melpa-stable
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :pin gnu
  :config
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package restclient
  :ensure t
  :pin melpa
  :mode (("\\.http\\'" . restclient-mode))
  :bind (:map restclient-mode-map
              ("C-c C-f" . json-mode-beautify)))

(use-package smex
  :ensure t
  :pin melpa-stable)

(use-package svelte-mode
  :ensure t
  :pin melpa)

(setq sentence-end-double-space nil)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Customize interface to safe config in separate file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)
