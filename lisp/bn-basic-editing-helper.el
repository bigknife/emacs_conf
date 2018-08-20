;; basic editing helper

;; global linum mode
(global-linum-mode 1)

;; auto revert
(global-auto-revert-mode 1)

;; electirc pair mode
(electric-pair-mode 1)

;; config the packages
(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda ()
    (setq yas-dont-activate t)))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing Github Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("readme\\.md\\'" . gfm-mode))

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "s-/") 'company-complete-common)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "C-p") 'company-select-previous)
     (define-key company-active-map (kbd "C-n") 'company-select-next)))
(setq company-auto-complete t)
(setq company-idle-delay 0)
(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;;; only tab/enter to auto complete
(setq company-auto-complete 'company-explicit-action-p)

;;
;; Save all tempfiles in $TMPDIR/emacs$UID/
(setq create-lockfiles nil)
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
    `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
    `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
    emacs-tmp-dir)
;;
;; auto save all buffers
(defun bn-full-auto-save ()
  (interactive)
  (save-excursion
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (if (and (buffer-file-name) (buffer-modified-p))
	  (basic-save-buffer)))))
(add-hook 'auto-save-hook 'bn-full-auto-save)

;;
;; when foucus out from emacs, auto save
(add-hook 'focus-out-hook 'bn-full-auto-save)


;;
;; default global key mapping
(global-set-key (kbd "C-x v") 'set-mark-command)

;; auto dim other buffer
(add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t))))
