;;;===========================================
;;;					模块介绍
;;; 编程模块
;;;===========================================

;; MODULE: PROGRAMMING

;; AUTHOR: EvanMeek the_lty_mail@foxmail.com

;; CODE:


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
  (use-package 
	flycheck-posframe 
	:ensure t 
	:custom-face (flycheck-posframe-border-face ((t 
												  (:inherit default)))) 
	:hook (flycheck-mode . flycheck-posframe-mode) 
	:init (setq flycheck-posframe-border-width 1 flycheck-posframe-inhibit-functions '((lambda 
																						 (&rest _) 
																						 (bound-and-true-p
																						  company-backend))))) 
  (use-package 
	flycheck-pos-tip 
	:ensure t 
	:defines flycheck-pos-tip-timeout 
	:hook (global-flycheck-mode . flycheck-pos-tip-mode) 
	:config (setq flycheck-pos-tip-timeout 30)) 
  (use-package 
	flycheck-popup-tip 
	:ensure t 
	:hook (flycheck-mode . flycheck-popup-tip-mode)))

;; 美化lsp-mode
(use-package 
  lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  ;; sideline
  (setq lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-update-mode 'line
        ;; sideline
        lsp-ui-sideline-delay 1)
  ;; peek
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;; doc
  (setq lsp-ui-doc-enable t
        ;; 文档显示的位置
        lsp-ui-doc-position 'top
        ;; 显示文档的延迟
        lsp-ui-doc-delay 2))

;; 微软的python语言服务器-老牌稳定
;; (use-package lsp-python-ms
;;   :disabled
;;   :ensure t
;;   :hook (python-mode . (lambda () 
;;                          (require 'lsp-python-ms) 
;;                          (lsp))) 
;;   :custom (lsp-python-ms-executable
;;            "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer"))

;; 微软的python语言服务器-新版
(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp)))
  :init
  (when (executable-find "python3")
    (setq lsp-pyright-python-executable-cmd "python3")))  ; or lsp-deferred

;; 快速插入翻译后的函数名，变量名等。。。
(use-package 
  insert-translated-name
  :disabled 
  :load-path "~/.emacs.d/site-lisp/insert-translated-name" 
  :bind (:map leader-key
              ("c n i" . #'insert-translated-name-insert) 
              ("c n r" . #'insert-translated-name-replace)) 
  :config (which-key-add-prefix-title "M-SPC c n" "insert-translated-name"))

;; 大量可用的代码片段
(use-package 
  yasnippet-snippets 
  :ensure t
  :after yasnippet)

;; 编译运行当前文件
(use-package 
  quickrun 
  :ensure t 
  :commands(quickrun) 
  :bind (:map leader-key
              ("c r" . #'quickrun)) 
  :init (setq quickrun-timeout-seconds nil) 
  (setq quickrun-focus-p nil) 
  (setq quickrun-input-file-extension nil) 
  :config
  (quickrun-add-command "python" 
    '((:command .
                "python3") 
      (:exec .
             "%c %s") 
      (:tempfile . 
                 nil))
    :default "python")
  (quickrun-add-command "c++/c1z"
	'((:command . "g++")
      (:exec    . ("%c -std=c++1z %o -o %e %s"
				   "%e %a"))
      (:remove  . ("%e")))
	:default "c++"))

(provide 'init-prog)
