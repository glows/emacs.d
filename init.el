;; 我们在这个文件里配置Emacs

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

;; 设置字体
;;(set-default-font "-*-Menlo-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(set-default-font "Menlo-18")
;; 加载ahungry主题
;;(load-theme 'ahungry t)

;; 加载gruvbox主题
(load-theme 'gruvbox-dark-hard t)

;; 隐藏工具栏
(tool-bar-mode -1)

;; 隐藏菜单栏
(menu-bar-mode -1)

;; use-package
(setq use-package-always-ensure t)

;; 安装magit
(use-package
  magit
  :bind ("C-x g" . magit-status))
;; 安装lispy
(use-package
  lispy
  :config (add-hook
	   'emacs-lisp-mode-hook
	   (lambda () (lispy-mode 1))))
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lispy magit use-package gruvbox-theme ahungry-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


