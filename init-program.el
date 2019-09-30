
;; 在编程模式下，如果有无用的空白，则显示它
(add-hook 'prog-mode-hook 
          (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; 可以启用显示空白字符串模式
(global-set-key (kbd "C-c w") 'whitespace-mode)


(setq gdb-many-windows t        ; use gdb-many-windows by default
      gdb-show-main t)          ; Non-nil means display source file containing the main routine at startup


;; exec-path-from-shell.el
(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)
(when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))

;; flycheck
(add-to-list 'load-path
    (concat CustHomeDir "/tools/flycheck/"))
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-program)
