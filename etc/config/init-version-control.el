;; 交互式Git工具
(use-package magit
  :ensure t
  :commands (magit))

;; 显示当前行修改-Git
(use-package git-gutter-fringe
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :custom
  (git-gutter:update-interval 1)
  (git-gutter:added-sign "+")
  (git-gutter:deleted-sign "_")
  (git-gutter:modified-sign "~")
  (git-gutter:hide-gutter t))

(provide 'init-version-control)
