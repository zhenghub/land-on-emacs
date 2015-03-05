(message "starting loading landOnEmacs")

;;org-mode
(setq org-startup-indented t);打开org-mode时自动启用org-indent-mode
(global-set-key "\C-cl" 'org-store-link);使用org-mode时在当前位置保存链接，这样就可以使用C-c C-l时使用保存的链接
(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s!)" "HUANGUP(h)" "INTERRUPT(i!)" "|" "DONE(d!)" "CANCELD(c)" "FAIL(f!@)")))

;;common
(global-linum-mode t);显示行号列
(display-time-mode 1);在minibuffer上显示时间
(setq display-time-24hr-format t);使用24小时制
(setq display-time-day-and-date t);显示日期
(setq display-time-interval 10);时间刷新频率

(defun loe-os-windows-p ()
    "判断当前操作系统是否windows"
  (equal system-type 'windows-nt)
  )

(defun loe-os-linux-p ()
  "判断当前操作系统是否linux"
  (equal system-type 'gnu/linux)
  )

(defun loe-expand-relative-path (relative-path)
  "把相对路径扩展成绝对路径"
  (setq abs-path (file-name-directory load-file-name))
  (concat abs-path relative-path)
)

(defun loe-goto-line-or-recenter (&optional arg)
  "如果有参数就跳到arg所指定的行，否则只是调整调整页面，让光标居中、居顶、居底"
  (interactive "P")
  (cond
   (arg (goto-line arg));跳到指定行
   (t (recenter-top-bottom))
   )
)
(global-set-key "\C-l" 'loe-goto-line-or-recenter)

(defun loe-not-empty-p (sequence)
  "判断sequence是否为空"
  (< 0 (length sequence))
  )

(defun loe-ensure-list (obj)
  "如果obj不是list，就转成list"
  (if (listp obj)
      obj
    (list obj)
    )
  )

(defun loe-append-element (sequence ele)
  "把ele添加到sequence的最后"
  (if sequence
      (nconc sequence (loe-ensure-list ele))
    (list ele)
    )
  )

(defun loe-list-subdirs (path &optional recursive)
  "获取path下的所有子文件夹，如果recursive为non-nil，则会非递归按先序深度优先遍历的顺序递归查找子文件夹"
  (if (file-directory-p path)
      (if (not recursive)
	  (let ((dir-list (list)))
	    (dolist (subdir (directory-files path t) dir-list)
	      (and (file-directory-p subdir);判断是否文件夹
		   (not (member (file-name-nondirectory subdir) '("." "..")))
		   (setq dir-list (loe-append-element dir-list subdir)))))
	(progn
	  (let ((stack (loe-list-subdirs path)) result-list curpath)
		(while (loe-not-empty-p stack)
		  (setq curpath (pop stack))
		  (setq result-list (loe-append-element result-list curpath))
		  (setq stack (nconc (loe-list-subdirs curpath) stack))
		  )
		result-list
		)
	    ))))

(defun loe-nconc-childlist (list)
  "对list中的每个元素，确保是个list类型，并合并成一个总的list"
  (let (result)
    (dolist (ele  list result)
      (setq result (nconc result (loe-ensure-list ele)))
      )
    )
  )
      
(defun loe-include-subdirs (dir-list &optional recursive)
  "把dir-list中每个文件夹的子目录也加入进来，如果recursive为non-nil，则递归遍历子文件夹"
  (loe-nconc-childlist (mapcar (lambda (dir) (cons dir (loe-list-subdirs dir recursive)))
	  dir-list
	  )))

(defun loe-refresh-file ()
  "刷新文件，如果buffer发生修改，就询问用户是否确定；否则直接刷新"
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t)
)
(global-set-key [(control f5)] 'loe-refresh-file)


;;使用ibuffer替换默认的C-x C-b
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(load (loe-expand-relative-path "plugins.el"));加载插件设置文件
(load (loe-expand-relative-path "thems.el"));加载主题设置文件

;;自动高亮配对的括号
(show-paren-mode)

;;最大化frame
(defun loe-maximize-frame ()
  "最大化frame"
  (interactive)
  (cond ((loe-os-windows-p) (w32-send-sys-command #xf030))
	((loe-os-linux-p) (progn (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
						 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
						 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)
)
	)

  )
)
)

;;启动时最大化
(if (loe-os-windows-p) (progn
					;设置window-setup-hook没有用，经过摸索就碰出来这么一条路，先设置最大化，再在开始界面后执行一遍最大化
			    ;原因可能是并行的问题
			    (loe-maximize-frame)
					;(setq inhibit-startup-message t)
			    (setq loe-initial-buffer-choice-b initial-buffer-choice);备份initial-buffer-choice变量
			    (setq initial-buffer-choice
				  '(lambda () (let ((res (if loe-initial-buffer-choice-b loe-initial-buffer-choice-b (display-startup-screen))))
						(loe-maximize-frame) res)))
					;(add-hook 'window-setup-hook 'loe-maximize-frame)
			    )
  (loe-maximize-frame)
  )

