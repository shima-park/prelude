; go跳回定义快捷键
(global-set-key (kbd "C-c C-b") #'pop-tag-mark)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

; emacs主题设置，刚安装好的emacs没有atom-one-dark，会引起出错 需要去package-list-packages中寻找主题安装
(setq prelude-theme 'atom-one-dark)

; emacs字体设置，需要系统中安装对应字体
(set-frame-font "-*-Source Code Pro-light-normal-normal-*-13-*-*-*-m-0-iso10646-1")

; emacs滚动速度调节
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(provide 'mygolang)
