(add-to-list 'load-path "~/.doom.d/module")
(add-to-list 'load-path "~/.doom.d/module/lang")
;; (add-to-list 'load-path "~/.doom.d/module/exwm")
(add-to-list 'load-path "~/.doom.d/packages")
(add-to-list 'load-path "~/.doom.d/packages/mu4e-dashboard")

(require 'arc-functions)

;; EXWM
;; (require 'exwm-home)
;; (require 'exwm-autostart)
;; (require 'exwm-prefix)
;; (require 'exwm-binds)
;; (require 'exwm-binds-wm)
;; (require 'exwm-hooks)
;; (require 'edwina)

;; (exwm-enable)

;; Others
(load! "./module/dashboard")
(load! "./module/env")
(load! "./module/modeline")
(load! "./module/orgmode")
;; (require 'mails)
;; (require 'mu4e-dashboard)
;;
(require 'ssh)
;;
;; (require 'writer)
;; (require 'dockerfile)
(require 'hooks)
(require 'other)
(require 'music)
;; (require 'fuzzy)
;; (require 'network)
;;
;; Language
(require 'lsp)
;; (require 'dart)

(require 'binds)
(require 'evil)

(setq initial-major-mode 'org-mode)
(setq doom-scratch-initial-major-mode 'org-mode)

(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "J") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "K") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "J") 'evil-join)
  )

(setq-default custom-file (expand-file-name ".custom.el" doom-private-dir))
(when (file-exists-p custom-file)
  (load custom-file))

(setq-default tab-width 2)

(require 'themes)
(provide 'config)
