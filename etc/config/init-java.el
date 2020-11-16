;;; Java 支持
(use-package lsp-java
  :commands (lsp)
  :ensure t
  :hook (java-mode . (lambda () (require 'lsp-java)))
  :config
  (setq lsp-java-server-install-dir (expand-file-name "~/.emacs.d/var/jdt-lsp")))

(provide 'init-java)
