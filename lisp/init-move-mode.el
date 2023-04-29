;; Emacs major mode for Move smart contract programming language
(add-to-list 'load-path "~/i/move-mode")
(autoload 'move-mode "move-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.move\\'" . move-mode))

(provide 'init-move-mode)
