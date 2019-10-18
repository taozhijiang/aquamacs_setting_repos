

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
;;(global-set-key (kbd "C-c f") 'ace-jump-mode)
;; has been bind to Ctrl-,
;; enable a more powerful jump back function from ace jump mode 
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
;; (define-key global-map (kbd "C-c g") 'ace-jump-mode-pop-mark)
;;(global-set-key (kbd "C-c g") 'ace-jump-mode-pop-mark)
;; has been bind to Ctrl-.


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

;;;;
;; Twitter
(load-file (concat CustHomeDir "/entertain/twittering-mode.el"))
(setq twittering-use-master-password t)
;; 使用HTTP代理 127.0.0.1:1087
(setq twittering-proxy-use t
      twittering-proxy-server "127.0.0.1"
      twittering-proxy-port 1087)

;; (setq twittering-convert-fix-size 32)
(setq twittering-icon-mode t
      twittering-use-icon-storage t)

(require 'twittering-mode)

;; email
(add-to-list 'load-path
    "/usr/local/Cellar/mu/1.2.0_1/share/emacs/site-lisp/mu/mu4e/")
(require 'mu4e)
(setq mu4e-maildir "~/Dropbox/GitHub/aquamacs_setting_repos/EmacsData/MailDir")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/SentMail")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)
;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")
;; something about ourselves
(setq
   user-mail-address "t@taozj.org"
   user-full-name  "taozhijiang"
   mu4e-compose-signature
    (concat
      "Best Regards,\n"
      "TAO Zhijiang\n"))

(setq mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; fetch mail every 10 mins
(setq mu4e-update-interval 600)


;; configuration for sending mail
(setq message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "smtp.zoho.com"
     smtpmail-smtp-server "smtp.zoho.com"
     smtpmail-smtp-service 587)


(provide 'init-conf)
