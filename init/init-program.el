
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
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; emacs-async
(add-to-list 'load-path
    (concat CustHomeDir "/program/emacs-async"))
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

(add-hook 'prog-mode-hook 'highlight-numbers-mode)


;; company-mode
;; == company-mode ==
;; Meta-p Meta-n 选择，Meta-digit 快速选择，return选中，tab触发选择
(define-key osx-key-mode-map (kbd "C-;") nil) ;; toggle-mac-option-modifier

(use-package company
    :ensure t
    :defer t
    :init (add-hook 'after-init-hook 'global-company-mode)
        ;; 使用常用的Ctrl-P Ctrl-N代替Meta-P Meta-N
        (with-eval-after-load 'company
            (define-key company-active-map (kbd "M-n") nil)
            (define-key company-active-map (kbd "M-p") nil)
            (define-key company-active-map (kbd "C-n") #'company-select-next)
            (define-key company-active-map (kbd "C-p") #'company-select-previous))
    :config
        (use-package company-irony :ensure t :defer t)
        (setq company-idle-delay              nil
	        company-minimum-prefix-length   2
	        company-show-numbers            t
	        company-tooltip-limit           20
	        company-dabbrev-downcase        nil
	    )
        (setq company-backends nil)
        (add-to-list 'company-backends '(company-irony company-gtags))
    :bind ("C-;" . company-complete-common))


;;;;;;;;;;;;;;;;;;;;
;; ycmd
;;(require 'ycmd)
;;(add-hook 'after-init-hook #'global-ycmd-mode)      ;; use ycmd-mode in all supported modes
;;(set-variable 'ycmd-server-command '("python3" "/Users/taozj/Dropbox/GitHub/aquamacs_setting_repos/program/ycmd/ycmd"))
;;(set-variable 'ycmd-global-config "/path/to/global_config.py")

;;(require 'company-ycmd)
;;(company-ycmd-setup)

;;(require 'flycheck-ycmd)
;;(flycheck-ycmd-setup)


;;;;;;;;;;;;;;;;;;;
;; irony

;; == irony-mode ==
(use-package irony
    :ensure t
    :defer t
    :init
        (add-hook 'c++-mode-hook 'irony-mode)
        (add-hook 'c-mode-hook 'irony-mode)
        (add-hook 'objc-mode-hook 'irony-mode)
    :preface
        (defun sarcasm-irony-cdb-not-found (command &rest args)
            (when (eq command 'get-compile-options)
                (message "Irony: compile options not found!")
        nil))
   :init
    (setq-default irony-cdb-compilation-databases '(irony-cdb-clang-complete
                                                    irony-cdb-libclang
                                                    sarcasm-irony-cdb-not-found))
    :config
    ;; replace the `completion-at-point' and `complete-symbol' bindings in
    ;; irony-mode's buffers by irony-mode's function
    (use-package irony-cdb)
    (defun my-irony-mode-hook ()
        (define-key irony-mode-map [remap completion-at-point]
            'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
        'irony-completion-at-point-async))
    (add-hook 'irony-mode-hook 'my-irony-mode-hook)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; .clang_complete
(use-package company-irony
    :config
        (add-to-list 'company-backends 'company-irony)
    (use-package company-c-headers
      :ensure t
      :functions irony--extract-user-search-paths company-c-headers
      :preface
      (defun company-c-headers-path-user-irony ()
        "Return the user include paths for the current buffer."
        (when irony-mode
          (irony--extract-user-search-paths irony--compile-options
                                            irony--working-directory)))
      :config
      (add-to-list 'company-c-headers-path-system "/usr/local/clang+llvm-9.0.0-x86_64-darwin-apple/include/c++/v1/")
      (setq company-c-headers-path-user #'company-c-headers-path-user-irony)
      (add-to-list 'company-backends #'company-c-headers))
)

(eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

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
