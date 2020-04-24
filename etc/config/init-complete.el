(use-package company 
  :defer 2 
  :hook (after-init . global-company-mode) 
  :init (setq company-tooltip-align-annotations t company-idle-delay 0 company-echo-delay 0
              company-minimum-prefix-length 2 company-require-match nil company-dabbrev-ignore-case
              nil company-dabbrev-downcase nil company-show-numbers t)
  :config
  :bind (:map company-active-map
              ("M-n" . nil)
              ("M-p" . nil)
              ("C-n" . #'company-select-next)
              ("C-p" . #'company-select-previous)))


(use-package company-tabnine
  :ensure t
  :after 'company-mode 'company-tabnine-mode
  :config
  (add-to-list 'company-backends #'company-tabnine))

(use-package lsp-mode
  :ensure t
  :hook ('prog-mode . 'lsp-mode))

(provide 'init-complete)
