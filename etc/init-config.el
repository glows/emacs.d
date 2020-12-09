;;;;;;;;;;;;;
;; 基础模块 ;;
;;;;;;;;;;;;;
(require '+autoload)
(require '+config)
(require 'init-package)
(require 'init-variable)

;;;;;;;;;;;;;
;; keybind ;;
;;;;;;;;;;;;;
(require '+mini-keybind)
(require 'init-keybind)

;;;;;;;;;;;;;
;; 私有模块 ;;
;;;;;;;;;;;;;
(require 'private-module)
(require 'init-basic)

;;;;;;;;;;;;;
;; 用户界面 ;;
;;;;;;;;;;;;;
(require 'init-ui)

;;;;;;;;;;;;;
;; 实用工具 ;;
;;;;;;;;;;;;;
(require 'init-tools)

;;;;;;;;;;;;;
;; 代码补全 ;;
;;;;;;;;;;;;;
(require 'init-complete)
(require 'init-prog)

;;;;;;;;;;;;;
;; OrgMode ;;
;;;;;;;;;;;;;
(require 'init-org)

;;;;;;;;;;;;;
;; MrkDown ;;
;;;;;;;;;;;;;
(require 'init-markdown)

;;;;;;;;;;;;;
;; Dired!! ;;
;;;;;;;;;;;;;
(require 'init-dired)

;;;;;;;;;;;;;
;; VCTools ;;
;;;;;;;;;;;;;
(require 'init-version-control)

;;;;;;;;;;;;;
;; ivyCONF ;;
;;;;;;;;;;;;;
(require 'init-ivy)

;;;;;;;;;;;;;;
;; treemacs ;;
;;;;;;;;;;;;;;
(require 'init-treemacs)

;;;;;;;;;;;;;;
;; flycheck ;;
;;;;;;;;;;;;;;
(require 'init-flycheck)

;;;;;;;;;;;;;;
;; lsp-mode ;;
;;;;;;;;;;;;;;
(require 'init-lsp)

;;;;;;;;;;;;
;; Python ;;
;;;;;;;;;;;;
(require 'init-python)

;;;;;;;;;;
;; Java ;;
;;;;;;;;;;
(require 'init-java)

;;;;;;;;;;;
;; C/C++ ;;
;;;;;;;;;;;
(require 'init-cc)

;;;;;;;;;
;; Lua ;;
;;;;;;;;;
(require 'init-lua)

;;;;;;;;;;;
;; ELisp ;;
;;;;;;;;;;;
(require 'init-emacs-lisp)

;;;;;;;;;;;;
;; Scheme ;;
;;;;;;;;;;;;
(require 'init-scheme)

;;;;;;;;;;;;;;;;;
;; common-lisp ;;
;;;;;;;;;;;;;;;;;
(require 'init-common-lisp)

;;;;;;;;;;;;;
;; haskell ;;
;;;;;;;;;;;;;
(require 'init-haskell)

;;;;;;;;;;
;; pyim ;;
;;;;;;;;;;
;; (require 'init-pyim)

;;;;;;;;;;
;; Hack ;;
;;;;;;;;;;
(require 'init-graphic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Don't move/change/delete me! ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-config)
