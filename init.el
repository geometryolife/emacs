(global-linum-mode t)
(setq inhibit-startup-screen t)
;;(server-mode t)

(setq tab-always-indent 'complete)

(icomplete-mode t)

(setq name "geometryolife")

(message name)

(defun func()
  (interactive)
  (message "hello, %s" name))

(setq name "Joe")

(func)

(global-set-key (kbd "<f2>") 'func)
