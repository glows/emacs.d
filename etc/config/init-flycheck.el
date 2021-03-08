;; 代码检查
(use-package 
  flycheck 
  :ensure t 
  :commands (flycheck-mode)
  ;; :hook (prog-mode . flycheck-mode)
  :bind (:map leader-key
              ("t t" . global-flycheck-mode)) 
  :config (which-key-add-key-based-replacements "M-SPC t t" "开关flycheck")
  (setq flycheck-global-modes '(not text-mode outline-mode fundamental-mode org-mode diff-mode
                                    shell-mode eshell-mode term-mode vterm-mode)
        flycheck-emacs-lisp-load-path 'inherit
        ;; Only check while saving and opening files
        ;; 只在打开和保存文件时才进行检查
        flycheck-check-syntax-automatically '(save mode-enabled) flycheck-indication-mode
        'right-fringe)

  ;; 美化一下
  (when (fboundp 'define-fringe-bitmap) 
    (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow [16 48 112 240 112 48 16] nil nil
      'center)))
;; 用GUI tooltips来显示检查到的错误
(progn
  ;; (use-package 
  ;;   flycheck-posframe 
  ;;   :ensure t 
  ;;   :custom-face (flycheck-posframe-border-face ((t 
  ;;   											  (:inherit default)))) 
  ;;   :hook (flycheck-mode . flycheck-posframe-mode) 
  ;;   :init (setq flycheck-posframe-border-width 1 flycheck-posframe-inhibit-functions '((lambda 
  ;;   																					 (&rest _) 
  ;;   																					 (bound-and-true-p
  ;;   																					  company-backend)))))
  
  (use-package 
	flycheck-pos-tip 
	:ensure t 
	:defines flycheck-pos-tip-timeout 
	:hook (global-flycheck-mode . flycheck-pos-tip-mode) 
	:config (setq flycheck-pos-tip-timeout 30)) 
  ;; (use-package 
  ;;   flycheck-popup-tip 
  ;;   :ensure t 
  ;;   :hook (flycheck-mode . flycheck-popup-tip-mode))
  )


(provide 'init-flycheck)
