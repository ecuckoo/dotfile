;; dev-ts.el typescript development environment

;; `tide.el' COMMANDS: 
;; Keyboard shortcuts    Description

;; M-. Jump to the definition of the symbol at point. With a prefix arg, Jump to the type definition.

;; M-, Return to your pre-jump position.

;; M-x tide-restart-server Restart tsserver. This would come in handy after you edit tsconfig.json or checkout a different branch.

;; M-x tide-documentation-at-point Show documentation for the symbol at point.

;; M-x tide-references List all references to the symbol at point in a buffer. References can be navigated using n and p. Press enter to open the file.

;; M-x tide-project-errors List all errors in the project. Errors can be navigated using n and p. Press enter to open the file.

;; M-x tide-error-at-point Show the details of the error at point.

;; M-x tide-rename-symbol Rename all occurrences of the symbol at point.

;; M-x tide-rename-file Rename current file and all it's references in other files.

;; M-x tide-format Format the current region or buffer.

;; M-x tide-fix Apply code fix for the error at point. When invoked with a prefix arg, apply code fix for all the errors in the file that are similar to the error at point.

;; M-x tide-add-tslint-disable-next-line If the point is on one or more tslint errors, add a tslint:disable-next-line flag on the previous line to silence the errors. Or, if a flag already exists on the previous line, modify the flag to silence the errors.

;; M-x tide-refactor Refactor code at point or current region.

;; M-x tide-jsdoc-template Insert JSDoc comment template at point.

;; M-x tide-verify-setup Show the version of tsserver.

;; M-x tide-organize-imports Organize imports in the file.

;; M-x tide-list-servers List the tsserver processes launched by tide.


(require 'company)
(require 'flycheck)
(require 'web-mode)

(defun set-tide ()
  (interactive)
  (tide-setup)
  ;;(flycheck-mode 1)
  ;;(setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (company-mode 1))

;; javascript

;;(add-hook 'js-mode-hook #'set-tide)

;; typescript

(setq company-tooltip-align-annotations t)

(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'set-tide)
(add-hook 'typescript-mode-hook 'hs-minor-mode)

;; format options

(setq tide-format-options
      '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t
	:placeOpenBraceOnNewLineForFunctions nil))

;; JSX

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (set-tide))))

;; configure jsx-tide checker to run after your default jsx checker
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; TSX

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (set-tide))))

;; enable typescript-tslint checker
;; (flycheck-add-mode 'typescript-tslint 'web-mode)

;; prettier
;; (setq prettier-js-args '(
;;   "--trailing-comma" "none"
;;   "--bracket-spacing" "true"
;;   "--single-quote" "true"
;;   "--no-semi" "true"
;;   "--jsx-single-quote" "true"
;;   "--jsx-bracket-same-line" "true"
;;   "--print-width" "100"))

(provide 'dev-ts)

;; dev-ts.el ends
