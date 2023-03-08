;;; module/modeline.el -*- lexical-binding: t; -*-

(setq doom-modeline-icon t)
(setq doom-modeline-lsp t)
(setq doom-modeline-height 35)
(setq doom-modeline-modal-icon t)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-continuous-word-count-modes nil)

;; Display Battery & Time in Modeline
(display-time-mode 1)
(setq display-time-format "%Y-%m-%d | %R [%Z] ")
(display-battery-mode 1)

(provide 'modeline)
