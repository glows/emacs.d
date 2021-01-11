;;;===========================================
;;;					模块介绍
;;; 用户交互界面模块
;;;===========================================

;; MODULE: USER INTERFACE

;; AUTHOR: EvanMeek the_lty_mail@foxmail.com

;;; Code:

;; 设置光标颜色
;; (set-cursor-color "green2")
;; 设置光标样式
(setq-default cursor-type 'box)
;; 去除默认启动界面
(setq inhibit-startup-message t)
;; 设置英文/英文字体
(push '(progn
         (if (fontp (font-spec
			         :name evan/en-font-name
			         :style evan/en-font-style
			         :size evan/en-font-size))
	         (progn
	           (set-face-attribute 'default nil
						           :font (font-spec
								          :name evan/en-font-name
								          :style evan/en-font-style
								          :size evan/en-font-size))
               (set-fontset-font t 'han (font-spec
                                         :name evan/zh-font-name
                                         :style evan/zh-font-style
                                         :size evan/zh-font-size))
	           (set-fontset-font t ?中 (font-spec
							            :name evan/zh-font-name
							            :style evan/zh-font-style
							            :size evan/zh-font-size))
               (set-fontset-font "fontset-default" ?༼ (font-spec
                                                       :name "Noto Serif Tibetan"
                                                       :size 0)))
           (message "无法找到%s字体，你可以更换其他字体或安装它让这条消息消失." evan/en-font-name)))
      graphic-only-plugins-setting) 

;; 高亮当前行
(global-hl-line-mode 1)

;; 切换buffer焦点时高亮动画
(use-package beacon
  :disabled
  :ensure t
  :hook (after-init . beacon-mode))

;; 主题包									
(use-package
  doom-themes
  :ensure t)

(use-package modus-operandi-theme
  :ensure t)

(use-package modus-vivendi-theme
  :ensure t )

(use-package lab-themes
  :ensure t)

;; 自动切换主题
(use-package
  circadian
  :ensure t
  :hook (after-init . (lambda () (circadian-setup)))
  :config
  ;; 经纬度，可以在https://www.latlong.net/获取，默认是广州的
  (setq calendar-latitude 23.130280
		calendar-longitude 113.288879)
  ;; sunrise 白天用的主题 sunset 晚上用的主题
  ;; (setq circadian-themes '((:sunrise . modus-operandi)
  ;;                          (:sunset . modus-vivendi)))

  
  (circadian-setup)
  ;; 解决切换主题spaceline色块显示问题
  (add-hook 'circadian-after-load-theme-hook
			#'(lambda (theme)
				;; (spaceline-emacs-theme)
				(when (and
					   (> (car (circadian-now-time)) (car (circadian-sunrise)))
					   (< (car (circadian-now-time)) (car (circadian-sunset))))
				  (progn
					(eaf-setq eaf-pdf-dark-mode "false")
					(eaf-setq eaf-browser-dark-mode "false") 
					(eaf-setq eaf-mindmap-dark-mode "false")))
                (centaur-tabs-mode -1)
                (centaur-tabs-mode +1))))
(progn
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
	:ensure t
	:custom (emojify-emojis-dir "~/.emacs.d/var/emojis")
	:config
    (add-hook 'telega-root-mode-hook (lambda ()
                                       (emojify-mode +1))))
  ;; 浮动窗口支持
  (use-package
	posframe
	:defer 0
	:ensure t
	:custom
	(posframe-mouse-banish nil)))

;; 竖线
(use-package
  page-break-lines
  :ensure t
  :hook (after-init . page-break-lines-mode))

;; 让info帮助信息中关键字有高亮
(use-package 
  info-colors 
  :ensure t 
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

;; 缩进线-不再使用
(use-package
  indent-guide
  :disabled
  :hook ((prog-mode . indent-guide-mode)
		 (python-mode . (lambda () (indent-guide-mode -1)))))
;; 缩进线
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'bitmap))

;; 彩虹猫进度条
(use-package nyan-mode
  :ensure t
  :hook (after-init . nyan-mode)
  :config
  (setq nyan-wavy-trail t
		nyan-animate-nyancat t))

;; 对齐表格
(use-package valign
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
  :disabled
  :config
  (setq tab-bar-tab-name-truncated-max 8))

(use-package awesome-tab
  :disabled
  :load-path "~/.emacs.d/site-lisp/awesome-tab"
  :hook (after-init . awesome-tab-mode)
  :bind
  (("C-c h" . awesome-tab-backward-tab)
   ("C-c l" . awesome-tab-forward-tab)
   ("C-c H" . awesome-tab-backward-tab-other-window)
   ("C-c L" . awesome-tab-forward-tab-other-window)
   ("C-c b" . awesome-tab-switch-group)
   ("C-c g" . awesome-tab-ace-jump))
  :config
  (defun awesome-tab-hide-tab (x)
    (let ((name (format "%s" x)))
      (or
       (string-prefix-p "*epc" name)
       (string-prefix-p "*helm" name)
       (string-prefix-p "*Compile-Log*" name)
       (string-prefix-p "*lsp" name)
       (string-prefix-p "flycheck" name)
       (string-prefix-p "*LSP" name)
       (string-prefix-p "*Youdao" name)
       (string-prefix-p " *company-box" name)
       (string-prefix-p "*company-box" name)
       (string-prefix-p " *Go-Tran" name)
       (string-prefix-p "*hydra-posframe" name)
       (string-prefix-p "*which-key*" name)
       (and (string-prefix-p "magit" name)
            (not (file-name-extension name)))
       )))
  (defun awesome-tab-buffer-groups ()
    "`awesome-tab-buffer-groups' control buffers' group rules.

Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `awesome-tab-get-group-name' with project name."
    (list
     (cond
      ((or (string-equal "*" (substring (buffer-name) 0 1))
           (memq major-mode '(magit-process-mode
                              magit-status-mode
                              magit-diff-mode
                              magit-log-mode
                              magit-file-mode
                              magit-blob-mode
                              magit-blame-mode
                              )))
       "Emacs")
      ((derived-mode-p 'eshell-mode)
       "EShell")
      ((or (derived-mode-p 'emacs-lisp-mode)
           (string= "*TEMP-ELISP*" (buffer-name)))
       "Elisp")
      ((derived-mode-p 'dired-mode)
       "Dired")
      ((memq major-mode '(org-mode org-agenda-mode diary-mode))
       "OrgMode")
      ((derived-mode-p 'eaf-mode)
       "EAF")
      ((or (derived-mode-p 'telega-chat-mode)
           (derived-mode-p 'telega-root-mode))
       "Telega")
      (t
       (awesome-tab-get-group-name (current-buffer)))))))

;; 为上层提供 init-ui 模块
(provide 'init-ui)
