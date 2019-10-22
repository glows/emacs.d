;; 我们在这个文件里配置Emacs

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

;; 设置为全屏
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (doom-themes dakrone-light-theme w3m use-package spacemacs-theme ranger projectile multi-term magit lispy gruvbox-theme grip-mode elpy ahungry-theme))))
;; 加载ahungry主题
(load-theme 'doom-dracula t)
;; 加载gruvbox主题
;; (load-theme 'spacemacs-dark t)

;; 设置字体
;; 如果有图形界面，可以在菜单栏选择set default font，选择好后，M-x describe-font
;; (set-default-font "-*-Menlo-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(set-default-font "Menlo-16")

;; 隐藏工具栏
(tool-bar-mode -1)

;; 隐藏菜单栏
(menu-bar-mode -1)

;; 隐藏滚动条
(scroll-bar-mode -1)

;; 关闭错误提示音
(setq ring-bell-function 'ignore)

;; 粘贴跟随光标
(setq mouse-yank-at-point t)

;; yes or no 改为 y/n
(fset 'yes-or-no-p 'y-or-n-p)

(setq use-package-always-ensure t)

;; org文件以缩进的形式显示
(setq org-startup-indented t)
;; 最近打开过的文件
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; 快速打开init.elnn
;(global-set-key (kbd "C-x i") (find-file "~/.emacs.d/init.el"))
;; 配置magit
(use-package
  magit
  :bind ("C-x g" . t-status))
;; 配置lispy
(use-package
  lispy
  :config (add-hook
	   'emacs-lisp-mode-hook
	   (lambda () (lispy-mode 1))))
;; 配置ranger
(use-package
  ranger)
;; 配置projectile
(use-package
  projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; 配置awesome-tab
(add-to-list 'load-path (expand-file-name "~/elisp/awesome-tab"))
(require 'awesome-tab)
(awesome-tab-mode t)
;; 配置company-english-helper
(add-to-list 'load-path (expand-file-name "~/elisp/company-english-helper"))
(require 'company-english-helper)
;; 配置grip-mode
(use-package grip-mode
  :ensure t
  :hook ((markdown-mode org-mode) . grip-mode))
(add-hook 'markdown-mode-hook #'grip-mode)
(add-hook 'org-mode-hook #'grip-mode)

;; 配置iimage mode
(add-to-list 'load-path (expand-file-name "~/elisp/iimage.el"))
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
;; 配置aweshell
(add-to-list 'load-path (expand-file-name "~/elisp/aweshell"))
(require 'aweshell)
;; 配置multi-shell
(require 'multi-term)
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
