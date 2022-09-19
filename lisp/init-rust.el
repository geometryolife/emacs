(require 'rust-mode)
(add-hook 'rust-mode-hook 'eglot-ensure)
;;(require 'lsp-mode)
;;(add-hook 'rust-mode-hook #'lsp-deferred)

(provide 'init-rust)
