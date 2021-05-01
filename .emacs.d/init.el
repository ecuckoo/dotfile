;; init.el Bootstrap -*- lexical-binding: t -*-

(setq debug-on-error t)

(setq home-directory (getenv "HOME")
      root-source-directory (expand-file-name "src" home-directory)
      source-directory (expand-file-name "emacs" root-source-directory)
      emacs-source-directory (expand-file-name "emacs" root-source-directory)      
      react-source-directory (expand-file-name "react/packages" root-source-directory)
      org-directory (expand-file-name "org" home-directory)
      org-agenda-files (list org-directory))

(setq focus-follows-mouse 'auto-raise
      mouse-autoselect-window t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp-third" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "lisp-third/themes" user-emacs-directory))

(require 'package0)

;;(require 'use-package)
(require 'colorless-themes)
(require 'key-chord)
(require 'company)
(require 'flycheck)

(key-chord-mode 1)

(require 'macro0)
;;(require 'modeline0)
;;(require 'minibuffer0)
(require 'window0)
(require 'buffer0)
(require 'eval0)
(require 'search0)
(require 'dev0)
;;(require 'dev-c)
;;(require 'dev-lisp)
;;(require 'dev-js)
;;(require 'dev-flow)
;;(require 'navigation0)
;;(require 'web0)
;;(require 'mail0)
(require 'pdf0)
;;(require 'media0)
;;(require 'org0)
(require 'shortcut)

(load-theme 'less t)

(setq custom-file (expand-file-name "pref.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

(provide 'init)

;; init.el ends

;; (defhydra my/window-movement ()
;;    ("<left>" windmove-left)
;;    ("<right>" windmove-right)
;;    ("<down>" windmove-down)
;;    ("<up>" windmove-up)
;;    ("y" other-window "other")
;;    ("h" switch-window "switch-window")
;;    ("f" find-file "file")
;;    ("F" find-file-other-window "other file")
;;    ("v" (progn (split-window-right) (windmove-right)))
;;    ("o" delete-other-windows :color blue)
;;    ("a" ace-window)
;;    ("s" ace-swap-window)
;;    ("d" delete-window "delete")
;;    ("D" ace-delete-window "ace delete")
;;    ("i" ace-maximize-window "maximize")
;;    ("b" helm-buffers-list)
;;    ("q" nil))

;; (defun xah-toggle-margin-right ()
;;   "Toggle the right margin between `fill-column' or window width.
;;      This command is convenient when reading novel, documentation."
;;   (interactive)
;;   (if (eq (cdr (window-margins)) nil)
;;       (set-window-margins nil 0 (- (window-body-width) fill-column))
;;     (set-window-margins nil 0 0)))
