;;; ../../../etc/nixos/codex/home/.doom.d/module/themes/header.el -*- lexical-binding: t; -*-

;; Add Header
(setq-default header-line-format " ")
(custom-set-faces '(header-line   ((t (:inherit mode-line)))))
(set-face-attribute 'header-line nil  :height 100)

(provide 'header)
