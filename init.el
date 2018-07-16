;; init.el
;; needed by emacs
;; (package-initialize)

;; set location of auto-generated custom.el
(setq custom-file "~/.emacs.d/custom.el")

;; system initialize
(load "~/.emacs.d/lisp/bn-system.el")

;; look and feel
(load "~/.emacs.d/lisp/bn-looknfeel.el")

;; basic editing helper
(load "~/.emacs.d/lisp/bn-basic-editing-helper.el")
