;;  _____                    _____
;; | ____|_   ____ _ _ __   | ____|_ __ ___   __ _  ___ ___
;; |  _| \ \ / / _` | '_ \  |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |___ \ V / (_| | | | | | |___| | | | | | (_| | (__\__ \
;; |_____| \_/ \__,_|_| |_| |_____|_| |_| |_|\__,_|\___|___/
;; AUTHOR	: EvanMeek
;; EMAIL	: the_lty_mail@foxmail.com

;; 性能测试
;; (load-file "~/.emacs.d/site-lisp/benchmark-init/benchmark.el")
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
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

(require 'init-config)
;; 透明效果
;; (when (graphic-p) 
;;   (+evan/toggle-transparency) 
;;   (+evan/toggle-transparency) 
;;   (message "透明以开启，想要关闭可以调用命令(+evan/toggle-transparency)"))

;; 全屏
(toggle-frame-fullscreen)

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
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-color-names-vector
   ["#090300" "#db2d20" "#01a252" "#fded02" "#01a0e4" "#a16a94" "#01a0e4" "#a5a2a2"])
 '(ansi-term-color-vector
   [unspecified "#ffffff" "#cc342b" "#198844" "#fba922" "#3971ed" "#a36ac7" "#3971ed" "#373b41"] t)
 '(awesome-tray-mode-line-active-color "#29aeff")
 '(awesome-tray-mode-line-inactive-color "#2f2f2f")
 '(bongo-mode-line-icon-color "")
 '(bongo-mode-line-icon-size 10 t)
 '(browse-url-browser-function 'eaf-open-browser)
 '(ccls-enable-skipped-ranges nil t)
 '(ccls-executable "/usr/bin/ccls" t)
 '(ccls-sem-highlight-method 'font-lock t)
 '(custom-safe-themes
   '("58f68812adb97601734ba811f50669cb0b1d7a4301c20821524bee482079ebab" "de2a4aedfee6a8644cd74dc15de228eff96e9f9d081f56161c4fac6b8d2feb15" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default))
 '(default-input-method "rime")
 '(doom-modeline-mode t)
 '(eaf-find-alternate-file-in-dired t t)
 '(eaf-proxy-host "127.0.0.1")
 '(eaf-proxy-port "1088")
 '(eaf-proxy-type "socks5")
 '(emojify-emojis-dir "~/.emacs.d/var/emojis" t)
 '(english-teacher-backend 'baidu t)
 '(english-teacher-show-result-function 'english-teacher-eldoc-show-result-function t)
 '(eww-search-prefix "https://google.com/search?q=")
 '(fci-rule-color "#6272a4")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(highlight-symbol-colors
   '("#FFF68F" "#ADFF2F" "#83DDFF" "#AB82FF" "#66CDAA" "#FF8C00" "#FF6EB4" "#809FFF" "#9AFF9A"))
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#4f97d7")
	 ("OKAY" . "#4f97d7")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#86dc2f")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f")))
 '(ibuffer-deletion-face 'modus-theme-mark-del)
 '(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
 '(ibuffer-marked-face 'modus-theme-mark-sel)
 '(ibuffer-title-face 'modus-theme-header)
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(lsp-auto-guess-root nil)
 '(lsp-eldoc-hook nil)
 '(lsp-file-watch-threshold 2000)
 '(lsp-idle-delay 0)
 '(lsp-prefer-flymake nil t)
 '(lsp-python-ms-executable
   "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer")
 '(lsp-ui-doc-delay 1 t)
 '(nrepl-message-colors
   '("#00afef" "#778ca3" "#009c9f" "#778ca3" "#005cc5" "#fa1090" "#009c9f" "#778ca3"))
 '(objed-cursor-color "#ff5555")
 '(org-agenda-files
   '("~/Documents/org/capture/task.org" "~/Documents/org/HappyEveryDay.org"))
 '(org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
 '(org-src-block-faces
   '(("emacs-lisp"
	  (:background "#2f2b33"))
	 ("dot"
	  (:foreground "gray50"))))
 '(org-todo-keyword-faces
   '(("[学习]" :foreground "white" :background "#2ECC71" :weight bold)
	 ("[待办]" :foreground "white" :background "#F1C40F" :weight bold)
	 ("[等待]" :foreground "white" :background "#3498DB" :weight bold)
	 ("[完成]" :foreground "white" :background "#566573 " :weight bold)
	 ("[取消]" :foreground "white" :background "#566573" :weight bold)
	 ("[BUG]" :foreground "white" :background "#E74C3C" :weight bold)
	 ("[新事件]" :foreground "white" :background "#D35400" :weight bold)
	 ("[已知问题]" :foreground "white" :background "#17A589" :weight bold)
	 ("[修改中]" :foreground "white" :background "#BB8FCE" :weight bold)
	 ("[已修复]" :foreground "white" :background "#566573" :weight bold)))
 '(org-todo-keywords
   '((sequence "[学习](s!/@)" "[待办](t!/@)" "[等待](w!))" "|" "[完成](d!/@)" "[取消](c!@)")
	 (sequence "[BUG](b!/@)" "[新事件](i@)" "[已知问题](k!/@)" "[修改中](W!/@)" "|" "[已修复](f!)")))
 '(package-selected-packages
   '(nlinum-mode nlinum git-gutter-fringe figlet gkroam spaceline-all-the-icons eshell-git-prompt peep-dired evil emms transwin memory-usage winner-mode ranger spacemacs-thems spacemacs-theme org-protocol org-protocal org-roam-server org-roam lab-themes lispy neotree valign\.el valign ivy-fuz better-scroll elpy go-translate command-log-mode hide-mode-line modues-vivendi-theme modus-operandi-theme modus-vivendi-theme dired-rainbow dired-posframe geiser lsp-pyright lua-mode paredit elisp-slime-nav rust-mode python-black vscdark-theme vscode-dark-plus-theme mu4e srcery-theme use-package-el-get emacsql-mysql grip-mode sdcv bing-dict writeroom-mode green-is-the-new-black-theme green-phosphor-theme green-screen-theme organic-green-theme lsp-mode modern-cpp-font-lock ccls simple-httpd ox-hugo indent-guide beacon markdown-mode+ markdown dashboard youdao-dictionary yasnippet-snippets yaml-mode xml-format xml+ which-key web-mode w3m vterm use-package-hydra undo-tree try treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toc-org telega sudo-edit snazzy-theme smartparens rotate rime rainbow-delimiters quickrun prettier-js perspeen pdf-tools page-break-lines ox-reveal org-bullets nyx-theme major-mode-hydra lsp-ui lsp-python-ms lsp-java live-py-mode linum-relative jsonrpc json-rpc-server json-rpc js2-mode ivy-posframe ivy-hydra info-colors iceberg-theme hungry-delete htmlize howdoyou hemera-theme google-translate general flycheck-posframe flycheck-pos-tip flycheck-popup-tip esup emojify emmet-mode elisp-format doom dired-icon dired-hacks-utils dash-docs dap-mode dakrone-light-theme counsel-projectile company-tabnine company-box circadian bongo benchmark-init auto-complete amx all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-dired ag))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(read-process-output-max 1048576 t)
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#282a36")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (list
	(cons 20 "#50fa7b")
	(cons 40 "#85fa80")
	(cons 60 "#bbf986")
	(cons 80 "#f1fa8c")
	(cons 100 "#f5e381")
	(cons 120 "#face76")
	(cons 140 "#ffb86c")
	(cons 160 "#ffa38a")
	(cons 180 "#ff8ea8")
	(cons 200 "#ff79c6")
	(cons 220 "#ff6da0")
	(cons 240 "#ff617a")
	(cons 260 "#ff5555")
	(cons 280 "#d45558")
	(cons 300 "#aa565a")
	(cons 320 "#80565d")
	(cons 340 "#6272a4")
	(cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types '((use-package)))
 '(which-key-popup-type 'side-window)
 '(winner-mode t)
 '(xterm-color-names
   ["#000000" "#ff8059" "#44bc44" "#eecc00" "#29aeff" "#feacd0" "#00d3d0" "#a8a8a8"])
 '(xterm-color-names-bright
   ["#181a20" "#f4923b" "#80d200" "#cfdf30" "#72a4ff" "#f78fe7" "#4ae8fc" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "magenta"))))
 '(flycheck-posframe-border-face ((t (:inherit default))))
 '(magit-diff-file-heading-highlight ((t (:inherit nil :extend t))))
 '(mode-line ((t (:family evan/font-name :style evan/font-style :height 125))))
 '(mode-line-inactive ((t (:family evan/font-name :style evan/font-size :height 125))))
 '(perspeen-selected-face ((t (:background "violet" :foreground "Black" :weight bold)))))
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
