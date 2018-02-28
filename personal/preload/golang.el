(defconst EMACS_CONF "/Users/liuxingwang/.emacs.d/")
; emacs中读取系统环境变量的插件，否则在emacs中执行go run之类的变量无法找到
(load-file (concat EMACS_CONF "elpa/exec-path-from-shell-20180224.1916/exec-path-from-shell.el"))
(when (fboundp 'exec-path-from-shell-copy-env)
         (exec-path-from-shell-copy-env "GOPATH")
                (exec-path-from-shell-copy-env "GOBIN")
                         (exec-path-from-shell-copy-env "GOROOT")
                                    (exec-path-from-shell-copy-env "PATH"))

; go跳回定义快捷键
(global-set-key (kbd "C-c C-b") #'pop-tag-mark)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

; go-autocomplete
(load-file (concat EMACS_CONF "elpa/auto-complete-20170124.1845/auto-complete-autoloads.el"))
(load-file (concat EMACS_CONF "elpa/popup-20160709.729/popup.el"))
(load-file (concat EMACS_CONF "elpa/go-autocomplete-20170626.323/go-autocomplete.el"))
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat EMACS_CONF "elpa/auto-complete-20170124.1845/dict"))
  (ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


; emacs主题设置，刚安装好的emacs没有atom-one-dark，会引起出错 需要去package-list-packages中寻找主题安装
(setq prelude-theme 'atom-one-dark)

; emacs字体设置，需要系统中安装对应字体
(set-frame-font "-*-Source Code Pro-light-normal-normal-*-13-*-*-*-m-0-iso10646-1")

; emacs滚动速度调节
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(provide 'golang)
