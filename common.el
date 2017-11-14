(spacemacs/declare-prefix "<f2>" "land-on-emacs")
(spacemacs/set-leader-keys "<f2> d" 'ediff-buffers)

;; insert state中用emacs原生按键
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(spacemacs/declare-prefix "<f3>" "deprecated insert state keys")
(spacemacs/set-leader-keys "<f3> C-e" 'evil-copy-from-below)

(spacemacs/declare-prefix "<f2> a" "assist-info")
(defun assist-info/find-cooresponding-file
     (message "ai/fcf")
     )

(require 'find-lisp)

(defun assist-info/list-info-files ()
    (interactive)
    (mapc
     (lambda (x)
       (insert x)
       (insert "\n"))

     (find-lisp-find-files
      (car assist-info/info-dir)
      "\\.org$"
      ))
  )

(spacemacs/set-leader-keys "<f2> a f" 'assist-info/find-cooresponding-file)

(spacemacs/set-leader-keys "<f2> a l" 'assist-info/list-info-files)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (dot . t)
   (python . t)
   (ruby . t)
   (shell . t)
   (scala . t)
   (clojure . t)
   (emacs-lisp . t)
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/libs/plantuml/plantuml.jar"))

(require 'ox-confluence)
(require 'helm-bookmark)

(defun loe/camel-region ()
  (interactive)
  )

(spacemacs/set-leader-keys "<f2> t c" 'loe/camel-region)
