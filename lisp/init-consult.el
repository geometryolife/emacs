;; Consult completing-read

;; consult-grep
;; consult-git-grep

(global-set-key (kbd "M-s s") 'consult-ripgrep)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "M-s i") 'consult-imenu)
;; Virtual buffers: consult-buffer, consult-project-buffer, consult-bookmark, consult-recent-file

(provide 'init-consult)
