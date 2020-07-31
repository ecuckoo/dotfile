;;; init.el boot strap -*- lexical-binding: t -*-

(setq debug-on-error t)

(setq home-directory (getenv "HOME")
      source-directory (expand-file-name "src/emacs" home-directory))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'pkg)

(require 'macrolv)
(progn (require 'key-chord) (key-chord-mode 1))
(require 'pug-mode)
(require 'kb)
(require 'launch)
(require 'lang)

(setq custom-file (expand-file-name "pref.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

(provide 'init)
