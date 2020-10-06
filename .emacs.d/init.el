;; init.el Boot strap -*- lexical-binding: t -*-

(setq debug-on-error t)

(setq home-directory (getenv "HOME")
      source-directory (expand-file-name "src/emacs" home-directory))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (add-to-list 'custom-theme-load-path (expand-file-name "lisp-third/themes" user-emacs-directory))

(require 'pkg)

(require 'macrolv)
(progn (require 'key-chord) (key-chord-mode 1))
(require 'kb)
(require 'lang)
(require 'launch)
(require 'pug-mode)
(require 'colorless-themes)

(load-theme 'less t)

(setq custom-file (expand-file-name "pref.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

(provide 'init)

;; init.el ends
