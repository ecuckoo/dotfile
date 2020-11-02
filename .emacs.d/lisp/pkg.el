;; pkg.el Package initialize -*- lexical-binding: t -*-

(let ((miniver 24))
  (when (< emacs-major-version miniver)
    (error "As built-in `package', requires emacs %s or higher" miniver)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(provide 'pkg)

;; pkg.el ends
