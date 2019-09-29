
;; 在编程模式下，如果有无用的空白，则显示它
(add-hook 'prog-mode-hook 
          (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; 可以启用显示空白字符串模式
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show important whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
              (setq-local whitespace-style
                           '(face
                             tabs
                             tab-mark
                             spaces
                             space-mark
                             trailing
                             indentation::space
                             indentation::tab
                             newline
                             newline-mark))
               (whitespace-mode 1)))


(defadvice kill-ring-save (before slick-copy activate compile)
    "When called interactively with no active region, copy a single line instead."
    (interactive
    (if mark-active (list (region-beginning) (region-end))
        (message "Copied line")
            (list (line-beginning-position)
                    (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
    "When called interactively with no active region, kill a single line instead."
    (interactive
    (if mark-active (list (region-beginning) (region-end))
        (list (line-beginning-position)
            (line-beginning-position 2)))))

;; kill a line, including whitespace characters until next non-whiepsace character of next line
(defadvice kill-line (before check-position activate)
    (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode
                                latex-mode plain-tex-mode))
        (if (and (eolp) (not (bolp)))
            (progn (forward-char 1)
                   (just-one-space 0)
                   (backward-char 1)))))

;; Easy duplicate line or region, with comment out.
(require 'duplicate-thing)
(global-set-key (kbd "C-c c") 'duplicate-thing)

;; VolatileHighlights highlights changes to the buffer caused by commands such as ‘undo’, ‘yank’/’yank-pop’, etc. 
(require 'volatile-highlights)
(volatile-highlights-mode t)

(provide 'init-edit)
