;;  A blazingly fast LSP client for Emacs
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/lsp-bridge"))

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(provide 'init-lsp-bridge)
