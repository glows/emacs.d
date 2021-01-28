;;; -*- lexical-binding: t -*-
;;  _____                    _____
;; | ____|_   ____ _ _ __   | ____|_ __ ___   __ _  ___ ___
;; |  _| \ \ / / _` | '_ \  |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |___ \ V / (_| | | | | | |___| | | | | | (_| | (__\__ \
;; |_____| \_/ \__,_|_| |_| |_____|_| |_| |_|\__,_|\___|___/
;; AUTHOR	: EvanMeek
;; EMAIL	: the_lty_mail@foxmail.com
(defvar +dumped-load-path nil
  "Not nil when using dump.")
;; 加载dump的配置
(when +dumped-load-path
  ;;恢复load-path
  (setq load-path +dumped-load-path)
  (setq warning-minimum-level :emergency)
  (setq user-emacs-directory "~/.emacs.d/var/")
  (global-font-lock-mode t)
  (transient-mark-mode t))

;; 没有dump加载的配置
(unless +dumped-load-path
  (setq gc-cons-threshold-original gc-cons-threshold)
  (setq gc-cons-threshold (* 10240 1000000))
  (setq file-name-handler-alist-original file-name-handler-alist)
  (setq file-name-handler-alist nil)

  (run-with-idle-timer 5 nil (lambda ()
                               (setq file-name-handler-alist file-name-handler-alist-original)
                               (makunbound 'gc-cons-threshold-original)
                               (makunbound 'file-name-handler-alist-original)
                               (message
                                "如果感到无聊就摘下耳机，然后试试按下 M-\\ 2 c 吧!")))
  (add-hook 'after-init-hook (lambda ()
                               (setq gc-cons-threshold (* 80000 100))
                               (message
                                "如果感到无聊就摘下耳机，然后试试按下 M-\\ 2 c 吧!")))

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
  ;; (toggle-frame-fullscreen)

  (require 'init-config)

  ;; (if (graphic-p)
  ;;     (message "检测到当前环境为图形环境，可以正常使用。")
  ;;   (message "检测到当前环境为字符环境，部分插件未启用。"))

  ;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
  (put 'dired-find-alternate-file 'disabled nil))
