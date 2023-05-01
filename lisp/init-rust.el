(require 'rust-mode)

;; The Rust style guide recommends spaces rather than tabs for indentation
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(provide 'init-rust)
