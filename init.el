;;  _____                    _____
;; | ____|_   ____ _ _ __   | ____|_ __ ___   __ _  ___ ___
;; |  _| \ \ / / _` | '_ \  |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |___ \ V / (_| | | | | | |___| | | | | | (_| | (__\__ \
;; |_____| \_/ \__,_|_| |_| |_____|_| |_| |_|\__,_|\___|___/
;; AUTHOR	: EvanMeek
;; EMAIL	: the_lty_mail@foxmail.com

;; 性能测试
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 10000))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda () 
                             (setq gc-cons-threshold gc-cons-threshold-original) 
                             (setq file-name-handler-alist file-name-handler-alist-original) 
                             (makunbound 'gc-cons-threshold-original) 
                             (makunbound 'file-name-handler-alist-original)
                             ;; (message "gc-cons-threshold and file-name-handler-alist restored")
                             (message
                              ;; "自动优化完毕!\t如果要关闭这条消息可以在~/.emacs.d/init.el里注释掉."
							  "如果感到无聊就试试按下 M-\ 2 c 吧!")))

;; 递归遍历加载路径
(defun add-subdirs-to-load-path(dir) 
  "Recursive add directories to `load-path`."
  (let ((default-directory (file-name-as-directory dir))) 
    (add-to-list 'load-path dir) 
    (normal-top-level-add-subdirs-to-load-path)))

(let ((gc-cons-threshold most-positive-fixnum) 
      (file-name-handler-alist nil)) 
  (add-subdirs-to-load-path "~/.emacs.d/etc/"))

;; 图形界面插件的设置
(setq graphic-only-plugins-setting ())
;; 全屏
(toggle-frame-fullscreen)

(require 'init-config)
;; 透明效果
;; (when (graphic-p) 
;;   (+evan/toggle-transparency) 
;;   (+evan/toggle-transparency) 
;;   (message "透明以开启，想要关闭可以调用命令(+evan/toggle-transparency)"))

(if (graphic-p) 
    (message "检测到当前环境为图形环境，可以正常使用。")
  (message "检测到当前环境为字符环境，部分插件未启用。"))

;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


;; 下面的可以删掉
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "#ffffff"])
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(custom-safe-themes
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" default))
 '(delete-selection-mode nil)
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#cfdf30")
	 ("TODO" . "#feacd0")
	 ("NEXT" . "#b6a0ff")
	 ("THEM" . "#f78fe7")
	 ("PROG" . "#00d3d0")
	 ("OKAY" . "#4ae8fc")
	 ("DONT" . "#80d200")
	 ("FAIL" . "#ff8059")
	 ("BUG" . "#ff8059")
	 ("DONE" . "#44bc44")
	 ("NOTE" . "#f0ce43")
	 ("KLUDGE" . "#eecc00")
	 ("HACK" . "#eecc00")
	 ("TEMP" . "#ffcccc")
	 ("FIXME" . "#ff9977")
	 ("XXX+" . "#f4923b")
	 ("REVIEW" . "#6ae4b9")
	 ("DEPRECATED" . "#bfd9ff")))
 '(ibuffer-deletion-face 'modus-theme-mark-del)
 '(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
 '(ibuffer-marked-face 'modus-theme-mark-sel)
 '(ibuffer-title-face 'modus-theme-pseudo-header)
 '(package-selected-packages
   '(centaur-tabs centaur-tab pyim youdao-dictionary yasnippet-snippets writeroom-mode which-key web-mode vterm use-package undo-tree try treemacs-projectile treemacs-persp treemacs-magit telega symbol-overlay sudo-edit spacemacs-theme spaceline smartparens simple-httpd rotate rime rainbow-delimiters quickrun python-black perspeen pdf-tools page-break-lines org-bullets nyan-mode modus-vivendi-theme modus-operandi-theme modern-cpp-font-lock markdown-mode+ major-mode-hydra lua-mode lsp-ui lsp-pyright lsp-java live-py-mode lispy lab-themes js2-mode ivy-fuz info-colors indent-guide hungry-delete htmlize howdoyou grip-mode go-translate gkroam git-gutter-fringe geiser flycheck figlet emojify doom-themes dired-posframe counsel-projectile company-box command-log-mode circadian ccls bongo beacon amx all-the-icons-ivy-rich all-the-icons-dired))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#ff8059")
	 (40 . "#feacd0")
	 (60 . "#f78fe7")
	 (80 . "#f4923b")
	 (100 . "#eecc00")
	 (120 . "#cfdf30")
	 (140 . "#f8dec0")
	 (160 . "#bfebe0")
	 (180 . "#44bc44")
	 (200 . "#80d200")
	 (220 . "#6ae4b9")
	 (240 . "#4ae8fc")
	 (260 . "#00d3d0")
	 (280 . "#c6eaff")
	 (300 . "#2fafff")
	 (320 . "#79a8ff")
	 (340 . "#00bcff")
	 (360 . "#b6a0ff")))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
   ["#000000" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "#a8a8a8"])
 '(xterm-color-names-bright
   ["#181a20" "#f4923b" "#80d200" "#cfdf30" "#79a8ff" "#f78fe7" "#4ae8fc" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "magenta")))))
