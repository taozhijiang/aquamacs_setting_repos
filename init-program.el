
;; 在编程模式下，如果有无用的空白，则显示它
(add-hook 'prog-mode-hook 
          (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; 可以启用显示空白字符串模式
(global-set-key (kbd "C-c w") 'whitespace-mode)


(provide 'init-program)
