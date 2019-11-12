

;; 设置package

(setq vallina-install-dir (concat CustHomeDir "/install-lisp/"))
(add-to-list 'load-path vallina-install-dir)
(add-to-list 'load-path "/usr/local/Cellar/mu/1.2.0_1/share/emacs/site-lisp/mu/mu4e/")

;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 25)

    (require 'package)
	(setq package-user-dir vallina-install-dir)
;;    (setq package-check-signature nil)
	(setq package-archives
      '(("GNU_ELPA"     . "http://elpa.emacs-china.org/gnu/")
        ("MELPA"        . "http://elpa.emacs-china.org/melpa/")))
    (package-initialize)

    ;; add here to install packages
    (setq vallina/packages '(
            use-package
            ;; init-conf.el
            session
            smartparens
            nyan-mode
            reveal-in-osx-finder
            iedit
			expand-region
			clean-aindent-mode
            ;; init-entertain.el
            mu4e-maildirs-extension
            ;; init-program
            magit
            highlight-numbers
            popup
            company
            company-c-headers
            flycheck
            modern-cpp-font-lock
            helm
            projectile
            ;; ycmd
            ycmd
            company-ycmd
            flycheck-ycmd
            ;; irony
            irony
            company-irony
            flycheck-irony
    ))

    ; fetch the list of packages available
    (unless package-archive-contents
        (package-refresh-contents))

    ; install the missing packages
    (dolist (package vallina/packages)
        (unless (package-installed-p package)
            (package-install package)))

) ;; end when



(provide 'init-package)
