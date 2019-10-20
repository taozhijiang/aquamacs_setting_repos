

;; 娱乐消遣类的工具

;;;;
;; twittering-mode
(load-file (concat CustHomeDir "/entertain/twittering-mode.el"))
(setq twittering-use-master-password t)
;; 使用HTTP代理 127.0.0.1:1087 访问
(setq twittering-proxy-use t
      twittering-proxy-server "127.0.0.1"
      twittering-proxy-port 1087)

(setq twittering-convert-fix-size 32) ;;展示用户头像
(setq twittering-icon-mode t
      twittering-use-icon-storage t)

(require 'twittering-mode)


;;;;
;; offlineimap + mu4e + smtp 收发邮件
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
      "Best Wishes and Regards.\n"
      "　　TAO Zhijiang\n"))

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



;;;;
;; w3m 浏览器访问web

(add-to-list 'load-path
    (concat CustHomeDir "/entertain/emacs-w3m/"))

(require 'w3m-load)
;;(require 'mime-w3m)
(require 'w3m)
(setq browse-url-browser-function 'w3m-browse-url
      w3m-default-display-inline-images t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(setq w3m-command-arguments
;;           (nconc w3m-command-arguments
;;                  '("-o" "http_proxy=http://127.0.0.1:1087/")))

(add-to-list 'load-path
    (concat CustHomeDir "/entertain/"))


;;;;
;; 英文补全助手
;; 需要先开启 company-mode
;; `toggle-company-english-helper
(require 'company-english-helper)


(provide 'init-entertain)
