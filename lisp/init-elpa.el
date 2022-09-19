(require 'package)
(setq package-archives
      '(
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;;(package-install 'markdown-mode)

;; common lisp
(require 'cl)
(defvar melpa-include-packages '(
								 company
								 keycast
								 vertico
								 orderless
								 marginalia
								 embark
								 consult
								 hungry-delete
								 ;;smartparens
								 ;;markdown-mode
								 rust-mode
								 eglot
								 ;;lsp-mode
								 )
  "Default packages")

(setq package-selected-packages melpa-include-packages)

(defun geoemacs-packages-installed-p ()
  (loop for pkg in melpa-include-packages
		when (not (package-installed-p pkg)) do (return nil)
		finally (return t)))

(unless (geoemacs-packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg melpa-include-packages)
	(when (not (package-installed-p pkg))
	  (package-install pkg))))

(provide 'init-elpa)
