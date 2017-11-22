(setq my/init-file-name load-file-name)
(defun my/init-file-dir-file (file)
  (expand-file-name file (file-name-directory my/init-file-name))
  )

(load-file (my/init-file-dir-file "config.el"))
(if (equal 'spacemacs my/config-type)
    (load-file (my/init-file-dir-file "dotspacemacs.el"))
  (load-file (my/init-file-dir-file "dotcustom.el"))
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((assist-info/info-dir "/home/zh/git/study-dwd/study-rider-standard-service")
     (assist-info/project-dir "/home/zh/git/rider/rider-standard-service")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((assist-info/info-dir "/home/zh/git/study-dwd/study-rider-train-service")
     (assist-info/project-dir "/home/zh/git/rider/rider-train-service")
     (assist-info/info-dir "/home/zh/git/study-dwd/study-rider-standard-service")
     (assist-info/project-dir "/home/zh/git/rider/rider-standard-service")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
