;; -*- lexical-binding: t -*-
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(require 'package)
(setq package-archives
      '(
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ;;("melpa-stable" . "https://stable.melpa.org/packages/")
	))
(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

(package-install 'company)

;;modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(keycast-mode t)

;; 增强 minibuffer 补全：vertico 和 Orderless
(package-install 'vertico)
(vertico-mode t)

;; 无序搜索增强，配置 Marginalia 增强 minubuffer 的 annotation
(package-install 'orderless)
(setq completion-styles '(orderless))

;; 不用进入变量，在minibuffer就可以预览变量值
(package-install 'marginalia)
(marginalia-mode t)

(package-install 'embark)
(global-set-key (kbd "<f8>") 'embark-act) ;; 告诉函数绑定的快捷键
(setq prefix-help-command 'embark-prefix-help-command) ;; C-key C-h ...

;; 找到描述变量，<f8>，根据提示选项操作

;; 增强文件内搜索和跳转函数定义：Consult
(package-install 'consult)
;;replace swiper
(global-set-key (kbd "C-s") 'consult-line)
;;M-x consult-imenu
(global-set-key (kbd "M-s i") 'consult-imenu)

;;在文件最开头添加地个 文件作用域的变量设置，设置变量的绑定方式
;; -*- lexical-binding: t -*-
;;(let ((x 1))    ; x is lexically bound.
;;  (+ x 3))
;;     ⇒ 4

;;(defun getx ()
;;  x)            ; x is used free in this function.

;;(let ((x 1))    ; x is lexically bound.
;;  (getx))
;;error→ Symbol's value as variable is void: x

(setq ring-bell-function 'ignore)
(global-linum-mode t)
(setq inhibit-startup-screen t)
;;(server-mode t)

(setq tab-always-indent 'complete) ;; 在编辑的时候也可以补全

;;(icomplete-mode t) ;; 当按下 M-x 过一会儿会出现交互式的可选补全

(setq name "geometryolife")

(message name)

(defun func()
  (interactive)
  (message "hello, %s" name))

(setq name "Joe")

(global-set-key (kbd "C-d") 'help-command)
(add-to-list 'help-event-list '4)

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
;; (setq cursor-type 'hollow) ;; 缓冲区
;; (setq-default cursor-type 'box) ;; 全局

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
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 关闭备份文件
(setq make-backup-files nil)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;;(set-face-attribute 'default nil :height 160)

;;让鼠标滚动更好用
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;;(setq mouse-wheel-progressive-speed nil)

(show-paren-mode t)

;; 开启 Tab
(add-to-list 'load-path (expand-file-name "~/.emacs.d/awesome-tab"))
(require 'awesome-tab)
(awesome-tab-mode t)

(defun awesome-tab-buffer-groups ()
"`awesome-tab-buffer-groups' control buffers' group rules.
Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `awesome-tab-get-group-name' with project name."
(list
(cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
	(memq major-mode '(magit-process-mode
			    magit-status-mode
			    magit-diff-mode
			    magit-log-mode
			    magit-file-mode
			    magit-blob-mode
			    magit-blame-mode)))
    "Emacs")
    ((derived-mode-p 'eshell-mode)
    "EShell")
    ((derived-mode-p 'dired-mode)
    "Dired")
    ((memq major-mode '(org-mode org-agenda-mode diary-mode))
    "OrgMode")
    ((derived-mode-p 'eaf-mode)
    "EAF")
    (t
     (awesome-tab-get-group-name (current-buffer))))))

;; 下面两行的效果完全相同的
;; (quote foo)
;; 'foo
;; quote 的意思是不要执行后面的内容，返回它原本的内容（具体请参考下面的例子）
;;(print '(+ 1 1)) ;; -> (+ 1 1)
;;(print (+ 1 1))  ;; -> 2

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

(global-set-key (kbd "C-x b") 'consult-buffer)

(delete-selection-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(marginalia orderless consult embark vertico keycast company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
