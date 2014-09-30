(defun loe-expand-plugin-abs-path (plugin-dir-name)
  "根据`loe-plugin-dir'扩展路径"
  (concat loe-plugin-dir plugin-dir-name)
)

;;yasnippet
;;模板工具，可以通过输入一个缩写就扩展成函数模板，已经支持C,C++,C#,Perl,Python,Ruby,SQL,LaTex,HTML,CSS等等.
(add-to-list 'load-path (loe-expand-plugin-abs-path "yasnippet"))
(require 'yasnippet)
(yas-global-mode 1)

;;ecb
;;emacs code browser。可以提供一个单独window，显示当前文件夹下的文件，当前文件中的函数变量类等
(add-to-list 'load-path (loe-expand-plugin-abs-path "ecb"))
(setq loe-ecb-loaded nil)
(defun loe-load-ecb-if-not-loaded ()
  "如果没有加载ecb，就加载"
  (if (not loe-ecb-loaded)
      (require 'ecb)
    (setq loe-ecb-loaded t)
    )
)

(defun loe-activate-ecb (&optional arg)
  "如果没有加载ecb，就加载ecb。然后启动ecb"
  (interactive "P")
  (cond
   (arg (message arg))
   )
  (loe-load-ecb-if-not-loaded)
  (ecb-activate)
)
;;(require 'ecb-autoloads)

;;session.el
(add-to-list 'load-path (loe-expand-plugin-abs-path "session"))
(require 'session)
(add-hook 'after-init-hook 'session-initialize)


;;ipython
(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i D:\\program\\python27\\Scripts\\ipython2.exe"
      python-shell-prompt-regexp "In \\[[0-9]+\\]: .*"
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
)
(message (concat "python-shell-prompt-regexp:" python-shell-prompt-regexp))
(message "\\")


;;浏览kill-ring
;;(require 'browse-kill-ring)
;;(global-set-key [(control c)(k)] 'browse-kill-ring)
;;(browse-kill-ring-default-keybindings)
(add-to-list 'load-path (loe-expand-plugin-abs-path "browse-kill-ring"))
(add-to-list 'load-path (loe-expand-plugin-abs-path "browse-kill-ring-plus"))
(require 'browse-kill-ring+)

;;popup
;;need by auto-complete
(add-to-list 'load-path "e:/git/emacs-plugins/popup-el")
(require 'popup)

;;auto-complete
(add-to-list 'load-path "e:/git/emacs-plugins/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

