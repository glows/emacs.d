(define-key global-map (kbd "C-c 0 e") #'+evan/temp-elisp-buf)
(define-key lisp-interaction-mode-map (kbd "C-i q") #'+evan/kill-temp-elisp-buf)

(provide '+mini-keybind)
