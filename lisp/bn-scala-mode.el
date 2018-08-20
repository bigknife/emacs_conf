;; scala mode el
(require 'scala-mode)
(use-package scala-mode
  :interpreter
  ("scala" . scala-mode))

;;; add scalafmt support
(defun bigknife-scala/scalafmt-file ()
  (interactive)
  (let ((str (concat "scalafmt -f " buffer-file-name " --config=/Users/benny/.scalafmt.conf -i --exclude ensime")))
    (message str)
    (save-buffer)
    (shell-command-to-string str)
    (revert-buffer t t)
    )

  (message "scalafmt done"))
;;; define key to invoke scalafmt
(global-set-key (kbd "C-x C-<return>") 'bigknife-scala/scalafmt-file)

;;; add hs minor mode and set kbd
(add-hook 'scala-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C--") 'hs-toggle-hiding)
(add-to-list 'auto-mode-alist '("\\.conf\\'" . javascript-mode))
