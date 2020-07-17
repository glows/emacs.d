;; 加载主题
(load-file "~/.emacs.d/themes/oswald-theme.el")
;; 设置透明
;; (set-frame-parameter nil 'alpha '(85 .100))
;; 设置光标颜色
;; (set-cursor-color "green2")
;; 设置光标样式
(setq-default cursor-type 'box)
;; 去除默认启动界面
(setq inhibit-startup-message nil)
;; 设置英文字体
(push '(if (fontp (font-spec :name "Fira Code Nerd Font" 
					  :style "Retina"
					  ;; :name "Sarasa Mono SC"
					  :style "Regular"
					  )) 
    (set-face-attribute 'default nil 
                        :font (font-spec ;; :name "Sarasa Mono SC"
							   :name "Fira Code Nerd Font"							 
                               :style "Retina"
							   ;; :style "Regular"
                               :size 20)) 
	(message "无法找到Fira Code Nerd Font字体，你可以更换其他字体或安装它让这条消息消失.")) graphic-only-plugins-setting)

;; 高亮当前行
(global-hl-line-mode 1)

;; 切换buffer焦点时高亮动画
(use-package
  beacon
  :ensure t
  :hook (after-init . beacon-mode))

;; 主题包
(use-package 
  doom-themes 
  :ensure t
  :defer
  ;; :config (load-theme 'doom-dracula t))
  )
(use-package
  spacemacs-common
  :ensure spacemacs-theme
  :defer)

;; 自动切换主题
(use-package
  circadian
  :ensure t
  :config
  ;; 经纬度，可以在https://www.latlong.net/获取，默认是广州的
  (setq calendar-latitude 23.130280
	calendar-longitude 113.288879
	;; sunrise 白天用的主题 sunset 晚上用的主题
	circadian-themes '((:sunrise . doom-monokai-pro)
			   (:sunset . oswald)))
  (circadian-setup))

(push '(progn (use-package 
    all-the-icons 
    :ensure t) 
  (use-package 
    all-the-icons-dired 
    :ensure t 
    :hook ('dired-mode . 'all-the-icons-dired-mode)) 
  (use-package 
    emojify
    :after telega
    :custom (emojify-emojis-dir "~/.emacs.d/var/emojis")
    :config
    (global-emojify-mode)) 
  (use-package 
    posframe 
    :ensure t)) graphic-only-plugins-setting)

(use-package 
  page-break-lines 
  :ensure t 
  :config (turn-on-page-break-lines-mode))

(use-package 
  dashboard 
  :ensure t 
  :config (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text") 
                                    (bookmarks . "book")))
  ;; 设置标题
  (setq dashboard-banner-logo-title
        "欢迎您使用此Emacs配置文件，有任何问题可加QQ群:46689842                  ")
  ;; 设置banner
  (setq dashboard-startup-banner "~/.emacs.d/var/banner/a.png") 
  (setq dashboard-center-content t) 
  (setq dashboard-set-heading-icons t) 
  ;; (setq dashboard-set-file-icons t) 
  (setq dashboard-set-navigator t))


;; modeline样式
(use-package 
  doom-modeline 
  :ensure t 
  :init (doom-modeline-mode 1) 
  :config (setq doom-modeline-height 10)
  (push '(custom-set-faces '(mode-line ((t 
                                  (:family "Fira Code Nerd Font"
                                           :style "Retina"
                                           :height 125)))) 
                    '(mode-line-inactive ((t 
                                           (:family "Fira Code Nerd Font"
                                                    :style "Retina"
                                                    :height 125))))) graphic-only-plugins-setting))
;; 彩虹括号
(use-package 
  rainbow-delimiters 
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

(use-package 
  info-colors 
  :ensure t 
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

(use-package
  indent-guide
  :ensure t
  :hook (prog-mode . indent-guide-mode))

;; 为上层提供 init-ui 模块
(provide 'init-ui)
