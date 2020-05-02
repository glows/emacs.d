;; 初始化各种包
;; (package-initialize)

;; 递归遍历加载路径
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))
  (add-subdirs-to-load-path "~/.emacs.d/etc/"))

(defvar evan/gc-cons-threshold-up-limit (* 100 1024 1024))

(defvar evan/gc-cons-threshold-default (* 20 1024 1024))

(defun evan/inc-gc-cons-threshold! ()
  "Increase `gc-cons-threshold' to `cm/gc-cons-threshold-up-limit'."
  (setq gc-cons-threshold evan/gc-cons-threshold-up-limit))

(defun evan/reset-gc-cons-threshold! ()
  "Rest `gc-cons-threshold' to `cm/gc-cons-threshold-default'."
  (setq gc-cons-threshold evan/gc-cons-threshold-default))

;; 性能测试
;; (load-file "~/.emacs.d/site-lisp/benchmark-init/benchmark.el")

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
   (quote
    ("bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "0e8bac1e87493f6954faf5a62e1356ec9365bd5c33398af3e83cfdf662ad955f" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "7220c44ef252ec651491125f1d95ad555fdfdc88f872d3552766862d63454582" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" default)))
 '(default-input-method "rime")
 '(eaf-find-alternate-file-in-dired t t)
 '(eaf-proxy-host "127.0.0.1")
 '(eaf-proxy-port "1080")
 '(eaf-proxy-type "http")
 '(emojify-emojis-dir "~/.emacs.d/var/emojis" t)
 '(lsp-python-ms-executable
   "~/.emacs.d/var/python-language-server/output/bin/Release/linux-x64/publish/Microsoft.Python.LanguageServer")
 '(lsp-ui-doc-delay 1 t)
 '(package-selected-packages
   (quote
    (web-mode hungry-delete all-the-icons-ivy-rich ivy-rich yasnippet-snippets yasnippet perspeen google-translate smartparens insert-tranlsated-name benchmark-init youdao-dictionary yaml-mode xah-fly-keys which-key w3m vterm use-package try toc-org telega solarized-theme snazzy-theme rime rainbow-delimiters pdf-tools ox-reveal org-bullets lsp-ui lsp-python-ms jsonrpc json-rpc-server json-rpc js2-mode ivy-posframe htmlize general flycheck esup emojify elisp-format doom-themes doom-modeline dired-icon dashboard dash-docs dakrone-light-theme counsel company-tabnine company-lsp bongo auto-complete amx all-the-icons-ivy all-the-icons-dired ace-window)))
 '(which-key-popup-type (quote side-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "red"))))
 '(mode-line ((t (:family "Sarasa Mono SC" :height 150))))
 '(mode-line-inactive ((t (:family "Sarasa Mono SC" :height 150)))))
(put 'upcase-region 'disabled nil)
