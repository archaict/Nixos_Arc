;;; ../../../etc/nixos/codex/home/.doom.d/module/lang/tailwindcss.el -*- lexical-binding: t; -*-

(setq lsp-tailwindcss-add-on-mode t)
(use-package lsp-tailwindcss)
(setq lsp-tailwindcss-major-modes '(svelte-mode php-mode html-mode sgml-mode mhtml-mode web-mode css-mode))
(setq lsp-file-watch-threshold 2000)

(provide 'tailwindcss)
