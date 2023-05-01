;; Markdown mode

(setq markdown-asymmetric-header t)

;; Translate the markdown keymaps only when markdown-mode is activated
(add-hook 'markdown-mode-hook
		  (lambda ()
			(define-key key-translation-map (kbd "M-m s") (kbd "C-c C-s"))
			(define-key key-translation-map (kbd "M-m c") (kbd "C-c C-c"))))

(provide 'init-markdown-mode)
