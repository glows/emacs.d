;;; ============配置dired相关=============


;; 在Emacs中使用终端程序ranger
(use-package ranger
  :disabled
  :ensure t
  :config
  (ranger-override-dired-mode 1))

(use-package diredc
  :load-path "~/.emacs.d/site-lisp/emacs-diredc")
(provide 'init-dired)
