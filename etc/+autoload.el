;;;###autoload
(defun graphic-p ()
  "判断当前环境是否为图形环境"
  ;; (getenv "DISPLAY")
  (display-graphic-p))

;; 切换透明
(defun +evan/toggle-transparency ()
        (interactive)
        (let ((alpha (frame-parameter nil 'alpha)))
          (set-frame-parameter
           nil 'alpha
           (if (eql (cond ((numberp alpha) alpha)
                          ((numberp (cdr alpha)) (cdr alpha))
                          ;; Also handle undocumented (<active> <inactive>) form.
                          ((numberp (cadr alpha)) (cadr alpha)))
                    100)
               '(85 . 85) '(100 . 100)))))

(provide '+autoload)

