;; look and feel

;; use dracula theme
(load-theme 'dracula t)

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
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)
