(setq ring-bell-function 'ignore)
(global-linum-mode t)
(setq inhibit-startup-screen t)
(global-set-key (kbd "C-d") 'help-command)
(add-to-list 'help-event-list '4)
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(electric-pair-mode t)
(toggle-frame-maximized)
(global-set-key (kbd "C-d C-v") 'find-variable)
(global-set-key (kbd "C-d C-f") 'find-function)
(global-set-key (kbd "C-d C-k") 'find-function-on-key)
(setq make-backup-files nil)
(show-paren-mode t)
;;(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-better-default)
