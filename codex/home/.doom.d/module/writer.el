;;; module/writer.el -*- lexical-binding: t; -*-

;; Figlet
(defun figlet-border (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f term -F border" (current-buffer) t))

(defun figlet-future (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f future" (current-buffer) t))

(defun figlet-future-border (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f future -F border" (current-buffer) t))

(defun figlet-pagga (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f pagga -F border" (current-buffer) t))

(defun figlet-small (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "figlet -f small" (current-buffer) t))

(setq figlet-default-font "Future")

;; Pagga Figlet
;; ┌─────────────────────────────┐
;; │░█▀█░█▀▄░█▀▀░█▀█░█▀▄░▀█▀░█▀█░│
;; │░█▀█░█▀▄░█░░░█▀█░█░█░░█░░█▀█░│
;; │░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░│
;; └─────────────────────────────┘

(provide 'writer)
