(use-package lispy
 :ensure t
 :hook (emacs-lisp-mode . lispy-mode))

;; lisp符号操作工具
(use-package symbol-overlay
  :ensure t
  :hook (emacs-lisp-mode . symbol-overlay-mode))

(provide 'init-emacs-lisp)
