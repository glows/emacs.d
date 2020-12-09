(define-key global-map (kbd "C-c 0 e") #'+evan/temp-elisp-buf)
(define-key lisp-interaction-mode-map (kbd "C-i q") #'+evan/kill-temp-elisp-buf)
(define-key global-map (kbd "C-S-p") #'+evan/previous-line-5)
(define-key global-map (kbd "C-S-n") #'+evan/next-line-5)
(define-key global-map (kbd "M-[") #'scroll-other-window)
(define-key global-map (kbd "M-]") #'scroll-other-window-down)

(provide '+mini-keybind)
