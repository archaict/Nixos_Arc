;;; module/org.el -*- lexical-binding: t; -*-

; (setq org-ellipsis " ")
; ;; (setq org-export-preserve-breaks t)
; (setq org-hide-emphasis-markers t)
; (setq org-hide-leading-stars t)
; (setq org-hidden-keywords '(title subtitle))

; (custom-set-faces!
;   '(org-document-title :height 2.0   ) ;; :foreground "#8B8B8B" )
;   '(org-document-info  :height 1.0   ) ;; :foreground "#8B8B8B" )
;   '(org-block                        ) ;; :background "#222222" )
;   '(org-org-block-begin-line         ) ;; :background "#222222" )
;   '(org-org-block-end-line           ) ;; :background "#222222" )
;   '(org-link           :italic nil        :height 1.0  :foreground "#FABD2F" :underline nil)
;   '(org-level-1        :weight extra-bold :height 1.00 )  ;;foreground "#eaeaea" )
;   '(org-level-2        :weight bold       :height 1.00 )  ;;foreground "#dddddd" )
;   '(org-level-3        :weight bold       :height 1.00 )  ;;foreground "#cccccc" )
;   '(org-level-4        :weight bold       :height 1.00 )  ;;foreground "#bbbbbb" )
;   '(org-level-5        :weight bold       :height 1.00 )) ;;foreground "#aaaaaa" ))

; (lambda () (progn
;              (setq left-margin-width 8)
;              (setq right-margin-width 8)
;              (set-window-buffer nil (current-buffer))))

; (global-prettify-symbols-mode t)

; (setq org-bullets-bullet-list '("※" "※" "※" "※" "※" "※"))

; (defun trigger-org-company-complete ()
;   (interactive)
;   (if (string-equal "#" (string (preceding-char)))
;       (progn
;         (insert "+")
;         (company-complete))
;     (insert "+")))
; ;; (defun trigger-org-company-complete () (interactive)
; ;;        (if (string-equa(setq org-hide-emphasis-markers t))))

; ;; (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

; ;; (setq deft-directory "~/vault"
; ;;       deft-extensions '("org")
; ;;       deft-recursive t)


; (require 'org-inlinetask)


; ;; (setq org-roam-index-file "~/vault/roam/notebook.org")
; (custom-set-variables
;  '(org-directory "~/vault/roam")
;  '(org-agenda-files (list org-directory)))

; ;; (setq org-roam-directory "~/vault/roam")
; ;; (setq org-agenda-files (directory-files-recursively "~/vault/roam/Agenda" "\\.org$"))

; (setq hl-todo-keyword-faces
;       '(("HOLD"   . "#D3869B")
;         ("TITLE"  . "#B8BB26")
;         ("LYFE"   . "#B8BB26")
;         ("MEET"   . "#B8BB26")
;         ("TODO"   . "#FABD2F")
;         ("FILE"   . "#FABD2F")
;         ("LINK"   . "#5E81AC")
;         ("NOTE"   . "#B8BB26")
;         ("DONE"   . "#808080")
;         ("HACK"   . "#FE8019")
;         ("TEACH"  . "#7B2B5E")
;         ("UNIV"   . "#FE8019")
;         ("ASSIGN" . "#FB4934")
;         ("FIXME"  . "#FB4934")
;         ("WARNING"   . "#FB4934")))

; ;; (setq org-pandoc-options '((standalone . _)))
; ;; (setq org-pandoc-options-for-docx '((standalone . nil)))
; ;; (setq org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))

; ;; Org Mode
; (add-hook 'org-mode-hook (lambda () (hl-todo-mode 1)))
; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
; (add-hook 'org-mode-hook ;; Prettify Symbols
;           (lambda ()
;             (push '("#+begin_src" . "λ") prettify-symbols-alist)
;             (push '("#+end_src" . "λ") prettify-symbols-alist)))
; (add-hook 'org-mode-hook
;           '(lambda ()
;              (add-hook 'write-contents-functions
;                        'delete-trailing-whitespace)))

; (global-hl-todo-mode t)
; (global-hl-todo-mode 1)
; (global-hi-lock-mode 1)

; (require 'org-alert)
; (setq alert-default-style 'libnotify)
; (setq org-alert-notification-title "ORG REMINDER")

; (provide 'orgmode)
