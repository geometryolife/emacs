
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-linum-mode t)
(setq inhibit-startup-screen t)
;;(server-mode t)

(setq tab-always-indent 'complete) ;; 在编辑的时候也可以补全

(icomplete-mode t) ;; 当按下 M-x 过一会儿会出现交互式的可选补全

(setq name "geometryolife")

(message name)

(defun func()
  (interactive)
  (message "hello, %s" name))

(setq name "Joe")

(global-set-key (kbd "C-d") 'help-command)

(func)

(global-set-key (kbd "<f2>") 'func)

;; lispy s-expression introduce later

(electric-pair-mode t)
(toggle-frame-maximized) ;; 最大化画面

;; mode line
;; eldoc-mode 会在 mini-buffer 告诉你函数签名
;; C-h m ->
;; font-lock-mode 开启语法高亮

;; 关闭工具栏，这是 minor-mode
;;(tool-bar-mode -1)
;; 关闭文件滑动控件
;;(scroll-bar-mode -1)

;; 更改光标的样式（不能生效，解决方案见第二集）
;; (setq cursor-type 'hollow)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 将 open-init-file 函数绑定到 <f9> 键上
(global-set-key (kbd "<f9>") 'open-init-file)

;; 重新加载配置文件 M-x load-file
;; 执行当前缓冲区所有 Lisp 命令 M-x eval-buffer

;; REPL read eval print loop -> Happy Hacking
;; C-x C-h => 显示 C-x 绑定的所有快捷键
;; 同理 C-x C-h ...

(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
;; 定义 company-mode 的键映射
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-n") 'company-select-next)


(global-set-key (kbd "C-h C-f") 'find-function)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
