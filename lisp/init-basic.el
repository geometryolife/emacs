(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)

(setq-default cursor-type '(bar . 5))
(setq-default tab-width 4)

(menu-bar-mode -1)
(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1))
(electric-pair-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(column-number-mode t)

(delete-selection-mode t)
(global-hl-line-mode t)
(global-linum-mode t)
(global-auto-revert-mode t)

(toggle-frame-maximized)
(toggle-frame-fullscreen)
;;(fset 'yes-or-no-p 'y-or-n-p)

;; Change C-d to help-command prefix
;;(global-set-key (kbd "C-d") help-map)
(global-set-key (kbd "C-d") 'help-command)
(add-to-list 'help-event-list '4)

;; Change C-h to backspace (like Vim)
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)

;; Change M-d to C-d and remap functions of original keys
(global-set-key (kbd "M-d") 'delete-char)
(global-set-key (kbd "M-D") 'kill-word)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "M-W") 'kill-region)

;; Add an additional key binding to set-mark-command
(global-set-key (kbd "M-s m") 'set-mark-command)

;; Keybindings for searching variables, functions and keys
(global-set-key (kbd "C-d C-v") 'find-variable)
(global-set-key (kbd "C-d C-f") 'find-function)
(global-set-key (kbd "C-d C-k") 'find-function-on-key)

;; Add an additional key binding to toggle-frame-fullscreen
(global-set-key (kbd "M-s f") 'toggle-frame-fullscreen)

;; Create the meta-m-map, make the M-m to a prefix key
(define-prefix-command 'meta-m-map)
(global-set-key (kbd "M-m") 'meta-m-map)

;; Remap back-to-indentation (M-m) as (M-m m m)
(global-set-key (kbd "M-m m m") 'back-to-indentation)

;; Quickly open the init.el file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-d ;") 'open-init-file)


(provide 'init-basic)
