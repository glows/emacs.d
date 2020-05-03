(use-package 
  org 
  :ensure t)

(use-package 
  org-bullets
  :ensure t
  :after org
  ;; :custom
  ;; (org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
  :config
  (add-hook 'org-mode-hook (lambda () 
                             (org-bullets-mode t))))

(provide 'init-org)
