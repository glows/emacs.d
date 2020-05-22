;;; ============配置dired相关=============

(use-package dired
  :config
  (put 'dired-files-attributes-file 'disable nil))

;; 在Emacs中使用终端程序ranger
(use-package ranger
  :ensure t
  :config
  (ranger-override-dired-mode 1))
(provide 'init-dired)
