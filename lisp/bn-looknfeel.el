;; look and feel

;; use dracula theme
;; (load-theme 'dracula t)
(load-theme 'solarized-light t)
;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
;; (load-theme 'ample t t)
;; (load-theme 'ample-flat t t)
;; (load-theme 'ample-light t t)
;; choose one to enable
;; (enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)

;; disable splash screen
(setf inhibit-splash-screen t)
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

;; line space
(setq-default line-spacing 0.5)

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
