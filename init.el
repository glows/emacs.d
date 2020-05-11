;; 性能测试
;; (load-file "~/.emacs.d/site-lisp/benchmark-init/benchmark.el")

(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)
(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold gc-cons-threshold-original)
   (setq file-name-handler-alist file-name-handler-alist-original)
   (makunbound 'gc-cons-threshold-original)
   (makunbound 'file-name-handler-alist-original)
   (message "gc-cons-threshold and file-name-handler-alist restored")))

;; 递归遍历加载路径
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))
  (add-subdirs-to-load-path "~/.emacs.d/etc/"))



(require 'init-config)

(+evan/toggle-transparency)
(+evan/toggle-transparency)



;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "285efd6352377e0e3b68c71ab12c43d2b72072f64d436584f9159a58c4ff545a" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "24132f7b6699c6e0118d742351b74141bac3c4388937e40db9207554eaae78c9" "f9cae16fd084c64bf0a9de797ef9caedc9ff4d463dd0288c30a3f89ecf36ca7e" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "361f5a2bc2a7d7387b442b2570b0ef35198442b38c2812bf3c70e1e091771d1a" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "6231254e74298a1cf8a5fee7ca64352943de4b495e615c449e9bb27e2ccae709" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "0e8bac1e87493f6954faf5a62e1356ec9365bd5c33398af3e83cfdf662ad955f" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "7220c44ef252ec651491125f1d95ad555fdfdc88f872d3552766862d63454582" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" default))
 '(default-input-method "rime")
 '(eaf-find-alternate-file-in-dired t t)
 '(emojify-emojis-dir "~/.emacs.d/var/emojis" t)
 '(global-hl-line-mode t)
 '(ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
 '(ivy-posframe-parameters '((left-fringe . 8) (right-fringe . 8)))
 '(lsp-python-ms-executable
   "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer")
 '(lsp-ui-doc-delay 1)
 '(org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
 '(package-selected-packages
   '(user-package-hydra use-package-hydra major-mode-hydra pretty-hydra ivy-hydra hydra quickrun live-py-mode ag howdoyou info-colors ivy company-box flycheck-pos-tip flycheck-popup-tip flycheck-posframe counsel-projectile linum-relative projectile undo-tree web-mode hungry-delete all-the-icons-ivy-rich ivy-rich yasnippet-snippets yasnippet perspeen google-translate smartparens insert-tranlsated-name benchmark-init youdao-dictionary yaml-mode xah-fly-keys which-key w3m vterm use-package try toc-org telega solarized-theme snazzy-theme rime rainbow-delimiters pdf-tools ox-reveal org-bullets lsp-ui lsp-python-ms jsonrpc json-rpc-server json-rpc js2-mode ivy-posframe htmlize general flycheck esup emojify elisp-format doom-themes doom-modeline dired-icon dashboard dash-docs dakrone-light-theme counsel company-tabnine company-lsp bongo auto-complete amx all-the-icons-ivy all-the-icons-dired ace-window))
 '(tooltip-mode nil)
 '(which-key-popup-type 'side-window))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "red"))))
 '(flycheck-posframe-border-face ((t (:inherit default))))
 '(mode-line ((t (:family "Sarasa Mono SC" :height 150))))
 '(mode-line-inactive ((t (:family "Sarasa Mono SC" :height 150)))))
(put 'upcase-region 'disabled nil)
