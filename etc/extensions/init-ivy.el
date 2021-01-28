(progn
  ;;美化
  (use-package 
	all-the-icons-ivy-rich 
	:ensure t 
	:init (all-the-icons-ivy-rich-mode 1)) 
  (use-package ivy-rich
    :ensure t
    :config
    (ivy-rich-mode +1))
  ;; 美化
  (use-package 
	ivy-posframe
    :disabled
	:ensure t
	:hook (ivy-mode ivy-posframe-mode)
	:custom (ivy-posframe-parameters '((left-fringe . 8) 
									   (right-fringe . 8)))
	(ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))))
;; counsel提供对项目管理的支持
(use-package 
  counsel-projectile 
  :ensure t 
  :hook ((counsel-mode . counsel-projectile-mode)) 
  :init (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point)) 
  :bind (:map leader-key
              ("p" . #'projectile-command-map)))

(use-package ivy-fuz
  :ensure t)

;;;###autoload
(defun ivy-telega-chat-highlight (chat)
  (let ((unread (funcall (telega--tl-prop :unread_count) chat))
        (title (telega-chat-title chat 'with-identity))
        (not-muted-p (not (telega-chat-muted-p chat)))
        (mentions (funcall (telega--tl-prop :unread_mention_count) chat)))

    (if (and not-muted-p (> (+ unread mentions) 0))
        (ivy-append-face (format "%s %d@%d" title unread mentions) 'ivy-highlight-face)
      title)))

;;;###autoload
(defun ivy-telega-chat-with ()
  "Starts chat with defined peer"
  (interactive)

  (telega t)
  (let ((chats (mapcar
                (lambda (x) (cons (ivy-telega-chat-highlight x) x))
                (telega-filter-chats telega--ordered-chats 'all))))
    (ivy-read "chat: " chats
              :action (lambda (x) (telega-chat--pop-to-buffer (cdr x)))
              :caller 'ivy-telega-chat-with)))
(bind-key "t c" #'ivy-telega-chat-with leader-key)

(setq telega-completing-read-function 'ivy-completing-read)


(provide 'init-ivy)
