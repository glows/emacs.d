;; 代码检查
(use-package 
  flycheck 
  :ensure t
  ;; :hook (prog-mode . flycheck-mode)
  :bind (:map leader-key
              ("t t" . global-flycheck-mode)) 
  :config
  (which-key-add-key-based-replacements "M-SPC t t" "开关flycheck")
  (setq flycheck-global-modes '(not text-mode outline-mode fundamental-mode org-mode diff-mode
                                    shell-mode eshell-mode term-mode vterm-mode)
        flycheck-emacs-lisp-load-path 'inherit
        ;; 只在打开和保存文件以及改变文本时才进行检查
        flycheck-check-syntax-automatically '(save mode-enabled idle-change)
        flycheck-indication-mode
        'right-fringe))
;; 美化一下
;; (when (fboundp 'define-fringe-bitmap) 
;;   (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow [16 48 112 240 112 48 16] nil nil
;;     'center)))

;; 用GUI tooltips来显示检查到的错误
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

;; (use-package 
;;   flycheck-pos-tip 
;;   :ensure t 
;;   :defines flycheck-pos-tip-timeout 
;;   :hook (global-flycheck-mode . flycheck-pos-tip-mode) 
;;   :config (setq flycheck-pos-tip-timeout 30))

(provide 'init-flycheck)
