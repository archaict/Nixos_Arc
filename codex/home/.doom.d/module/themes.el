;;; module/themes.el -*- lexical-binding: t; -*-
(add-to-list 'load-path "~/.doom.d/module/themes")

(kill-buffer "*scratch*")
(kill-buffer "*Messages*")

;; Doom themes
;; (setq doom-theme 'ewal-doom-one)
(setq doom-theme 'doom-tokyo-night)

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(setq initial-scratch-message "")

(ewal-load-color 'magenta +4)

(setq-default message-log-max nil)
(setq inhibit-startup-buffer-menu t)

;; Set margin
(setq-default left-margin-width 0 right-margin-width 0)
;; (set-window-buffer nil (current-buffer))

;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha '(96 . 96))
(add-to-list 'default-frame-alist '(alpha . (96 . 96)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq tab-width 2)
(setq-default indent-tabs-mode nil)

(require 'fonts)
(require 'header)

(provide 'themes)
