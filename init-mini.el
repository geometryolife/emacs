(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)

(menu-bar-mode -1)
(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1))
(electric-pair-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-linum-mode t)
(global-hl-line-mode t)
(delete-selection-mode t)

(toggle-frame-maximized)

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
