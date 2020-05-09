(use-package 
  org 
  :ensure t
  :hook ('org-mode . 'toggle-truncate-lines))

(use-package 
  org-bullets
  :ensure t
  :hook ('org-mode . 'org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("☰" "☷" "☯" "☭")))

(provide 'init-org)
