;;;###autoload
(defun graphic-p ()
  "判断当前环境是否为图形环境"
  (if (display-graphic-p)
	  t))

;; kde-blur模糊透明效果
;;;###autoload 
(defun +setup-blur-kde (&rest ignores)
  (shell-command "sh ~/.emacs.d/script/kde-blur.sh"))
(when (eq window-system 'x)
  (add-hook 'emacs-startup-hook #'+setup-blur-kde))

;; 切换透明
;;;###autoload
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
         '(80 . 80) '(100 . 100)))))
(provide '+autoload)

