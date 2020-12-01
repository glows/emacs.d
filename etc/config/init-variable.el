;;; 配置内一些可以修改的变量，这些变量请在private模块中重新修改。

(setq
 ;; 字体相关
 ;; 英文字体
 evan/en-font-name "agave Nerd Font"
 evan/en-font-style "r"
 evan/en-font-size 20
 ;; 中文字体
 evan/zh-font-name "Sarasa Mono CL"
 evan/zh-font-style "Regular"
 evan/zh-font-size 18

 ;; 代理相关
 evan/proxy-type "socks5"
 evan/proxy-host "127.0.0.1"
 evan/proxy-port "1088"

 ;; Emacs原生设置
 shell-file-name "/usr/bin/zsh"

 ;; EAF相关
 evan/eaf-grip-token nil
 )


(provide 'init-variable)
