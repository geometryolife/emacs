;; -*- lexical-binding: t -*-
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-better-default)
(require 'init-elpa)
(require 'init-org)
(require 'init-markdown-mode)
;;(require 'init-company)
(require 'init-rust)
(require 'init-pyim)
(require 'init-consult)
(require 'init-embark)
(require 'init-yasnippet)
(require 'init-lsp-bridge)
(require 'init-move-mode)
(require 'init-youdao-dictionary)

;; Fix magit issue: (void-function cursor-sensor-move-to-tangible) after 3224b17 #4931 
(require 'cursor-sensor)

;;modeline上显示我的所有的按键和执行的命令
;;(keycast-mode t)

;; 增强 minibuffer 补全：vertico 和 Orderless
(vertico-mode t)

;; 无序搜索增强，配置 Marginalia 增强 minubuffer 的 annotation
(setq completion-styles '(orderless))

;; 不用进入变量，在minibuffer就可以预览变量值
(marginalia-mode t)

(setq prefix-help-command 'embark-prefix-help-command) ;; C-key C-h ...

;; 找到描述变量，<f8>，根据提示选项操作

;; 增强文件内搜索和跳转函数定义：Consult
;;replace swiper

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

;;(server-mode t)

(setq tab-always-indent 'complete) ;; 在编辑的时候也可以补全

;;(icomplete-mode t) ;; 当按下 M-x 过一会儿会出现交互式的可选补全

(setq name "geometryolife")

(message name)

(defun func()
  (interactive)
  (message "hello, %s" name))

(setq name "Joe")

(func)

(global-set-key (kbd "<f2>") 'func)

;; lispy s-expression introduce later

;; mode line
;; eldoc-mode 会在 mini-buffer 告诉你函数签名
;; C-h m ->
;; font-lock-mode 开启语法高亮

;; 更改光标的样式（不能生效，解决方案见第二集）
;; (setq cursor-type 'hollow) ;; 缓冲区
;; (setq-default cursor-type 'box) ;; 全局

;; 重新加载配置文件 M-x load-file
;; 执行当前缓冲区所有 Lisp 命令 M-x eval-buffer

;; REPL read eval print loop -> Happy Hacking
;; C-x C-h => 显示 C-x 绑定的所有快捷键
;; 同理 C-x C-h ...

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;;(set-face-attribute 'default nil :height 160)

;;让鼠标滚动更好用
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;;(setq mouse-wheel-progressive-speed nil)

;; 开启 Tab
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/awesome-tab"))
;;(require 'awesome-tab)
;;(awesome-tab-mode t)

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

;;(require 'recentf)
(recentf-mode 1)
;;(setq recentf-max-menu-item 10)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; (shell-command-to-string "explorer.exe C:\\") ;; 打开C盘
;; (shell-command-to-string "explorer.exe ~/.emacs.d")

;;(shell-command-to-string
;; (encode-coding-string
;;  (replace-regexp-in-string "/" "\\\\"
;;		(format "explorer.exe %s" (expand-file-name "~/.emacs.d")))
;;  'gbk)) ;; 中文编码，适应中文目录

(defun consult-directory-externally (file)
  "Open FILE externally using the default application of the system."
  (interactive "fOpen externally: ")
  (if (and (eq system-type 'windows-nt)
	   (fboundp 'w32-shell-execute))
      (shell-command-to-string (encode-coding-string (replace-regexp-in-string "/" "\\\\"
	    (format "explorer.exe %s" (file-name-directory (expand-file-name file)))) 'gbk))
    (call-process (pcase system-type
		    ('darwin "open")
		    ('cygwin "cygstart")
		    (_ "xdg-open"))
		  nil 0 nil
		  (file-name-directory (expand-file-name file)))))

;;(define-key embark-file-map (kbd "E") #'consult-directory-externally)
;;打开当前文件的目录
(defun my-open-current-directory ()
  (interactive)
  (consult-directory-externally default-directory))

;; grep < ack < ag < ripgrep(rg)
;; 增强 embark 和 consult，批量搜索替换大杀器
(package-install 'embark-consult)
(package-install 'wgrep)
(setq wgrep-auto-save-buffer t)

(eval-after-load ;; 延迟加载
    'consult ;; 加载完才执行下面的语句
  '(eval-after-load
       'embark
     '(progn
	(require 'embark-consult)
	(add-hook ;; 希望在 embark-collect-mode 之后执行一个特定的功能，可以使用 add-hook
	 'embark-collect-mode-hook
	 #'consult-preview-at-point-mode))))

(defun embark-export-write ()
  "Export the current vertico results to a writable buffer if possible.
Supports exporting consult-grep to wgrep, file to wdeired, and consult-location to occur-edit"
  (interactive)
  (require 'embark)
  (require 'wgrep)
  (pcase-let ((`(,type . ,candidates)
               (run-hook-with-args-until-success 'embark-candidate-collectors)))
    (pcase type
      ('consult-grep (let ((embark-after-export-hook #'wgrep-change-to-wgrep-mode))
                       (embark-export)))
      ('file (let ((embark-after-export-hook #'wdired-change-to-wdired-mode))
               (embark-export)))
      ('consult-location (let ((embark-after-export-hook #'occur-edit-mode))
                           (embark-export)))
      (x (user-error "embark category %S doesn't support writable export" x)))))

(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)
;; C-c C-e -> C-M-% query-replace-regexp

;;使用ripgrep来进行搜索
;;consult-ripgrep

;;everyting
;;consult-locate

;; Encoding -> UTF-8 as the default coding system
;;(when (fboundp 'set-charset-priority)
;;  (set-charset-priority 'unicode))

;;(reset-language-environment 'chinese-gbk)
;;(prefer-coding-system 'utf-8-auto)

;; 配置搜索中文
(progn
  (setq consult-locate-args (encode-coding-string "es.exe -i -p -r" 'gbk))
  (add-to-list 'process-coding-system-alist '("es" gbk . gbk))
  )
(eval-after-load 'consult
  (progn
      (setq
	consult-narrow-key "<"
	consult-line-numbers-widen t
	consult-async-min-input 2
	consult-async-refresh-delay  0.15
	consult-async-input-throttle 0.2
	consult-async-input-debounce 0.1)
    ))

;; 使用拼音进行搜索
;;(package-install 'pyim)
;;
;;(defun eh-orderless-regexp (orig_func component)
;;    (let ((result (funcall orig_func component)))
;;      (pyim-cregexp-build result)))
;;
;;
;;  (defun toggle-chinese-search ()
;;    (interactive)
;;    (if (not (advice-member-p #'eh-orderless-regexp 'orderless-regexp))
;;	;; advice-add 不修改已有函数的基础上，使用一个补丁
;;	;; orderless-regexp 对文本过滤时，运用补丁——pyim来增强正则的拼音搜索
;;	(advice-add 'orderless-regexp :around #'eh-orderless-regexp)
;;      (advice-remove 'orderless-regexp #'eh-orderless-regexp)))
;;
;;  (defun disable-py-search (&optional args)
;;    (if (advice-member-p #'eh-orderless-regexp 'orderless-regexp)
;;	(advice-remove 'orderless-regexp #'eh-orderless-regexp)))
;;
;;  ;; (advice-add 'exit-minibuffer :after #'disable-py-search)
;;  (add-hook 'minibuffer-exit-hook 'disable-py-search) ;; 退出时禁用，提高流畅性
;;
;;  (global-set-key (kbd "s-p") 'toggle-chinese-search) ;; 默认关闭，需要时打开

;;(package-install 'monokai-theme)
;;(load-theme 'monokai t)
(package-install 'doom-themes)
(load-theme 'doom-one t)

;; 增强delete
(require 'hungry-delete)
(global-hungry-delete-mode)
;; 括号匹配
;;(require 'smartparens-config)

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)
