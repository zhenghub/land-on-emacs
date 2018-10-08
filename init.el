(message "=>load-file-name:%s" load-file-name)
(setq my/init-file-name
        (file-truename load-file-name)
      )
(message "=>my/init-file-name:%s" my/init-file-name)

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
 '(package-selected-packages
   (quote
    (bind-map yapfify xterm-color web-mode web-beautify tagedit sql-indent smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download noflet multi-term mmm-mode minitest markdown-toc markdown-mode magit-gitflow livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc hy-mode htmlize helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode graphviz-dot-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit magit-popup git-commit ghub treepy let-alist graphql with-editor eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode emmet-mode cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-emacs-eclim eclim company-anaconda company coffee-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider sesman seq queue clojure-mode chruby bundler inf-ruby auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
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
