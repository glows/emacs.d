;; =============MARKDOWN支持=============
(use-package
  markdown-mode+
  :ensure t
  :hook (markdown-mode . (lambda () (require 'markdown-mode+)))
  :config
  (if (fontp (font-spec :name "Sarasa Mono SC"
						:style "Regular"
						:size 20))
	  (progn
		(set-face-attribute 'markdown-table-face nil
							:font (font-spec :name "Sarasa Mono SC"
											 :style "Regular"
											 :size 20))
		(set-face-attribute 'markdown-url-face nil
							:font (font-spec :name "Sarasa Mono SC"
											 :style "Regular"
											 :size 20))
		(set-face-attribute 'markdown-markup-face nil
							:font (font-spec :name "Sarasa Mono SC"
											 :style "Regular"
											 :size 20)))
	(message "无法找到Sarasa Mono SC字体，你可以更换其他字体或安装它让这条消息消失.")))

(provide 'init-markdown)
