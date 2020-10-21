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
<<<<<<< HEAD
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" default))
 '(delete-selection-mode nil)
=======
   '("f762f5db7a0b881feb8e9e7fee6b6d733842177fdfaaf87d83bd1fe8b0d2d8fe" "cdc452894793048cfe6c31846fb0de9997f21f83aa3ffef4f0909fbb1284a62f" "39b0c917e910f32f43f7849d07b36a2578370a2d101988ea91292f9087f28470" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "5fc6e328660df71b62f43a3c0e0e3a8900e8656557a8a3fc45d70e31a82f5522" "f8351076cacdd8ffbe157aae64bdbbf8077ddb32d4548381630c3485e31464af" "5ca998ef441c2e513b97610926b3a26d2e2f4099dd83e0e3dcf9d8d843d498b5" "7ea491e912d419e6d4be9a339876293fff5c8d13f6e84e9f75388063b5f794d6" "58f68812adb97601734ba811f50669cb0b1d7a4301c20821524bee482079ebab" "de2a4aedfee6a8644cd74dc15de228eff96e9f9d081f56161c4fac6b8d2feb15" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default))
 '(default-input-method "rime")
 '(dir-treeview-default-icon "F15B")
 '(dir-treeview-expanded-dir-icon "F07C")
 '(dir-treeview-folded-dir-icon "F07B")
 '(dir-treeview-icon-margin-right " ")
 '(dir-treeview-special-icons
   '((dir-treeview-is-image-p . "F1C5")
	 (dir-treeview-is-audio-p . "F1C7")
	 (dir-treeview-is-video-p . "F1C8")
	 (dir-treeview-is-archive-p . "F1C6")
	 ("\\.pdf$" . "F1C1")
	 (file-executable-p . "F013")))
 '(doom-modeline-mode t)
 '(eaf-find-alternate-file-in-dired t t)
 '(eaf-proxy-host "127.0.0.1")
 '(eaf-proxy-port "1088")
 '(eaf-proxy-type "socks5")
 '(emojify-emojis-dir "~/.emacs.d/var/emojis")
 '(english-teacher-backend 'baidu t)
 '(english-teacher-show-result-function 'english-teacher-eldoc-show-result-function t)
 '(eww-search-prefix "https://google.com/search?q=" t)
 '(fci-rule-color "#6272a4")
>>>>>>> 565a0d96cd1d50c1a5e7a62efe14a86e77a55f25
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
<<<<<<< HEAD
   '(centaur-tabs centaur-tab pyim youdao-dictionary yasnippet-snippets writeroom-mode which-key web-mode vterm use-package undo-tree try treemacs-projectile treemacs-persp treemacs-magit telega symbol-overlay sudo-edit spacemacs-theme spaceline smartparens simple-httpd rotate rime rainbow-delimiters quickrun python-black perspeen pdf-tools page-break-lines org-bullets nyan-mode modus-vivendi-theme modus-operandi-theme modern-cpp-font-lock markdown-mode+ major-mode-hydra lua-mode lsp-ui lsp-pyright lsp-java live-py-mode lispy lab-themes js2-mode ivy-fuz info-colors indent-guide hungry-delete htmlize howdoyou grip-mode go-translate gkroam git-gutter-fringe geiser flycheck figlet emojify doom-themes dired-posframe counsel-projectile company-box command-log-mode circadian ccls bongo beacon amx all-the-icons-ivy-rich all-the-icons-dired))
 '(vc-annotate-background nil)
=======
   '(eradio epkg symbol-overlay jsonl ctrlf selectrum-prescient selectrum dir-treeview olivetti darkroom nlinum-mode nlinum git-gutter-fringe figlet gkroam spaceline-all-the-icons eshell-git-prompt peep-dired evil emms transwin memory-usage winner-mode ranger spacemacs-thems spacemacs-theme org-protocol org-protocal org-roam-server org-roam lab-themes lispy neotree valign\.el valign ivy-fuz better-scroll elpy go-translate command-log-mode hide-mode-line modues-vivendi-theme modus-operandi-theme modus-vivendi-theme dired-rainbow dired-posframe geiser lsp-pyright lua-mode paredit elisp-slime-nav rust-mode python-black vscdark-theme vscode-dark-plus-theme mu4e srcery-theme use-package-el-get emacsql-mysql grip-mode sdcv bing-dict writeroom-mode green-is-the-new-black-theme green-phosphor-theme green-screen-theme organic-green-theme lsp-mode modern-cpp-font-lock ccls simple-httpd ox-hugo indent-guide beacon markdown-mode+ markdown dashboard youdao-dictionary yasnippet-snippets yaml-mode xml-format xml+ which-key web-mode w3m vterm use-package-hydra undo-tree try treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toc-org telega sudo-edit snazzy-theme smartparens rotate rime rainbow-delimiters quickrun prettier-js perspeen pdf-tools page-break-lines ox-reveal org-bullets nyx-theme major-mode-hydra lsp-ui lsp-python-ms lsp-java live-py-mode linum-relative jsonrpc json-rpc-server json-rpc js2-mode ivy-posframe ivy-hydra info-colors iceberg-theme hungry-delete htmlize howdoyou hemera-theme google-translate general flycheck-posframe flycheck-pos-tip flycheck-popup-tip esup emojify emmet-mode elisp-format doom dired-icon dired-hacks-utils dash-docs dap-mode dakrone-light-theme counsel-projectile company-tabnine company-box circadian bongo benchmark-init auto-complete amx all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-dired ag))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(read-process-output-max 1048576 t)
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#282a36")
>>>>>>> 565a0d96cd1d50c1a5e7a62efe14a86e77a55f25
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
