;;  _____                    _____
;; | ____|_   ____ _ _ __   | ____|_ __ ___   __ _  ___ ___
;; |  _| \ \ / / _` | '_ \  |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |___ \ V / (_| | | | | | |___| | | | | | (_| | (__\__ \
;; |_____| \_/ \__,_|_| |_| |_____|_| |_| |_|\__,_|\___|___/
;; AUTHOR	: EvanMeek
;; EMAIL	: the_lty_mail@foxmail.com
;; 性能测试
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 10240 10000))
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(awesome-tray-mode-line-active-color "#0031a9")
 '(awesome-tray-mode-line-inactive-color "#d7d7d7")
 '(custom-enabled-themes '(lab-light))
 '(custom-safe-themes
   '("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "5036346b7b232c57f76e8fb72a9c0558174f87760113546d3a9838130f1cdb74" "6c9cbcdfd0e373dc30197c5059f79c25c07035ff5d0cc42aa045614d3919dab4" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "28c56a3c5e503137ddbd75c09550955bf9138839289c5daa535a5adba3b068dd" "5c6e56b16058ec861a3e7f7906cd98cce34ef7e1cbcfd8f8f681a25975f898a8" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "7b3ce93a17ce4fc6389bba8ecb9fee9a1e4e01027a5f3532cc47d160fe303d5a" "7e22a8dcf2adcd8b330eab2ed6023fa20ba3b17704d4b186fa9c53f1fab3d4d2" "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "eb3ef63dc31fbebb37df3646fbc1e07f25159d19bb1cade2a80000a2764690de" "5fc6e328660df71b62f43a3c0e0e3a8900e8656557a8a3fc45d70e31a82f5522" "f8351076cacdd8ffbe157aae64bdbbf8077ddb32d4548381630c3485e31464af" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "188fed85e53a774ae62e09ec95d58bb8f54932b3fd77223101d036e3564f9206" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "5afcf29b3d73c0959c772321f98735ccb99cca2cf054279202f7568a67828c6c" "13880fa28757754bc40c85b05689c801ddaa877f2fe65abf1779f37776281ef1" "74ba9ed7161a26bfe04580279b8cad163c00b802f54c574bfa5d924b99daa4b9" "32ecae1d95b8d684d99618ebc512e8e856dfaa1521a1124b3d97f004e6025c66" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "cba5ebfabc6456e4bbd68e0394d176161e1db063c6ca24c23b9828af0bdd7411" "37a4701758378c93159ad6c7aceb19fd6fb523e044efe47f2116bc7398ce20c9" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "11acc02297c40918f6e459f56bc372a00b8e3af218689b2db991fe92a358e7d6" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4bbc7ea775d8e99cd50d9ef82f25e2aa0a4903433733bf13e3a4bb2dc005a572" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" default))
 '(delete-selection-mode t)
 '(fci-rule-color "#6272a4")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(global-display-line-numbers-mode t)
 '(global-hl-line-mode t)
 '(highlight-tail-colors '(("#aecf90" . 0) ("#c0efff" . 20)))
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
 '(ibuffer-deletion-face 'modus-theme-mark-del)
 '(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
 '(ibuffer-marked-face 'modus-theme-mark-sel)
 '(ibuffer-title-face 'modus-theme-pseudo-header)
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(meow-global-mode t)
 '(nrepl-message-colors
   '("#00afef" "#778ca3" "#009c9f" "#778ca3" "#005cc5" "#fa1090" "#009c9f" "#778ca3"))
 '(objed-cursor-color "#ff5555")
 '(package-selected-packages
   '(lsp-ui hover lsp-dart dart-mode mini-modeline i3wm nodejs-repl window-jump winner-mode go-mode hackernews tldr shackle popwin shell-pop dante haskell-mode doom-modeline fira-code-mode helpful elisp-demos emmet-mode prettier-js scss-mode helm paredit highlight-indent-guides highlight-indentation-mode exec-path-from-shell flycheck-popup-tip flycheck-pos-tip flycheck-posframe sly-repl-ansi-color sly-macrostep sly disable-mouse hlinum nlinum youdao-dictionary yasnippet-snippets writeroom-mode which-key web-mode vterm use-package undo-tree try treemacs-projectile treemacs-persp treemacs-magit symbol-overlay sudo-edit spacemacs-theme spaceline smartparens simple-httpd rotate rime rainbow-delimiters quickrun python-black pyim perspeen pdf-tools page-break-lines org-bullets nyan-mode modus-vivendi-theme modus-operandi-theme modern-cpp-font-lock markdown-mode+ major-mode-hydra lua-mode lsp-pyright lsp-java live-py-mode lispy lab-themes js2-mode ivy-fuz info-colors indent-guide hungry-delete htmlize howdoyou grip-mode go-translate gkroam git-gutter-fringe geiser flycheck figlet emojify doom-themes dired-posframe counsel-projectile company-box command-log-mode circadian centaur-tabs ccls bongo beacon amx all-the-icons-ivy-rich all-the-icons-dired))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#a60000")
     (40 . "#721045")
     (60 . "#8f0075")
     (80 . "#972500")
     (100 . "#813e00")
     (120 . "#70480f")
     (140 . "#5d3026")
     (160 . "#184034")
     (180 . "#005e00")
     (200 . "#315b00")
     (220 . "#005a5f")
     (240 . "#30517f")
     (260 . "#00538b")
     (280 . "#093060")
     (300 . "#0031a9")
     (320 . "#2544bb")
     (340 . "#0000c0")
     (360 . "#5317ac")))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
   ["#000000" "#a60000" "#005e00" "#813e00" "#0031a9" "#721045" "#00538b" "#f0f0f0"])
 '(xterm-color-names-bright
   ["#505050" "#972500" "#315b00" "#70480f" "#2544bb" "#8f0075" "#30517f" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "magenta"))))
 '(flycheck-posframe-border-face ((t (:inherit default))))
 '(linum-highlight-face ((t (:inherit default :background nil :foreground nil))))
 '(perspeen-selected-face ((t (::background "#68217A")))))
(put 'dired-find-alternate-file 'disabled nil)
(put 'list-threads 'disabled nil)
