;; Emacs Lisp Package Archive
(require 'package)
(setq package-archives
      '(
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; common lisp
(require 'cl)
(defvar melpa-include-packages '(
								 magit
								 company
								 ;;keycast
								 vertico
								 orderless
								 marginalia
								 embark
								 consult
								 hungry-delete
								 ;;smartparens
								 rust-mode
								 ;;eglot
								 ;;lsp-mode
								 pyim
								 ;;pyim-basedict
								 posframe
								 markdown-mode
								 yasnippet
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
