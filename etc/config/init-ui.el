;; 加载主题
;; (load-file "~/.emacs.d/themes/oyswald-theme.el")
;; 设置透明
(set-frame-parameter nil 'alpha '(85 .100))
;; 设置光标颜色
;; (set-cursor-color "green2")
;; 设置光标样式
(setq-default cursor-type 'box)
;; 去除默认启动界面
(setq inhibit-startup-message nil)
;; 设置英文字体
;; (set-face-attribute 'default nil :font "Fira Code Retina 13")
;; 高亮当前行
(global-hl-line-mode 1)

(set-face-attribute 'default nil :font "Sarasa Mono SC 16")
;; 设置中文字体
(set-fontset-font t 'han "Sarasa Mono SC 16")

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-solarized-light t))

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :hook
  ('dired-mode . 'all-the-icons-dired-mode))

(use-package emojify
  :hook 'after-init-hook #'global-emojify-mode
  :custom
  (emojify-emojis-dir "~/.emacs.d/var/emojis"))


(use-package page-break-lines
  :ensure t
  :config
  (turn-on-page-break-lines-mode))

(use-package dashboard
  :ensure t 
  :config (dashboard-setup-startup-hook) 
  (dashboard-modify-heading-icons '((recents . "file-text") 
                                    (bookmarks . "book")))
  ;; 设置标题
  (setq dashboard-banner-logo-title "欢迎您使用此Emacs配置文件，有任何问题可加QQ群:46689842                  ")
  ;; 设置banner
  (setq dashboard-startup-banner "~/.emacs.d/var/banner/a.png") 
  (setq dashboard-center-content t) 
  (setq dashboard-set-heading-icons t) 
  (setq dashboard-set-file-icons t) 
  (setq dashboard-set-navigator t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 10)
  (custom-set-faces
   '(mode-line ((t (:family "Sarasa Mono SC" :height 150))))
   '(mode-line-inactive ((t (:family "Sarasa Mono SC" :height 150))))))


(use-package posframe
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :config
  ;; 设置每一级括号的颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "gold")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "ivory1")

  (set-face-bold 'rainbow-delimiters-depth-1-face "t")
  (set-face-bold 'rainbow-delimiters-depth-2-face "t")
  (set-face-bold 'rainbow-delimiters-depth-3-face "t")
  (set-face-bold 'rainbow-delimiters-depth-4-face "t")
  (set-face-bold 'rainbow-delimiters-depth-5-face "t")
  (set-face-bold 'rainbow-delimiters-depth-6-face "t")
  (set-face-bold 'rainbow-delimiters-depth-7-face "t")
  (set-face-bold 'rainbow-delimiters-depth-8-face "t")
  (set-face-bold 'rainbow-delimiters-depth-9-face "t")
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package info-colors
  :ensure t
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

;; 为上层提供 init-ui 模块
(provide 'init-ui)
