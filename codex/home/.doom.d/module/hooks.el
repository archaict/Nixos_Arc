;;; module/hooks.el -*- lexical-binding: t; -*-

(add-hook 'after-init-hook 'display-time-mode)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'after-init-hook(lambda ()(setq indent-tabs-mode nil)))
(add-hook 'after-init-hook(lambda ()(setq tab-width 2)))
(add-hook 'after-init-hook(lambda ()(setq evil-shift-width 2)))

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'pdf-view-mode-hook
          (lambda ()
            (set (make-local-variable 'evil-normal-state-cursor) (list nil))
            (internal-show-cursor nil nil)))

(provide 'hooks)
