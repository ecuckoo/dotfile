;; launch.el File launching for frequency use

(defvar file-map
  (let ((map `((("firefly") . ff)
	       (("u") . u)
	       (("stardict") . dic)
	       (("tor" "-f" ,(expand-file-name ".tor/torrc"
					       (or (bound-and-true-p home-directory) (getenv "HOME")))) . tor)
	       ((ansi-term "/bin/bash") . sh)
	       (("pokerth") . pk)
	       (("geph" "-forceBridges" "-username" "dyad" "-password" "dyad") . g)
	       (("chromium" "--proxy-server=127.0.0.1:9910" "--proxy-server=socks5://127.0.0.1:9909") . w1)
	       (("firefox" "-P" "origin" "--no-remote") . w)
	       (("firefox" "-P" "geph" "--no-remote") . gw)
	       (("firefox" "-P" "u" "--no-remote") . uw)
	       (("firefox" "-P" "firefly" "--no-remote") . fw)
	       (("firefox" "-P" "tor" "--no-remote") . tw)))
	(symbol-valid (lambda (arg)
			(if (symbolp arg)
			    (or (fboundp arg)
				(and (boundp arg)
				     (or (functionp (symbol-value arg))
					 (macrop (symbol-value arg)))))
			  (functionp arg)))))
   (mapc (lambda (arg)
	    (let ((sym (cdr arg)) (any (caar arg)))
	      (put sym 'bind-eval-form (funcall symbol-valid any))))
	  map))
 "((PROGRAM ARGS) . ALIAS)")

(defun kill-system-process (&rest args)
  (declare (obsolete "temporarily obsoleted." 26.1))
  (interactive)
  (let ((pids (list-system-processes))
	palist pname)
    (dolist (pid pids)
      (setq palist (process-attributes pid))
      (when palist
	(setq pname (alist-get 'comm palist))
	(dolist (arg args)
	  (if (equal pname arg)
	      (signal-process pid 9)))))))

(defun launch-interactive-args (prompt)
  (let ((input (read-string prompt)))
    (list (mapcar 'intern (split-string input)))))

(defun launch (alias &optional action)
  (interactive (launch-interactive-args "symbol: "))
  (unless (called-interactively-p 'interactive)
    (if (nlistp alias) (error "Invalid arg type, %S" alias)))
  (let ((exec-path (cons (expand-file-name "sh"
					   (or (bound-and-true-p home-directory) (getenv "HOME")))
			 exec-path))
	(symbols alias) symbol)
    (while (prog1
	       (and (setq symbol (pop symbols)) symbols)
	     (let* ((pair (rassq symbol file-map))
		    (key (cdr pair)) (value (car pair)))
	       (catch 'done
		 (when (and pair (consp value))
		      (let ((program (car value)) (args (cdr value)))
			(if (get key 'bind-eval-form)
			    (apply program args)
			  (let ((file  (executable-find program)))
			    (and file
				 (let ((default-directory (file-name-directory file)))
				   (apply 'start-process program nil program args)))))
			(throw 'done t)))
		 (message "No assocation matching symbol, %S" symbol)))))))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (launch '(g u ff dic))))

(key-chord-define-global ",l" 'launch)

(provide 'launch)

;; launch.el ends
