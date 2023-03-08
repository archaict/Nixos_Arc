;;; module/fuzzy.el -*- lexical-binding: t; -*-

;; (defun fzf-test ()
  ;; (interactive)
  ;; (let ((path (locate-dominating-file default-directory "/home/archaict/Pictures")))
  ;;   (if path
  ;;       (fzf-with-command "git ls-files" #'fzf/action-find-file path))))

(defun fzf-test ()
  (interactive "Wallpaper: ")
  (fzf-with-command "find" "/home/arihaict/Pictures")
)
(global-set-key (kbd "s-x") (lambda () (interactive) (fzf-test)))

;; feh --bg-fill (fd . ~/Pictures/ -e png -e jpg | fzf)
;; (exwm-input-set-key (kbd "s-x") (lambda () (interactive (start-process-shell-command "Wallpaper" nil "feh --bg-fill $(fd . ~/Pictures/ -e png -e jpg | fzf)"))))

;; Extras WM
;; (require 'exwm-mff)
;; (require 'exwm-firefox-core)
;; (require 'exwm-firefox-evil)
;; (dolist (k `(
;;          escape
;;          ))
;;   (cl-pushnew k exwm-input-prefix-keys))

(provide 'fuzzy)
