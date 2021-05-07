;; irc0.el IRC stuff

(setq erc-nick "niflce"
      erc-user-full-name "nifl ce")
(setq erc-server "irc.freenode.net")
(setq erc-autojoin-channels-alist
      '(("freenode.net"
         "##chat"
         "#linux"
         "#emacs"
         "#lisp"
         "#javascript"
         "#reactjs")))

(defun erc-connect ()
  (lambda ()
    (interactive)
    (erc :server "irc.freenode.net" :port "6667")))

;; Or assign it to a keybinding
;; This example is also using erc's TLS capabilities:
;; (global-set-key "\C-cen"
;;   (lambda ()
;;   (interactive)
;;   (erc-tls :server "server2.example.com"
;;            :port   "6697")))

(provide 'irc0)
;; irc0.el ends
