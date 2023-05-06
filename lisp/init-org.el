(require 'org-tempo)  ;开启easy template

;; 禁用左尖括号
;;(setq electric-pair-inhibit-predicate
;;      '(lambda (c)
;;	 (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))

;;(add-hook 'org-mode-hook
;;	  (lambda ()
;;	    (setq-local electric-pair-inhibit-predicate
;;			'(lambda (c)
;;			   (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
			  (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))

;; C-c C-s schedule
;; C-c C-d deadline
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("~/gtd.org"))
(setq org-agenda-span 'day)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/gtd.org" "Workspace")
		 "* TODO [#B] %?\n  %i\n %U"
		 :empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)

(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

(provide 'init-org)
