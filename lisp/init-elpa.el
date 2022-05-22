(require 'package)
(setq package-archives
      '(
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

(package-install 'company)
(package-install 'keycast)
(package-install 'vertico)
(package-install 'orderless)
(package-install 'marginalia)
(package-install 'embark)
(package-install 'consult)
(package-install 'markdown-mode)
(provide 'init-elpa)
