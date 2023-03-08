;;; module/dockerfile.el -*- lexical-binding: t; -*-
(add-to-list 'load-path "~/.doom.d/packages/dockerfile-mode")
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(require 'dockerfile-mode)
(provide 'dockerfile)
