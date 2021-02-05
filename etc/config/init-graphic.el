;; 图形化插件特殊设置
(when (graphic-p)
  (dolist (elisp-code graphic-only-plugins-setting)
    (eval elisp-code)))

(add-hook 'after-make-frame-functions #'(lambda (frame)
                                          (select-frame frame)
                                          (message "frame make!")
                                          (dolist (elisp-code graphic-only-plugins-setting)
                                            (eval elisp-code))))


(provide 'init-graphic)
