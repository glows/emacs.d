;;  _____                    _____
;; | ____|_   ____ _ _ __   | ____|_ __ ___   __ _  ___ ___
;; |  _| \ \ / / _` | '_ \  |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |___ \ V / (_| | | | | | |___| | | | | | (_| | (__\__ \
;; |_____| \_/ \__,_|_| |_| |_____|_| |_| |_|\__,_|\___|___/
;; AUTHOR	: EvanMeek
;; EMAIL	: the_lty_mail@foxmail.com

;; 性能测试
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda () 
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(custom-safe-themes
   '("99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" default))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#3a81c3")
	 ("OKAY" . "#3a81c3")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#42ae2c")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(hlinum nlinum youdao-dictionary yasnippet-snippets writeroom-mode which-key web-mode vterm use-package undo-tree try treemacs-projectile treemacs-persp treemacs-magit telega symbol-overlay sudo-edit spacemacs-theme spaceline smartparens simple-httpd rotate rime rainbow-delimiters quickrun python-black pyim perspeen pdf-tools page-break-lines org-bullets nyan-mode modus-vivendi-theme modus-operandi-theme modern-cpp-font-lock markdown-mode+ major-mode-hydra lua-mode lsp-ui lsp-pyright lsp-java live-py-mode lispy lab-themes js2-mode ivy-fuz info-colors indent-guide hungry-delete htmlize howdoyou grip-mode go-translate gkroam git-gutter-fringe geiser flycheck figlet emojify doom-themes dired-posframe counsel-projectile company-box command-log-mode circadian centaur-tabs ccls bongo beacon amx all-the-icons-ivy-rich all-the-icons-dired))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "magenta"))))
 '(linum-highlight-face ((t (:inherit default :background nil :foreground nil)))))
