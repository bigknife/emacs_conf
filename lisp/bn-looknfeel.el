;; look and feel

;; use dracula theme
;; (load-theme 'dracula t)
;; (load-theme 'solarized-light t)
;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
;; (load-theme 'ample-light t t)
;; choose one to enable
;; (enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)

;; disable splash screen
(setf inhibit-splash-screen t)
(global-hl-line-mode t)
;; use a empty buffer
(switch-to-buffer (get-buffer-create "bn-startup"))
(delete-other-windows)

;; remove scrollbar, menu bars, toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; windows move
(global-set-key (kbd "C-c C-h") 'windmove-left)
(global-set-key (kbd "C-c C-l") 'windmove-right)
(global-set-key (kbd "C-c C-j") 'windmove-up)
(global-set-key (kbd "C-c C-k") 'windmove-down)

;; reset C-a to back to the indentation
(global-unset-key (kbd "C-a"))
(global-set-key (kbd "C-a") 'back-to-indentation)

;; line space
;; (setq-default line-spacing 0)
(defvar line-padding 1)
(defun add-line-padding ()
  "Add extra padding between lines"

; remove padding overlays if they already exist
(let ((overlays (overlays-at (point-min))))
  (while overlays
    (let ((overlay (car overlays)))
      (if (overlay-get overlay 'is-padding-overlay)
          (delete-overlay overlay)))
    (setq overlays (cdr overlays))))
; add a new padding overlay
(let ((padding-overlay (make-overlay (point-min) (point-max))))
  (overlay-put padding-overlay 'is-padding-overlay t)
  (overlay-put padding-overlay 'line-spacing (* .1 line-padding))
  (overlay-put padding-overlay 'line-height (+ 1 (* .1 line-padding))))
(setq mark-active nil))


(add-hook 'buffer-list-update-hook 'add-line-padding)

;; fold-this
;; (global-set-key (kbd "C-c C-f") 'fold-this-all)
;; (global-set-key (kbd "C-c C-F") 'fold-this)
;; (global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;;; maxmize on open
(add-hook 'window-setup-hook 'toggle-frame-maximized)

;;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-c C-f") 'helm-projectile-find-file)
(global-set-key (kbd "C-c C-c C-f") 'helm-projectile-switch-project)

;;; reveal in osx finder
(global-set-key (kbd "C-c o") 'reveal-in-osx-finder)

;;; org mode
(require 'org)
(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "C-c C-c") nil)
    (define-key org-mode-map (kbd "C-c C-f") nil)    
    )
  )
(require 'web-mode)
(eval-after-load 'web
  (progn
    (define-key web-mode-map (kbd "C-c C-c") nil)
    (define-key web-mode-map (kbd "C-c C-f") nil)    
    )
  )
;; transparent
(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(96 . 80) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)


;; for emacs-mac port
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-pass-command-to-system nil)

(defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

