;; dev-.el development environment

(global-unset-key [S-down-mouse-1])

(add-hook 'hs-minor-mode-hook
	  (lambda ()
	    (when hs-minor-mode
	      (define-key hs-minor-mode-map [S-mouse-2] 'hs-hide-level)
	      (define-key hs-minor-mode-map [S-mouse-1] 'hs-toggle-hiding))))

(add-hook 'pug-mode-hook
	  (lambda ()
	    (let ((size 4))
	      (setq indent-tabs-mode nil
		    tab-width size
		    pug-tab-width size))))

(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'scheme-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'hs-minor-mode)

(provide 'dev-)

;; dev-.el ends
