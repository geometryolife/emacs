;;  A blazingly fast LSP client for Emacs
(add-to-list 'load-path "~/i/lsp-bridge")

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(provide 'init-lsp-bridge)
