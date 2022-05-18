(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)

(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-h") 'backward-delete-char-untabify)

(provide 'init-company)
