;;; module/exwm/exwm-binds-wm.el -*- lexical-binding: t; -*-

(exwm-input-set-key (kbd "s-R") #'exwm-reset)
;; (exwm-input-set-key (kbd "s-;") #'counsel-M-x)
(exwm-input-set-key (kbd "C-S-p") #'counsel-M-x)
(exwm-input-set-key (kbd "s-c") #'exwm-input-send-next-key)
(exwm-input-set-key (kbd "s-q") #'kill-buffer-and-window)

(exwm-input-set-key (kbd "s-j") #'edwina-select-next-window)
(exwm-input-set-key (kbd "s-k") #'edwina-select-previous-window)
(exwm-input-set-key (kbd "s-J") #'edwina-swap-next-window)
(exwm-input-set-key (kbd "s-K") #'edwina-swap-previous-window)

(exwm-input-set-key (kbd "s-h") #'edwina-dec-mfact)
(exwm-input-set-key (kbd "s-l") #'edwina-inc-mfact)
(exwm-input-set-key (kbd "s-H") #'edwina-dec-nmaster)
(exwm-input-set-key (kbd "s-L") #'edwina-inc-nmaster)

;; (exwm-input-set-key (kbd "s-c") #'+eval/buffer-or-region)
(exwm-input-set-key (kbd "s-m") #'hide-mode-line-mode)

(exwm-input-set-key (kbd "s-w") #'+vterm/toggle)
(exwm-input-set-key (kbd "s-e") #'+vterm/toggle)

;; (exwm-input-set-key (kbd "<s-return>") #'+vterm/toggle)
(exwm-input-set-key (kbd "s-;") #'+vterm/toggle)

(defun exwm-move-window-to-workspace(workspace-number)
  (interactive)
  (let ((frame (exwm-workspace--workspace-from-frame-or-index workspace-number))
        (id (exwm--buffer->id (window-buffer))))
    (exwm-workspace-move-window frame id)))

(exwm-input-set-key (kbd "s-C-a") (lambda() (interactive) (exwm-move-window-to-workspace 0) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 0)))))
(exwm-input-set-key (kbd "s-C-s") (lambda() (interactive) (exwm-move-window-to-workspace 1) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 1)))))
(exwm-input-set-key (kbd "s-C-d") (lambda() (interactive) (exwm-move-window-to-workspace 2) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 2)))))
(exwm-input-set-key (kbd "s-C-o") (lambda() (interactive) (exwm-move-window-to-workspace 3) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 3)))))
(exwm-input-set-key (kbd "s-C-p") (lambda() (interactive) (exwm-move-window-to-workspace 4) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 4)))))

(exwm-input-set-key (kbd "<s-left>")  #'windmove-swap-states-left)
(exwm-input-set-key (kbd "<s-down>")  #'windmove-swap-states-down)
(exwm-input-set-key (kbd "<s-up>")    #'windmove-swap-states-up)
(exwm-input-set-key (kbd "<s-right>") #'windmove-swap-states-right)

(exwm-input-set-key (kbd "s-u") #'+doom-dashboard/open)
(exwm-input-set-key (kbd "s-v") #'evil-window-vsplit)
(exwm-input-set-key (kbd "s-f") #'exwm-layout-toggle-fullscreen)
(exwm-input-set-key (kbd "s-F") #'exwm-floating-toggle-floating)

(exwm-input-set-key (kbd "s-t") #'exwm-floating-hide)

(exwm-input-set-key (kbd "s-b") #'exwm-workspace-switch-to-buffer)
(exwm-input-set-key (kbd "s-'") #'exwm-workspace-switch-to-buffer)

(exwm-input-set-key (kbd "s-SPC") #'counsel-linux-app)

(exwm-input-set-key (kbd "M-R") #'exwm-reset)
;; (exwm-input-set-key (kbd "M-;") #'counsel-M-x)
(exwm-input-set-key (kbd "C-S-p") #'counsel-M-x)
(exwm-input-set-key (kbd "M-c") #'exwm-input-send-next-key)
(exwm-input-set-key (kbd "M-q") #'kill-buffer-and-window)

(exwm-input-set-key (kbd "M-j") #'edwina-select-next-window)
(exwm-input-set-key (kbd "M-k") #'edwina-select-previous-window)
(exwm-input-set-key (kbd "M-J") #'edwina-swap-next-window)
(exwm-input-set-key (kbd "M-K") #'edwina-swap-previous-window)

(exwm-input-set-key (kbd "M-h") #'edwina-dec-mfact)
(exwm-input-set-key (kbd "M-l") #'edwina-inc-mfact)
(exwm-input-set-key (kbd "M-H") #'edwina-dec-nmaster)
(exwm-input-set-key (kbd "M-L") #'edwina-inc-nmaster)

;; (exwm-input-set-key (kbd "M-c") #'+eval/buffer-or-region)
(exwm-input-set-key (kbd "M-m") #'hide-mode-line-mode)

(exwm-input-set-key (kbd "M-w") #'+vterm/toggle)
(exwm-input-set-key (kbd "M-e") #'+vterm/toggle)

;; (exwm-input-set-key (kbd "<s-return>") #'+vterm/toggle)
(exwm-input-set-key (kbd "M-;") #'+vterm/toggle)

(defun exwm-move-window-to-workspace(workspace-number)
  (interactive)
  (let ((frame (exwm-workspace--workspace-from-frame-or-index workspace-number))
        (id (exwm--buffer->id (window-buffer))))
    (exwm-workspace-move-window frame id)))

(exwm-input-set-key (kbd "M-C-a") (lambda() (interactive) (exwm-move-window-to-workspace 0) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 0)))))
(exwm-input-set-key (kbd "M-C-s") (lambda() (interactive) (exwm-move-window-to-workspace 1) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 1)))))
(exwm-input-set-key (kbd "M-C-d") (lambda() (interactive) (exwm-move-window-to-workspace 2) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 2)))))
(exwm-input-set-key (kbd "M-C-o") (lambda() (interactive) (exwm-move-window-to-workspace 3) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 3)))))
(exwm-input-set-key (kbd "M-C-p") (lambda() (interactive) (exwm-move-window-to-workspace 4) (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 4)))))

(exwm-input-set-key (kbd "<s-left>")  #'windmove-swap-states-left)
(exwm-input-set-key (kbd "<s-down>")  #'windmove-swap-states-down)
(exwm-input-set-key (kbd "<s-up>")    #'windmove-swap-states-up)
(exwm-input-set-key (kbd "<s-right>") #'windmove-swap-states-right)

(exwm-input-set-key (kbd "M-u") #'+doom-dashboard/open)
(exwm-input-set-key (kbd "M-v") #'evil-window-vsplit)
(exwm-input-set-key (kbd "M-f") #'exwm-layout-toggle-fullscreen)
(exwm-input-set-key (kbd "M-F") #'exwm-floating-toggle-floating)

(exwm-input-set-key (kbd "M-t") #'exwm-floating-hide)

(exwm-input-set-key (kbd "M-b") #'exwm-workspace-switch-to-buffer)
(exwm-input-set-key (kbd "M-'") #'exwm-workspace-switch-to-buffer)

(exwm-input-set-key (kbd "M-SPC") #'counsel-linux-app)

(provide 'exwm-binds-wm)
