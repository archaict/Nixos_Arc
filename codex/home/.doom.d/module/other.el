;;; module/other.el -*- lexical-binding: t; -*-
;; (beacon-mode 1)

;; (add-to-list 'load-path "~/.doom.d/packages/enime")
;; (require 'enime)

;; (add-to-list 'company-backends 'company-nixos-options)

(setq bookmark-default-file "~/.doom.d/bookmark")

(setq vterm-tramp-shells '(( "ssh" "bash" )))

;; Will only work on macos/linux
(after! counsel
  (setq counsel-rg-base-command "rg -M 240 --with-filename --no-heading --line-number --color never %s || true"))

(provide 'other)
