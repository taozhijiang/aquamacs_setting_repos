;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   ztao's emacs profile
;;
;;   <t@taozj.org>
;;   All rights reserved.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; 个人信息设置
(setq user-full-name "taozhijiang")
(setq user-mail-address "t@taozj.org")


;; 设置配置修改时候的备份文件夹位置
(setq auto-directory (concat CustHomeDir "/EmacsData/autosaves/"))
(setq back-directory (concat CustHomeDir "/EmacsData/backups/"))
(if (not (file-exists-p auto-directory))  (make-directory auto-directory) )
(if (not (file-exists-p back-directory))  (make-directory back-directory) )
(custom-set-variables
    '(auto-save-file-name-transforms `((".*", auto-directory t)))
    '(backup-directory-alist `((".*" . back-directory )))
    )

;; 除了默认的Ctrl-X之外，再额外增加两种的键盘前缀映射
;; Ctrl-C
(define-prefix-command 'ctl-c-map)
(global-set-key (kbd "C-c") 'ctl-c-map)
;; Ctrl-T
(global-unset-key (kbd "C-t"))
(define-prefix-command 'ctl-t-map)
(global-set-key (kbd "C-t") 'ctl-t-map)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 通用的外观设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq inhibit-startup-message t)                ;;缩减启动信息
(global-font-lock-mode t)                       ;;打开语法高亮显示
(setq initial-frame-alist (quote ((fullscreen, maximized)))) ;; 启动时候窗口最大化

;; 颜色主题，采用solarized-light
(add-to-list 'custom-theme-load-path
             (concat CustHomeDir "/tools/theme-solarized/")
             (concat CustHomeDir "/tools/"))
;; (load-theme 'solarized-light t)
(load-file (concat CustHomeDir "/tools/zenburn-theme.el"))

;; 关闭滚动条、关闭工具栏、打开菜单栏，界面尽量的简洁
(scroll-bar-mode -1)  ;; 滚动栏
(tool-bar-mode -1)    ;; 工具栏
(menu-bar-mode t)     ;; 菜单栏

;; 打开全局的行号显示，下面的格式化用于行号和正文之间流出一个空格间隙，以便于查看真正文本内容
(global-hl-line-mode t)
(global-linum-mode t) ;; 显示行号
(eval-after-load "linum"
    '(set-face-attribute 'linum nil :height 100))

;; 光标相关设置
(mouse-avoidance-mode 'animate)
(blink-cursor-mode 1)
(setq-default cursor-type 'bar)         ;; buffer-local 变量，需要使用set-default

(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      kill-ring-max 5000                ; increase kill-ring capacity
)

;; 全局制表符的设置
(setq-default tab-width 4)
(setq default-tab-width 4)
(setq c-basic-offset 4)
(setq c++-basic-offset 4)

;;
;; 日期和时间的显示设置，包括日历
(display-time-mode t)
(setq display-time-24hr-format t
      display-time-day-and-date t
      display-time-interval 10
      display-time-format "%Y-%m-%d %a %H:%M")
(display-time)
;; 从周一开始计算新的一周
(setq calendar-week-start-day 1)
(setq calendar-location-name "北京")

(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "已" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

(setq calendar-latitude +39.54
      calendar-longitude +116.28
      calendar-location-name "北京")



;; Yes/No的确认需求采用简写操作
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default kill-whole-line t)               ;; 连带删除整行的结尾换行符
(setq x-select-enable-clipboard t)             ;; 默认将M-x复制到系统剪切板

;;Goto the definite line by the line number "C-x l"
(define-key ctl-x-map "l" 'goto-line)
(global-set-key [(home)] 'beginning-of-buffer)  ;; HOME  END 跳转到缓冲区的开头结尾
(global-set-key [(end)] 'end-of-buffer)


;; 当进行文件删除的时候，移动到废纸篓方便恢复
;; 但是对于真正的垃圾要真正执行删除操作
(setq delete-by-moving-to-trash t
      system-trash-exclude-matches '("#[^/]+#$" ".*~$" "\\.emacs\\.desktop.*")
      system-trash-exclude-paths '("/tmp"))      system-trash-exclude-paths


;; find -name "*~" -print0 | xargs -0 rm
;; find -name "*~" -exec rm {} \;
(setq backup-by-copying t   ;; That means we do with file, not symbol-link
      delete-old-versions t ;; 自动删除旧的备份文件
      kept-new-versions 3   ;; 保留最近的6个备份文件
      kept-old-versions 2   ;; 保留最早的2个备份文件
      version-control t)    ;; 多次备份


;; session 会话数据保存，包括打开的历史文件列表等
;; save the corresponding things
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq session-save-file
	(concat CustHomeDir "/EmacsData/session" ))


;; 归纳在其他文件中的配置信息
(require 'init-edit)
(require 'init-conf)
(require 'init-func)
(require 'init-org)

;; heavily helm

(require 'init-program)
(semantic-mode 1)
(setq semanticdb-default-save-directory
      (concat CustHomeDir "/EmacsData/semanticdb/"))
;; 全局的键盘映射表设置
(require 'global-keymap)
(require 'emacs-code-patch)

(require 'init-entertain)

(provide 'init-emacs)
