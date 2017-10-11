(require 'ox-md)
(require 'ox-ascii)

;;; export to github's markdown style
;;; https://guides.github.com/features/mastering-markdown/

;;; Define Back-End

(org-export-define-derived-backend 'hexo 'md
  :filters-alist '((:filter-parse-tree . org-md-separate-elements))
  :menu-entry
  '(?H "Export as Hexo Markdown"
       ((?b "To temporary buffer"
	    (lambda (a s v b) (org-hexo-export-as-hexo a s v)))
	(?f "To file" (lambda (a s v b) (org-hexo-export-to-hexo a s v)))))
  :translate-alist '((table . org-hexo-export-table)
		     (table-cell . org-hexo-export-table-cell)
		     (table-row . org-hexo-export-table-row))
  :options-alist
  '((:md-footnote-format nil nil org-md-footnote-format)
    (:md-footnotes-section nil nil org-md-footnotes-section)
    (:md-headline-style nil nil org-md-headline-style)))

(defun org-hexo-export-table (table contents info)
  (replace-regexp-in-string "\n\n" "\n" contents))

(defun org-hexo-export-table-cell (table-cell contents info)
  "Transcode a TABLE-CELL object from Org to ASCII.
CONTENTS is the cell contents.  INFO is a plist used as
a communication channel."
  ;; Determine column width.  When `org-ascii-table-widen-columns'
  ;; is nil and some width cookie has set it, use that value.
  ;; Otherwise, compute the maximum width among transcoded data of
  ;; each cell in the column.
  (let ((width (org-ascii--table-cell-width table-cell info)))
    ;; When contents are too large, truncate them.
    (unless (or (plist-get info :ascii-table-widen-columns)
		(<= (string-width (or contents "")) width))
      (setq contents (concat (substring contents 0 (- width 2)) "=>")))
    ;; Align contents correctly within the cell.
    (let* ((indent-tabs-mode nil)
	   (data
	    (when contents
	      (org-ascii--justify-lines
	       contents width
	       (org-export-table-cell-alignment table-cell info)))))
      (setq contents
	    (concat data
		    (make-string (- width (string-width (or data ""))) ?\s))))
    ;; Return cell.
    (format "| %s " contents)))

(defun org-hexo-export-table-row (table-row contents info)
  "Transcode a TABLE-ROW element from Org to ASCII.
CONTENTS is the row contents.  INFO is a plist used as
a communication channel."
  (when (eq (org-element-property :type table-row) 'standard)
    (let ((borders (org-export-table-cell-borders
		    (org-element-map table-row 'table-cell 'identity info t)
		    info)))
      (concat (when (memq 'above borders)
		(concat
		 (apply 'concat "|"
			(org-element-map table-row 'table-cell
			  (lambda (cell)
			    (let ((width (org-ascii--table-cell-width cell info))
				  (borders (org-export-table-cell-borders cell info)))
			      (concat (make-string (+ 2 width) (string-to-char "-")) "|" )))))
		 "\n"))
	      contents
	      "|"
	      ))))

;;;###autoload
(defun org-hexo-export-as-hexo (&optional async subtreep visible-only)

  (interactive)
  (org-export-to-buffer 'hexo "*Org Hexo Export*"
    async subtreep visible-only nil nil (lambda () (text-mode))))

(setq org-hexo-repo-path (file-name-as-directory "~/tmp/blog/source/_posts/"))

(defun org-hexo-export-file-to-hexo (file)
  (interactive)
  (let ((filename (file-name-base file)))
    (find-file file)
    (org-hexo-export-as-hexo)
    (set-visited-file-name (concat org-hexo-repo-path filename ".md"))
    (save-buffer)
    )
  )

(provide 'org-hexo)

