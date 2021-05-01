;; buffer0.el Buffer stuff

(require 'key-chord)

(global-set-key (kbd "C-,") 'buffer-menu)
(global-set-key (kbd "C-;") 'kill-buffer)

(key-chord-define-global ".a" 'previous-buffer)
(key-chord-define-global ".d" 'next-buffer)

;; goto in-buffer
(key-chord-define-global ",g" 'goto-line)

(provide 'buffer0)

;; buffer0.el ends
