;;; module/lang/lsp.el -*- lexical-binding: t; -*-

;; LSP UI
(lsp-ui-mode 1)
(add-hook 'java-mode-hook #'lsp)

(require 'tailwindcss)
(require 'laravel)
(require 'java)
(require 'snippets)

(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'prettier-eslint nil t)))
(add-hook 'react-mode-hook (lambda () (add-hook 'after-save-hook 'prettier-eslint nil t)))

(provide 'lsp)
