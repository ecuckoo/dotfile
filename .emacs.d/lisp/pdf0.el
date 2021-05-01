;; pdf0.el PDF stuff

;; (use-package pdf-tools
;;   :if my/laptop-p
;;   :config
;;   (pdf-tools-install)
;;   (setq pdf-view-resize-factor 1.1)
;;   (setq-default pdf-view-display-size 'fit-page))

(require 'pdf-tools)

(pdf-tools-install)

(setq pdf-view-resize-factor 1.1)
(setq-default pdf-view-display-size'fit-width)

;;marker

(add-hook 'pdf-view-mode-hook 'pdf-view-dark-minor-mode)

(provide 'pdf0)

;; pdf0.el ends
