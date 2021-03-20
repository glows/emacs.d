(unless +dumped-load-path
  (require 'package)
  (package-initialize))
(setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
                         ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.cloud.tencent.com/elpa/melpa-stable/")
                         ("org" . "http://mirrors.cloud.tencent.com/elpa/org/")))
;; 安装use-package包管理器
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 安装quelpa包管理器（用于安装github上的插件）
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade))
  (quelpa
   '(quelpa-use-package
     :fetcher git
     :url "https://github.com/quelpa/quelpa-use-package.git")))
(require 'quelpa-use-package)

(setq quelpa-upgrade-interval 7
      quelpa-update-melpa-p nil)

(provide 'init-package)
 
