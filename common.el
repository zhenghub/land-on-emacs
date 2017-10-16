(spacemacs/declare-prefix "<f2>" "land-on-emacs")
(spacemacs/set-leader-keys "<f2> d" 'ediff-buffers)

;; insert state中用emacs原生按键
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(spacemacs/declare-prefix "<f3>" "deprecated insert state keys")
(spacemacs/set-leader-keys "<f3> C-e" 'evil-copy-from-below)
