;; Hide UI elements
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; Set up package
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; From use-package README
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;;; Load config
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(custom-safe-themes
   '("2ade04230c5a9a82729a33be6e942441942b8532311274b4f8155edcded5b0ca" default))
 '(js-indent-level 2)
 '(package-selected-packages
   '(0blayout nix-mode dockerfile-mode writegood-mode yaml-mode which-key web-mode tide typescript-mode svelte-mode smex restclient rainbow-delimiters projectile smartparens org-roam emacsql-libsqlite3 sqlite3 pomm ox-gfm org-journal use-package org-contrib olivetti ol-notmuch ob-typescript ob-http markdown-mode magit ledger-mode gnuplot focus expand-region exec-path-from-shell eslint-rc emojify elfeed-org docker csv-mode counsel company cider avy))
 '(sgml-basic-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
