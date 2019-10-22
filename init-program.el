
(add-to-list 'load-path
    (concat CustHomeDir "/program/"))

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
    (concat CustHomeDir "/program/flycheck/"))
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; emacs-async
(add-to-list 'load-path
    (concat CustHomeDir "/program/emacs-async"))
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; company-mode
;; Meta-p Meta-n 选择，Meta-digit 快速选择，return选中，tab触发选择
(add-hook 'after-init-hook 'global-company-mode) ;; 全局company补全模式
;; 使用常用的Ctrl-P Ctrl-N代替Meta-P Meta-N
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; helm
(add-to-list 'load-path
    (concat CustHomeDir "/program/emacs-helm/"))
(require 'helm)
(require 'helm-config)

;; helm ide setup from others
(require 'setup-helm)
(require 'setup-helm-gtags)



;; projectile
(add-to-list 'load-path
    (concat CustHomeDir "/program/projectile/"))
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(projectile-mode +1)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)
;;(helm-projectile-on)




(provide 'init-program)
