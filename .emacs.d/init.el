;; init.el Bootstrap -*- lexical-binding: t -*-

(setq debug-on-error t)

(setq home-directory (getenv "HOME")
      root-source-directory (expand-file-name "src" home-directory)
      source-directory (expand-file-name "emacs" root-source-directory)
      emacs-source-directory (expand-file-name "emacs" root-source-directory)      
      react-source-directory (expand-file-name "react/packages" root-source-directory))

(setq focus-follows-mouse 'auto-raise
      mouse-autoselect-window t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp-third" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "lisp-third/themes" user-emacs-directory))

(require 'package0)

;;(require 'use-package)
(require 'colorless-themes)
(require 'key-chord)
(require 'expand-region)
(require 'flycheck)
(require 'company)
(require 'js2-mode)
(require 'flow-minor-mode)
(require 'xref-js2)
(require 'flycheck-flow)
(require 'company-flow)
(require 'pdf-tools)

(eval-after-load 'colorless-themes
  '(load-theme 'less t))
(eval-after-load 'key-chord
  '(key-chord-mode 1))

(require 'macro0)
;;(require 'modeline0)
;;(require 'minibuffer0)
(require 'window0)
(require 'buffer0)
(require 'eval0)
(require 'region0)
(require 'search0)
(require 'dev0)
;;(require 'devlisp)
;;(require 'devc)
(require 'devjs)
;;(require 'web0)
;;(require 'mail0)
(require 'irc0)
(require 'pdf0)
;;(require 'media0)
(require 'shortcut)

(setq custom-file (expand-file-name "pref.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file 'noerror))

(provide 'init)
;; init.el ends
