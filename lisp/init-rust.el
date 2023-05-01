(require 'rust-mode)

;; The Rust style guide recommends spaces rather than tabs for indentation
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

;; Code formatting - enables automatic formatting on save
(setq rust-format-on-save t)

(provide 'init-rust)
