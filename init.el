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
 '(js-indent-level 2 t)
 '(package-selected-packages
   '(svelte-mode eglot eslint-rc eslint-rc-emacs writegood-mode yaml-mode typescript-mode cider centered-cursor-mode citar pomm ess ob-http ol-notmuch vertico which-key web-mode use-package smex restclient rainbow-mode rainbow-delimiters projectile paredit org-super-agenda org-roam org-pomodoro org-gcal olivetti notmuch modus-themes markdown-mode magit ledger-mode indium helm gnuplot expand-region exec-path-from-shell emojify elfeed-org docker csv-mode counsel avy))
 '(sgml-basic-offset 2)
 '(warning-suppress-types '((use-package) (lsp-mode) (lsp-mode) (lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
