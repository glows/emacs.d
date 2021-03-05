;;;###autoload
(defun graphic-p ()
  "判断当前环境是否为图形环境"
  (if (display-graphic-p)
	  t))

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
         '(90 . 90) '(100 . 100)))))
;; 增加或减少透明
;;;###autoload
(defun sanityinc/adjust-opacity (frame incr)
  "Adjust the background opacity of FRAME by increment INCR."
  (unless (display-graphic-p frame)
    (error "Cannot adjust opacity of this frame"))
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         ;; The 'alpha frame param became a pair at some point in
         ;; emacs 24.x, e.g. (100 100)
         (oldalpha (if (listp oldalpha) (car oldalpha) oldalpha))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))

(defun bongo-buffer-live-p ()
  "判断是否存在bongo buffer。"
  (if (or (get-buffer "*Bongo Playlist*") (get-buffer "*Bongo Library*"))
    t
    nil))

;;;###autoload
(defun bongo-init-all ()
  "自动初始化bongo音乐列表"
  (interactive) 
  (let ((buffer (current-buffer)))
    (when (bongo-buffer-live-p)
      (bongo-stop))
    (bongo)
    (setq bongo-insert-whole-directory-trees "ask") 
    (bongo-insert-file "~/Music") 
    (bongo-insert-enqueue-region (point-min) 
                                 (point-max)) 
    (bongo-play-random) 
    (switch-to-buffer buffer)))

;;;###autoload
(defun bongo-init-by-path (path)
  "根据路径初始化bongo"
  (let ((buffer (current-buffer)))
    (when (bongo-buffer-live-p)
      (bongo-stop))
    (bongo)
    (setq bongo-insert-whole-directory-trees "ask") 
    (bongo-insert-file path) 
    (bongo-insert-enqueue-region (point-min) 
                                 (point-max)) 
    (bongo-play-random) 
    (switch-to-buffer buffer)))
(provide '+autoload)

