;; Youdao Dictionary(有道词典) interface for Emacs

;; Create the meta-o-map, make the M-o become a prefix key
(define-prefix-command 'meta-o-map)
(global-set-key (kbd "M-o") 'meta-o-map)

(global-set-key (kbd "M-o o") 'youdao-dictionary-search)
(global-set-key (kbd "M-o a") 'youdao-dictionary-search-async)
(global-set-key (kbd "M-o i") 'youdao-dictionary-search-from-input)
(global-set-key (kbd "M-o r") 'youdao-dictionary-search-and-replace)
(global-set-key (kbd "M-o v") 'youdao-dictionary-play-voice-at-point)
(global-set-key (kbd "M-o b") 'youdao-dictionary-play-voice-from-input)
(global-set-key (kbd "M-o t") 'youdao-dictionary-search-at-point-tooltip)
(global-set-key (kbd "M-o f") 'youdao-dictionary-search-at-point-posframe)

(provide 'init-youdao-dictionary)
