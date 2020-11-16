;; init.el Boot strap -*- lexical-binding: t -*-

(setq debug-on-error t)

(setq home-directory (getenv "HOME")
      source-directory (expand-file-name "src/emacs" home-directory)
      react-source-directory (expand-file-name "src/react/packages" home-directory)
      org-directory (expand-file-name "org" home-directory)
      org-agenda-files (list org-directory))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp-third" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "lisp-third/themes" user-emacs-directory))

(require 'pkg)

(require 'macrolv)
(progn (require 'key-chord) (key-chord-mode 1))
(require 'company)
(require 'flycheck)
(require 'web-mode)
(require 'tide)
(require 'colorless-themes)
(require 'kb)
(require 'dev-)
(require 'dev-env)
(require 'launch)

(load-theme 'less t)

(setq custom-file (expand-file-name "pref.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

(provide 'init)

;; init.el ends
