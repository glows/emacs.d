(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode)
  :bind (:map leader-key
              ("t t" . global-flycheck-mode))
  :config
  (which-key-add-key-based-replacements
    "M-SPC t t" "开关flycheck")
  
  (setq flycheck-global-modes
        '(not text-mode outline-mode fundamental-mode org-mode
              diff-mode shell-mode eshell-mode term-mode vterm-mode)
        flycheck-emacs-lisp-load-path 'inherit
        ;; Only check while saving and opening files
        ;; 只在打开和保存文件时才进行检查
        flycheck-check-syntax-automatically '(save mode-enabled)
        flycheck-indication-mode 'right-fringe)

  ;; 美化一下
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
      [16 48 112 240 112 48 16] nil nil 'center))

  ;; 用GUI tooltips来显示检查到的错误
  (if (display-graphic-p)
      (use-package flycheck-posframe
        :ensure t
        :custom-face (flycheck-posframe-border-face ((t (:inherit default))))
        :hook (flycheck-mode . flycheck-posframe-mode)
        :init (setq flycheck-posframe-border-width 1
                    flycheck-posframe-inhibit-functions
                    '((lambda (&rest _) (bound-and-true-p company-backend)))))
    (use-package flycheck-pos-tip
      :ensure t
      :defines flycheck-pos-tip-timeout
      :hook (global-flycheck-mode . flycheck-pos-tip-mode)
      :config (setq flycheck-pos-tip-timeout 30)))
  (use-package flycheck-popup-tip
    :ensure t
    :hook (flycheck-mode . flycheck-popup-tip-mode)))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-delay 1)
  :init
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-webkit nil
        lsp-ui-doc-delay 0.2
        lsp-ui-doc-include-signature t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-border (face-foreground 'default)
        lsp-eldoc-enable-hover nil ; Disable eldoc displays in minibuffer

        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-sideline-ignore-duplicate t

        lsp-ui-imenu-enable t
        lsp-ui-imenu-colors `(,(face-foreground 'font-lock-keyword-face)
                              ,(face-foreground 'font-lock-string-face)
                              ,(face-foreground 'font-lock-constant-face)
                              ,(face-foreground 'font-lock-variable-name-face))))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp)))
  :custom
  (lsp-python-ms-executable "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))

(use-package insert-translated-name
  :disabled
  :load-path "~/.emacs.d/site-lisp/insert-translated-name"
  :bind (:map leader-key
              ("c n i" . #'insert-translated-name-insert)
              ("c n r" . #'insert-translated-name-replace))
  :config
  (which-key-add-prefix-title
    "M-SPC c n" "insert-translated-name"))

(use-package yasnippet-snippets
  :ensure t)

(use-package web-mode
  :mode ("\\.html'" . web-mode)
  :ensure t)

(use-package js2-mode
  :mode ("\\.js'" . js2-mode)
  :ensure t)

(provide 'init-prog)
