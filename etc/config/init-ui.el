;;;===========================================
;;;					模块介绍
;;; 用户交互界面模块
;;;===========================================

;; MODULE: USER INTERFACE

;; AUTHOR: EvanMeek the_lty_mail@foxmail.com

;;; Code:

(setq evan/font-name "Sarasa Mono Slab SC Semibold"
	  evan/font-style "Regular"
	  evan/font-size 20)

;; 设置光标颜色
;; (set-cursor-color "green2")
;; 设置光标样式
(setq-default cursor-type 'box)
;; 去除默认启动界面
(setq inhibit-startup-message t)
;; 设置英文字体
(push '(if (fontp (font-spec
				   ;; :name "Fira Code Nerd Font"
				   ;; :style "Retina"
				   :name evan/font-name
				   :style evan/font-style
				   ;; :name "Sarasa Mono SC"
				   ;; :style "Regular"
				   :size evan/font-size))
		   (progn
			 (set-face-attribute 'default nil
								 :font (font-spec
										:name evan/font-name
										:style evan/font-style
										:size evan/font-size))
			 (set-fontset-font t ?中 (font-spec
										:name evan/font-name
										:style evan/font-style
										:size evan/font-size)))
		   
		 (message "无法找到%s字体，你可以更换其他字体或安装它让这条消息消失." evan/font-name)) graphic-only-plugins-setting)


;; 高亮当前行
(global-hl-line-mode 1)

;; 切换buffer焦点时高亮动画
(use-package beacon
  :ensure t
  :hook (after-init . beacon-mode))



;; 主题包									
(use-package
  doom-themes
  :ensure t)
(use-package
  spacemacs-common
  :ensure spacemacs-theme)

;; (use-package base16-theme
;;   :ensure t
;;   :defer)

(use-package modus-operandi-theme
  :defer 0
  :ensure t
  )
 ;; (load-file "~/.emacs.d/themes/solo-jazz-theme.el")

(use-package modus-vivendi-theme
    :defer 0
	:ensure t )


;; 自动切换主题
(use-package
  circadian
  :defer 0
  :ensure t
  :config
  ;; 经纬度，可以在https://www.latlong.net/获取，默认是广州的
  (setq calendar-latitude 23.130280
		calendar-longitude 113.288879)
  ;; sunrise 白天用的主题 sunset 晚上用的主题
  (setq circadian-themes '((:sunrise . modus-operandi)
						   (:sunset . modus-vivendi)))
  (circadian-setup)
  ;; 解决切换主题spaceline色块显示问题
  (add-hook 'circadian-after-load-theme-hook
			#'(lambda (theme)
				(spaceline-emacs-theme))))


;; 根据时间切换高亮当前行颜色
;; (if (and (> (car (circadian-now-time)) (car (circadian-sunrise)))
;; 		 (< (car (circadian-now-time)) (car (circadian-sunset))))
;; 	(set-face-background 'hl-line "light gray")
;;   (set-face-background 'hl-line "gray17"))

(push '(progn
		 ;; 图标支持
		 (use-package
		   all-the-icons
		   :defer 0
		   :ensure t)
		 ;; dired模式图标支持
		 (use-package
		   all-the-icons-dired
		   :defer 0
		   :ensure t
		   :hook ('dired-mode . 'all-the-icons-dired-mode))
		 ;; 表情符号
		 (use-package
		   emojify
		   :defer 0
		   :ensure t
		   :custom (emojify-emojis-dir "~/.emacs.d/var/emojis")
		   :hook telega-mode)
		 ;; 浮动窗口支持
		 (use-package
		   posframe
		   :defer 0
		   :ensure t
		   :custom
		   (posframe-mouse-banish nil))) graphic-only-plugins-setting)

;; 竖线
(use-package
  page-break-lines
  :ensure t
  :hook (after-init . page-break-lines-mode)
  :config (turn-on-page-break-lines-mode))

;; 启动界面
(use-package
  dashboard
  :disabled
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text") 
                                    (bookmarks . "book")))
  ;; 设置标题
  (setq dashboard-banner-logo-title
        "欢迎您使用此Emacs配置文件，有任何问题可加QQ群:46689842                  ")
  ;; 设置banner
  (setq dashboard-startup-banner "~/.emacs.d/var/banner/evan-emacs-banner.png")
  (setq dashboard-center-content t) 
  (setq dashboard-set-heading-icons t) 
  ;; (setq dashboard-set-file-icons t) 
  (setq dashboard-set-navigator t))


;; modeline样式
(use-package 
  doom-modeline
  :disabled
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 10)
  (doom-modeline-bar-width 3)
  (doom-modeline-buffer-file-name-style 'file-name)
  :config
  (custom-set-faces '(mode-line ((t 
                                  (:family evan/font-name
                                           :style evan/font-style
                                           :height 125)))) 
                    '(mode-line-inactive ((t 
                                           (:family evan/font-name
                                                    :style evan/font-size
                                                    :height 125))))))

(use-package spaceline
  :defer 0
  :ensure t
  :config
  (spaceline-emacs-theme))

;; 彩虹括号
(use-package 
  rainbow-delimiters 
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  ;; 设置每一级括号的颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "chartreuse3") 
  (set-face-foreground 'rainbow-delimiters-depth-2-face "DodgerBlue1") 
  (set-face-foreground 'rainbow-delimiters-depth-3-face "DarkOrange2")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "deep pink") 
  (set-face-foreground 'rainbow-delimiters-depth-5-face "medium orchid") 
  (set-face-foreground 'rainbow-delimiters-depth-6-face "turquoise") 
  (set-face-foreground 'rainbow-delimiters-depth-7-face "lime green") 
  (set-face-foreground 'rainbow-delimiters-depth-8-face "gold") 
  (set-face-foreground 'rainbow-delimiters-depth-9-face "cyan") 
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
;; 让info帮助信息中关键字有高亮
(use-package 
  info-colors 
  :ensure t 
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

;; 缩进线
(use-package
  indent-guide
  :ensure t
  :hook (prog-mode . indent-guide-mode))

;; 彩虹猫进度条
(use-package nyan-mode
  :defer 1
  :ensure t
  :hook (after-init . nyan-mode)
  :config
  (setq nyan-wavy-trail t
		nyan-animate-nyancat nil))

;; 对齐表格
(use-package valign
  :disabled
  :load-path "~/.emacs.d/site-lisp/valign"
  :hook ((org-mode markdown-mode) . valign-mode)
  :config
  (setq valign-fancy-bar nil))

;; 懒猫的超简洁modeline
(use-package awesome-tray
  :disabled
  :load-path "~/.emacs.d/site-lisp/awesome-tray"
  :hook (after-init . awesome-tray-mode))

;; tab-bar
(use-package tab-bar
  :defer 2
  :config
  (setq tab-bar-tab-name-truncated-max 8))
;; 为上层提供 init-ui 模块
(provide 'init-ui)
