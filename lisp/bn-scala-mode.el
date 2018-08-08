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
