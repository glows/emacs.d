(use-package pyim
  :disabled
  :ensure t
  :defer 0
  :config
  (use-package pyim-basedict
	:ensure nil
	:config
	(pyim-basedict-enable))
  (pyim-isearch-mode 1)
  (setq pyim-length 5)
  (setq pyim-page-tooltip 'popup)
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'quanpin)
  :bind
  (("C-\\" . toggle-input-method)))

(provide 'init-pyim)
