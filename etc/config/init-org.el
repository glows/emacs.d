(require 'org-capture)

(use-package 
  org 
  :ensure t
  :hook (('after-init-hook 'org-mode-hook)
         ;; ('org-mode . 'toggle-truncate-lines)
		 )
  :bind
  ("C-c c" . 'org-capture)
  ("C-c a" . 'org-agenda)
  :custom
  (org-todo-keywords '((sequence "[学习](s!/@)" "[待办](t!/@)" "[等待](w!))" "|" "[完成](d!/@)" "[取消](c!@)")
                       (sequence "[BUG](b!/@)" "[新事件](i@)" "[已知问题](k!/@)" "[修改中](W!/@)" "|" "[已修复](f!)")))
  (org-todo-keyword-faces '(("[学习]" . (:foreground "white" :background "#2ECC71" :weight bold))
                            ("[待办]" . (:foreground "white" :background "#F1C40F" :weight bold))
                            ("[等待]" . (:foreground "white" :background "#3498DB" :weight bold))
                            ("[完成]" . (:foreground "white" :background "#566573 " :weight bold))
                            ("[取消]" . (:foreground "white" :background "#566573" :weight bold))
                            ("[BUG]" . (:foreground "white" :background "#E74C3C" :weight bold))
                            ("[新事件]" . (:foreground "white" :background "#D35400" :weight bold))
                            ("[已知问题]" . (:foreground "white" :background "#17A589" :weight bold))
                            ("[修改中]" . (:foreground "white" :background "#BB8FCE" :weight bold))
                            ("[已修复]" . (:foreground "white" :background "#566573" :weight bold))))
  :config
  (defun evan/capture-get-word-point ()
	(interactive)
	(setq evan/capture-get-word-point-word (thing-at-point 'word))
	(if (null evan/capture-get-word-point-word)
						   (error "Cannot find word at point.")
						 (org-capture 1 "f")))
  (defun evan/capture-get-word-eng(type)
	;; (interactive "^p")
	(message "当前光标下的英文: %s" (thing-at-point 'word))
	(let* ((point-word (if (null evan/capture-get-word-point-word)
						   (error "Cannot find word at point.")
						 evan/capture-get-word-point-word))
		   (evan/capture-word-translate (youdao-dictionary--request point-word))
		   (evan/capture-word-eng point-word)
		   (evan/capture-word-chinese (cdar (nthcdr 3 (cdadr evan/capture-word-translate))))
		   (evan/capture-word-type nil))
	  ;; 获取单词词性
	  (progn (string-match "[a-zA-Z]+" (aref evan/capture-word-chinese 0)) ;; 匹配英文字符
			 ;; 设置词性 格式为: "adj."
			 (setq evan/capture-word-type (concat (match-string 0 (aref evan/capture-word-chinese 0)) ".")))
	  
	  ;; 设置单词中文
	  (progn (string-match "[\u4e00-\u9fa5；，]+" (aref evan/capture-word-chinese 0))
			 ;; 设置中文
			 (setq evan/capture-word-chinese (match-string 0 (aref evan/capture-word-chinese 0))))
	  ;; 根据参数返回具体的值
	  (cond ((eq type 1) evan/capture-word-eng)
			((eq type 2) evan/capture-word-type)
			((eq type 3) evan/capture-word-chinese))))
  (setq org-capture-templates nil)
  ;; (setq org-time-stamp-formats '("<%Y-%m-%d 周%u %H:%M>"))
  (add-to-list 'org-capture-templates
               '("t" "任务清单"))
  (add-to-list 'org-capture-templates '("tw" "工作任务" entry (file+headline "~/Documents/org/capture/task.org" "Work")
                                        "* [待办] %^{任务名} - %U\n  %a\n  %?" :clock-in t :clock-keep t))
  (add-to-list 'org-capture-templates '("ts" "学习任务" entry (file+headline "~/Documents/org/capture/task.org" "Study")
                                        "* [学习] %^{学习项目} - %U\n  %a\n  %?" :clock-in t :clock-keep t))
  (add-to-list 'org-capture-templates '("j" "我的日志" entry (file+headline"~/Documents/site/org/diary.org" "日志")
                                        "* %U - %^{标题}\n  %?"))
  (add-to-list 'org-capture-templates '("i" "我的闪念" entry (file+headline "~/Documents/site/org/idea.org" "闪念")
                                        "* %U - %^{标题} %^g\n  %?\n"))
  (add-to-list 'org-capture-templates '("k" "我的百科" entry (file+headline "~/Documents/site/org/wiki.org" "WIKI")
                                        "* %^{标题} %t %^g\n  %?\n"))
  (add-to-list 'org-capture-templates '("w" "我的单词" table-line (file+headline "~/Documents/org/capture/word.org" "Words")
                                        " | %U | %^{en_US} | %^{词性} | %^{zh_CN} | %(evan/hello)"))
  (add-to-list 'org-capture-templates '("f" "单词速导" table-line (file+headline "~/Documents/org/capture/word.org" "Words")
                                        " | %U | %(evan/capture-get-word-eng 1) | %(evan/capture-get-word-eng 2) | %(evan/capture-get-word-eng 3) |"))
  (add-to-list 'org-capture-templates '("l" "超链接" entry (file+headline "~/Documents/org/capture/link.org" "Links")
                                        "* %^{简介} %t %^g\n  %^L\n  %?\n")))


(set-face-attribute 'org-table nil :font (font-spec :name "Sarasa Mono SC"
                                                      :size 20
													  ;; :style "Regular"
													  ))

;; 美化org
(use-package 
  org-bullets
  :ensure t
  :hook ('org-mode . 'org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("☰" "☷" "☯" "☭")))

(provide 'init-org)
