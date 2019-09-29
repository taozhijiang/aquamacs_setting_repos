﻿

;; 当需要以root的身份修改当前的buffer时候
;; 注意：使用 /sudo::/etc... 这样打开文件也可以
(defun wenshan-edit-current-file-as-root ()
  "Edit the file that is associated with the current buffer as root"
  (interactive)
  (if (buffer-file-name)
      (progn
        (setq file (concat "/sudo:root@localhost:" (buffer-file-name)))
        (find-file file))
    (message "Current buffer does not have an associated file.")))
(global-set-key "\C-xm" 'wenshan-edit-current-file-as-root)


;; TRAMP
;; for remote access file
;; note:
;;      if you want to access local file with root power, using:
;;      C-x C-f /su::/etc/resolv.conf
;; or   C-x C-f /sudo::/etc/resolv.conf
(add-to-list 'load-path 
    (concat CustHomeDir "/tools/tramp/lisp/"))
(add-to-list 'Info-default-directory-list 
    (concat CustHomeDir "/tools/tramp/info/"))
(require 'tramp)
(setq tramp-default-user "ztao"
        tramp-defalt-host "taozj.org")
(add-to-list 'backup-directory-alist
             (cons "." 
                (concat CustHomeDir "/EmacsData/tramp/")))
(setq tramp-backup-directory-alist backup-directory-alist)
(setq tramp-chunksize 500) ;; just add this in case of hung



;; 光标的样式设置
;; 插入，竖线条    改写/只读，方块
;; box  hellow(中空)  bar  hbar
(require 'cursor-chg)            ; Load this library
(change-cursor-mode 1)           ; On for overwrite/read-only/input mode
(toggle-cursor-type-when-idle 1) ; On when idle
(setq curchg-idle-cursor-type 'hellow);
(setq curchg-overwrite/read-only-cursor-type 'box);


;; 当前行高亮显示
(require 'hl-line+)             ;; Load this file (it will load `hl-line.el')
(toggle-hl-line-when-idle 1)    ;; 是否只在空闲的时候才高亮当前行
(setq hl-line-idle-interval 2)


;; 使用Ctrl-\进行修改历史的返回
(require 'redo+)
(global-unset-key (kbd "C-\\"))
(global-set-key (kbd "C-\\") 'redo) 


;; Ctrl-TAB可以在多个Tabs之间进行快速地切换
(require 'ebs)
(ebs-initialize)
(global-set-key [(control tab)] 'ebs-switch-buffer)

;; 让脚本在保存的时候，可以自动添加可执行权限
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; 快捷键的配置
;; C-c C-c p: markdown-command > temporary file > browser.
;; C-c C-c l: markdown-live-preview-mode > *eww* buffer.


(provide 'init-func)
