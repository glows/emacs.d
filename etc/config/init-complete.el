;; 著名的Emacs补全框架
(use-package 
  company 
  :defer 2 
  :hook (after-init . global-company-mode) 
  :init (setq company-tooltip-align-annotations t company-idle-delay 0 company-echo-delay 0
              company-minimum-prefix-length 1 company-require-match nil company-dabbrev-ignore-case
              nil company-dabbrev-downcase nil company-show-numbers t) 
  :config 
  :bind (:map company-active-map
              ("M-n" . nil) 
              ("M-p" . nil) 
              ("C-n" . #'company-select-next) 
              ("C-p" . #'company-select-previous)) 
  (:map leader-key
        ("c s" . #'company-yasnippet))) 

;; 人工智能补全代码
(use-package 
  company-tabnine
  :disabled 
  :ensure t 
  :after 'company-mode 
  'company-tabnine-mode 
  :config (add-to-list 'company-backends #'company-tabnine))

;; Emacs对语言服务器支持的插件
(when (graphic-p)
    (use-package 
      lsp-mode 
      :ensure t 
      :hook ('prog-mode . 'lsp-mode) 
      :custom (lsp-idle-delay 0)
      :config
      (setq lsp-prefer-capf t)))

;; 美化company
(use-package 
  company-box 
  :ensure t 
  :hook (company-mode . company-box-mode))

;; 代码片段
(use-package 
  yasnippet 
  :ensure t 
  :commands (yas-reload-all) 
  :init (autoload 'yas-minor-mode-on "yasnippet") 
  (setq yas-snippet-dirs '("~/.emacs.d/etc/snippets")) 
  (dolist (x '(org-mode-hook prog-mode-hook snippet-mode-hook)) 
    (add-hook x #'yas-minor-mode-on)))

(provide 'init-complete)
