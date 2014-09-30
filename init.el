(message "starting loading landOnEmacs")

;;org-mode
(setq org-startup-indented t);;打开org-mode时自动启用org-indent-mode
(global-set-key "\C-cl" 'org-store-link);;使用org-mode时在当前位置保存链接，这样就可以使用C-c C-l时使用保存的链接

;;common
(global-linum-mode t);;显示行号列
(display-time-mode 1);;在minibuffer上显示时间
(setq display-time-24hr-format t);;使用24小时制
(setq display-time-day-and-date t);;显示日期
(setq display-time-interval 10);;时间刷新频率

(defun loe-expand-relative-path (relative-path)
  "把相对路径扩展成绝对路径"
  (setq abs-path (file-name-directory load-file-name))
  (concat abs-path relative-path)
)

(defun loe-goto-line-or-recenter (&optional arg)
  "如果有参数就跳到arg所指定的行，否则只是调整调整页面，让光标居中、居顶、居底"
  (interactive "P")
  (cond
   (arg (goto-line arg));;跳到指定行
   (t (recenter-top-bottom))
   )
)
(global-set-key "\C-l" 'loe-goto-line-or-recenter)


(defun loe-refresh-file ()
  "刷新文件，如果buffer发生修改，就询问用户是否确定；否则直接刷新"
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t)
)
(global-set-key [(control f5)] 'loe-refresh-file)


;;使用ibuffer替换默认的C-x C-b
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(load (loe-expand-relative-path "plugins.el"));;加载插件设置文件
(load (loe-expand-relative-path "thems.el"));;加载主题设置文件
