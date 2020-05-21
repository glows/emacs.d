(require 'org-capture)

(use-package 
  org 
  :ensure t
  :hook (('after-init-hook 'org-mode-hook)
         ('org-mode . 'toggle-truncate-lines))
  :bind
  ("C-c c" . 'org-capture)
  ("C-c a" . 'org-agenda)
  :custom
  (org-todo-keywords '((sequence "[学习](s!/@)" "[待办](t!/@)" "[等待](w!))" "|" "[完成](d!/@)" "[取消](c!@)")
                       (sequence "[BUG](b!/@)" "[新事件](i@)" "[已知问题](k!/@)" "[修改中](W!/@)" "|" "[已修复](f!)")
                       ))
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
  (add-to-list 'org-capture-templates
               '("t" "任务清单"))
  (add-to-list 'org-capture-templates
               '("c" "代码"))
  (add-to-list 'org-capture-templates '("tw" "工作任务" entry (file+headline "~/Documents/org/capture/task.org" "Work")
                                        "* [待办] %^{任务名} - %U\n  %a\n  %?" :clock-in t :clock-keep t))
  (add-to-list 'org-capture-templates '("ts" "学习任务" entry (file+headline "~/Documents/org/capture/task.org" "Study")
                                        "* [学习] %^{学习项目} - %U\n  %a\n  %?" :clock-in t :clock-keep t))
  (add-to-list 'org-capture-templates '("j" "记录日志" entry (file+datetree "~/Documents/org/capture/journal.org")
                                        "* %U - %^{标题}\n  %?"))
  (add-to-list 'org-capture-templates '("i" "捕获灵感" entry (file "~/Documents/org/capture/inbox.org")
                                        "* %U - %^{标题} %^g\n  %?\n"))
  (add-to-list 'org-capture-templates '("n" "临时笔记" entry (file "~/Documents/org/capture/notes.org")
                                        "* %^{标题} %t %^g\n  %?\n"))
  (add-to-list 'org-capture-templates '("l" "超链接" entry (file+headline "~/Documents/org/capture/link.org" "Links")
                                        "* %^{简介} %t %^g\n  %^L\n  %?\n"))
  (add-to-list 'org-capture-templates '("cd" "代码片段" entry (file+olp "~/Documents/org/capture/code.org" "Code" "Snippets")
                                        "* %^{简介} %t %^g\n  %a\n  #+begin_src %^{语言}\n  %?\n  #+end_src"))
  (add-to-list 'org-capture-templates '("ct" "代码追踪" entry (file+olp "~/Documents/org/capture/code.org" "Code" "Trace")
                                        "* %^{简介} %t %^g\n  %a\n  %?"))
  (add-to-list 'org-capture-templates '("w" "记录单词" table-line (file+headline "~/Documents/org/capture/word.org" "Words")
                                        " | %U | %^{en_US} | %^{词性} | %^{zh_CN} |"))
  (set-face-attribute 'org-table nil :font (font-spec :name "等距更纱黑体 SC"
                                                      :size 22)))


(use-package 
  org-bullets
  :ensure t
  :hook ('org-mode . 'org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("☰" "☷" "☯" "☭")))

(provide 'init-org)
