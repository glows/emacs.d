(defun window-move (way) 
  "移动窗口.(Move window.)
WAY是方向，可选值为p,n,f,b，分别对应上下左右
(WAY is the direction, the optional values are p, n, f, b, which correspond to the up, down, left and right)" 
  (interactive "s方向(p-n-f-b): ") 
  (let ((old-window-buffer (window-buffer)) 
        (old-window (get-buffer-window))) 
    (pcase way ("p" (windmove-up)) 
           ("n" (windmove-down)) 
           ("f" (windmove-right)) 
           ("b" (windmove-left))) 
    (setq new-window-buffer (get-buffer-window)) 
    (if (not (eql old-window-buffer new-window-buffer)) 
        (progn (set-window-buffer old-window (window-buffer)) 
               (set-window-buffer (get-buffer-window) old-window-buffer)))))

(defun window-move-right() 
  (interactive) 
  (let ((old-window-buffer (window-buffer)) 
        (old-window (get-buffer-window))) 
    (if (windmove-right) 
        (progn (set-window-buffer old-window (window-buffer)) 
               (set-window-buffer (get-buffer-window) old-window-buffer)))))

(defun window-move-left() 
  (interactive) 
  (let ((old-window-buffer (window-buffer)) 
        (old-window (get-buffer-window))) 
    (if (windmove-left) 
        (progn (set-window-buffer old-window (window-buffer)) 
               (set-window-buffer (get-buffer-window) old-window-buffer)))))

(defun window-move-up() 
  (interactive) 
  (let ((old-window-buffer (window-buffer)) 
        (old-window (get-buffer-window))) 
    (if (windmove-up) 
        (progn (set-window-buffer old-window (window-buffer)) 
               (set-window-buffer (get-buffer-window) old-window-buffer)))))

(defun window-move-down() 
  (interactive) 
  (let ((old-window-buffer (window-buffer)) 
        (old-window (get-buffer-window))) 
    (if (windmove-down) 
        (progn (set-window-buffer old-window (window-buffer)) 
               (set-window-buffer (get-buffer-window) old-window-buffer)))))


;; 打开emacs配置文件夹
(defun open-init-dired () 
  (interactive) 
  (dired "~/.emacs.d/"))



(push '(defun open-with-chrome () 
		 (interactive) 
		 (browse-url-chrome (buffer-file-name)))
	  garbage-collection-messages)

;; 切换代理
(defun +evan/toggle-proxy () 
  (interactive) 
  (if (null url-proxy-services) 
      (progn 
        (setq url-proxy-services
              '(("http" . (concat evan/proxy-host ":" evan/proxy-port) ) 
                ("https" . (concat evan/proxy-host ":" evan/proxy-port))))
        (message "代理已开启.")) 
    (setq url-proxy-services nil)
    (message "代理已关闭.")))


(defun +evan/find-config-file-by-fzf ()
  "在~/.emacs.d/中使用fzf查找文件"
  (interactive)
  (counsel-fzf nil "~/.emacs.d"))

;; 调节屏幕亮度
(defun +evan/set-backlight (&optional light-value)
  (interactive "s请输入亮度(小数表示的百分比): ")
  (let ((max-backlight (string-to-number (string-trim-right
										  (shell-command-to-string
										   "cat /sys/class/backlight/intel_backlight/max_brightness")))))
	(when (and light-value (floatp (string-to-number light-value)))
	  (shell-command
	   (concat "echo "
			   (format "%d" (* max-backlight (string-to-number light-value))) 
			   " > /sys/class/backlight/intel_backlight/brightness")))))

;; 增加10%屏幕亮度
(defun +evan/plus-backlight ()
  (interactive)
  (let* (
		 ;; 最大亮度
		 (max-backlight (string-to-number (string-trim-right
										   (shell-command-to-string "cat /sys/class/backlight/intel_backlight/max_brightness"))))
		 ;; 当前亮度
		 (current-backlight (string-to-number (string-trim-right
											   (shell-command-to-string "cat /sys/class/backlight/intel_backlight/brightness"))))
		 ;; 增加后的亮度
		 (add-backlight (+ current-backlight (* max-backlight 0.1))))
	(if (< add-backlight max-backlight)
		(progn (shell-command
				(concat "echo "
						(format "%d" add-backlight) 
						" > /sys/class/backlight/intel_backlight/brightness"))
			   (message "亮度+10%")) 
	  (message "亮度MAX!!"))))

;; 减少屏幕亮度
(defun +evan/less-backlight ()
  (interactive)
  (let* (
		 ;; 最大亮度
		 (max-backlight (string-to-number (string-trim-right
										   (shell-command-to-string "cat /sys/class/backlight/intel_backlight/max_brightness"))))
		 ;; 当前亮度
		 (current-backlight (string-to-number (string-trim-right
											   (shell-command-to-string "cat /sys/class/backlight/intel_backlight/brightness"))))
		 ;; 减少后的亮度
		 (less-backlight (- current-backlight (* max-backlight 0.1))))
	(if (> less-backlight (* max-backlight 0.1) )
		(progn (shell-command
				(concat "echo "
						(format "%d" less-backlight)
						" > /sys/class/backlight/intel_backlight/brightness"))
			   (message "亮度-10%")) 
	  (message "亮度Min!!"))))

;; 增加透明度
(defun +evan/less-alpha ()
  (interactive)
  (sanityinc/adjust-opacity nil -2))

;; 减少透明度
(defun +evan/plus-alpha ()
  (interactive)
  (sanityinc/adjust-opacity nil 2))

;; 打开临时elisp buffer
(defun +evan/temp-elisp-buf ()
  (interactive)
  (let ((buf (get-buffer-create "*TEMP-ELISP*")))
	(with-current-buffer buf
	  (pop-to-buffer buf t)
	  (lisp-interaction-mode))))
;; 关闭临时elisp buffer
(defun +evan/kill-temp-elisp-buf ()
  (interactive)
  (let (buf (get-buffer "*TEMP-ELISP"))
	(if (null buf)
		(kill-buffer buf))))
;; 光标向上移动5行
(defun +evan/previous-line-5 ()
  (interactive)
  (previous-line 5))
;; 光标向下移动5行
(defun +evan/next-line-5 ()
  (interactive)
  (next-line 5))

(defun +evan/girl-say ()
  (interactive)
  (let ((girl-say-lst (list)))
    (mapcar (lambda (mp3)
              (push mp3 girl-say-lst))
            (split-string (shell-command-to-string "ls ~/.emacs.d/var/girl-say")))
    
    (setq girl-say-process
          (start-process-shell-command "girl-say" "girl-say"
                                       (concat "mplayer" " ~/.emacs.d/var/girl-say/" (nth
                                                                                      (random (length girl-say-lst))
                                                                                      girl-say-lst))))))


(provide '+config)
