
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives ' ("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/packages")

(require 'org-hexo)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-mode 1)

(setq my/init-file-name "/Users/zh/git/land-on-emacs/init.el")
(defun my/init-file-dir-file (file)
  (expand-file-name file (file-name-directory my/init-file-name))
  )

(load-file (my/init-file-dir-file "args.el"))
(load-file (my/init-file-dir-file "org.el"))

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "e" 'find-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-leader org-pomodoro evil helm org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
