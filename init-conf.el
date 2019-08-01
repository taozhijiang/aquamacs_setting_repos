

;; 括号的显示和匹配提示
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq mouse-yank-at-point t)                   ;;粘贴在光标处，而不是鼠标处

;; 对括号进行自动填充
(require 'smartparens)
(smartparens-global-mode t)


;; 使用ansi-term来代替termianl，调用操作系统的终端
;; 绑定到 F2 快捷键
(require 'terminal)


;; 快速对目录进行操作，包括添加、删除文件
(require 'dired-x)
;; Use this, we can quickly jump to the current buffer's dired
(global-set-key "\C-x\C-j" 'dired-jump)
(define-key global-map (kbd "C-x 4 C-j") 'dired-jump-other-window)

;; dired-single
(require 'dired-single)
(defun  my-dired-init ()
 "Bunch of stuff to run for dired, either immediately or when it's loaded."
;; <add other stuff here>
        (define-key dired-mode-map [return] 'joc-dired-single-buffer)
        (define-key dired-mode-map [mouse-1] 'joc-dired-single-buffer-mouse)
        (define-key dired-mode-map "^"
              (function
               (lambda nil (interactive) (joc-dired-single-buffer "..")))))

      ;; if dired's already loaded, then the keymap will be bound
      (if (boundp 'dired-mode-map)
              ;; we're good to go; just add our bindings
              (my-dired-init)
        ;; it's not loaded yet, so add our bindings to the load-hook
        (add-hook 'dired-load-hook 'my-dired-init))


(add-hook 'dired-load-hook
          (lambda ()
            (define-key dired-mode-map (kbd "RET") 'joc-dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>") 'joc-dired-single-buffer-mouse)
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (joc-dired-single-buffer "..")))
            (setq joc-dired-use-magic-buffer t)
            (setq joc-dired-magic-buffer-name "*dired*")))
(global-set-key (kbd "C-x C-d")
                'joc-dired-magic-buffer)



;; 可以快速跳转到buffer的指定位置
;; ace-jump-mode
;; jump to the word start with xxx
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
;; (define-key global-map (kbd "C-c f") 'ace-jump-mode)
(global-set-key (kbd "C-c f") 'ace-jump-mode)
;; enable a more powerful jump back function from ace jump mode 
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
;; (define-key global-map (kbd "C-c g") 'ace-jump-mode-pop-mark)
(global-set-key (kbd "C-c g") 'ace-jump-mode-pop-mark)


;; browse-kill-ring
;; this is very helpful, can browse your kill ring, and hit return can paste they here
(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring) 


;; 可以快速列出所有buffer
;; buffer-menu+
;; already handled with >24.1 compatible
(load-file (concat CustHomeDir "/tools/buff-menu.el"))
(require 'buff-menu+)
(global-set-key (kbd "C-x C-b") 'buffer-menu)   ;; seems much better


(provide 'init-conf)
