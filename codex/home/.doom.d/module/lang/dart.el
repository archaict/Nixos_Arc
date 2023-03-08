;;; lang-dart.el -*- lexical-binding: t; -*-

;; Dart Server --------------------------------------------------------------
;; (setq dart-server-sdk-path "/Users/sashnortier/Desktop/Code/flutter/bin/cache/dart-sdk/")
(setq dart-server-enable-analysis-server t)
(add-hook 'dart-server-hook 'flycheck-mode)

(use-package lsp-mode
  :hook (dart-mode . lsp)
  :commands lsp)

(add-hook 'dart-mode-hook 'lsp)
(with-eval-after-load "projectile"
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))

(setq lsp-auto-guess-root t)

(use-package dart-mode
  ;; :ensure t
  :hook (dart-mode . (lambda ()
                       (add-hook 'after-save-hook #'flutter-run-or-hot-reload nil t)))
  :custom
  (dart-format-on-save t)
  (dart-sdk-path "/run/current-system/sw/bin/cache/dart-sdk"))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
         ("C-M-x" . #'flutter-run-or-hot-reload)))

;;(flutter-sdk-path "/Users/sashnortier/Desktop/Code/flutter/"))

(provide 'dart)
