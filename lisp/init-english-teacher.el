(use-package english-teacher
  :load-path "english-teacher-path" ;; NOTE: here type english teacher directory
  :hook ((Info-mode
          elfeed-show-mode
          eww-mode
          Man-mode
          Woman-Mode) . english-teacher-follow-mode))

