;; dev0.el Development stuff

(global-unset-key [S-down-mouse-1])

(add-hook 'hs-minor-mode-hook
	  (lambda ()
	    (when hs-minor-mode
	      (define-key hs-minor-mode-map [S-mouse-2] 'hs-hide-level)
	      (define-key hs-minor-mode-map [S-mouse-1] 'hs-toggle-hiding))))

;; (defmacro hook-modes (modes &rest body)
;;   (declare (indent 1))
;;   `(--each ,modes
;;      (add-hook (intern (format "%s-hook" it))
;;                (lambda () ,@body))))
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'scheme-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
;; (add-hook 'js-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook
	  (lambda ()
	    (let ((size 2))
	      (setq tab-width size)
	      (setq js-indent-level size))
	    (hs-minor-mode)))

;; (add-hook 'pug-mode-hook
;; 	  (lambda ()
;; 	    (let ((size 2))
;; 	      (setq indent-tabs-mode nil
;; 		    tab-width size
;; 		    pug-tab-width size))))

(provide 'dev0)

;; dev0.el ends
