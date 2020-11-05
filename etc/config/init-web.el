;; 写网页可用的模式
(use-package 
  web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode))

;; (use-package pp-html
;;   :load-path "~/.emacs.d/site-lisp/pp-html")

(use-package emmet-mode
  :ensure t
  :hook ((web-mode . emmet-mode)
		 (css-mode . emmet-mode)))

(use-package css-mode
  :ensure nil
  :init (setq css-indent-offset 2))

(use-package scss-mode
  :ensure t
  :init
  (setq scss-compile-at-save nil))

(unless (fboundp 'less-css-mode)
  (use-package less-css-mode
	:ensure nil))

;; 写js可用的模式
(use-package js2-mode 
  :mode (("\\.js\\'" . js2-mode)
		 ("\\.jsx\\" . js2-jsx-mode))
  :ensure t)

(use-package prettier-js
  :diminish
  :ensure t
  :hook ((js-mode js2-mode json-mode web-mode css-mode sgml-mode html-mode)
         .
         prettier-js-mode))



(provide 'init-web)
