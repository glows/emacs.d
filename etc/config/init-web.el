;; 写网页可用的模式
(use-package 
  web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode))

(use-package emmet-mode
  :ensure t
  :hook ((web-mode . emmet-mode)
	  (css-mode . emmet-mode)))

(provide 'init-web)
