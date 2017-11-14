(setq my/init-file-name load-file-name)
(defun my/init-file-dir-file (file)
  (expand-file-name file (file-name-directory my/init-file-name))
  )

(load-file (my/init-file-dir-file "config.el"))
(if (equal 'spacemacs my/config-type)
    (load-file (my/init-file-dir-file "dotspacemacs.el"))
  (load-file (my/init-file-dir-file "dotcustom.el"))
  )

