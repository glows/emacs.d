(require 'package)

(package-initialize) ;; You might already have this line

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (use-package straight
;;   :load-path "~/.emacs.d/site-lisp/straight.el")

(provide 'init-package)
 
