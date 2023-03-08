;;; ../../../etc/nixos/codex/home/.doom.d/module/lang/snippets.el -*- lexical-binding: t; -*-

;; Snippet
(yas-global-mode 1)
(add-hook 'yas-minor-mode-hook(lambda () (yas-activate-extra-mode 'fundamental-mode)))

(provide 'snippets)
