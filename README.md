emacs-profile
=============
ztao's emacs personal profile. 

If you are interested in it, you can use it freely:
git clone https://github.com/taozhijiang/aquamacs_setting_repos.git

then modifiy your ~/.emacs & .gnus.el(if you use gnus read newsgroup)
~/.emacs
==============

(defconst CustHomeDir "~/Dropbox/GitHub/aquamacs_setting_repos/")

(add-to-list 'load-path CustHomeDir)
(add-to-list 'load-path (concat CustHomeDir "init/"))
(add-to-list 'load-path (concat CustHomeDir "entertain/"))
(add-to-list 'load-path (concat CustHomeDir "program/"))
(add-to-list 'load-path (concat CustHomeDir "tools/"))
(add-to-list 'load-path (concat CustHomeDir "install-lisp/"))

(require 'init-emacs)

~/.gnus.el
==============

(defconst CustHomeDir "~/Dropbox/GitHub/aquamacs_setting_repos/")
(add-to-list 'load-path (concat CustHomeDir "/gnus/"))
(require 'init-gnus)

Note: change your CustHomeDir to your dot.emacs.d correspondingly.

This customization may contain some of my personal information, please
do not do evil with it! :-)
