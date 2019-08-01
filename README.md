emacs-profile
=============
ztao's emacs personal profile. 

If you are interested in it, you can use it freely:
git clone https://github.com/taozhijiang/dot.emacs.d

then modifiy your ~/.emacs & .gnus.el(if you use gnus read newsgroup)
~/.emacs
==============

(require 'init-emacs)

~/.gnus.el
==============
(defconst relative-dir "~/Study/GitHub/dot.emacs.d.git/")
(add-to-list 'load-path 
	(concat relative-dir "/gnus/"))
(require 'init-gnus)

Note: change your relative-dir to your dot.emacs.d correspondingly.

This customization may contain some of my personal information, please
do not do evil with it! :-)
