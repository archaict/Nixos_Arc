;;; ../../../etc/nixos/codex/home/.doom.d/module/exwm/exwm-floating-helm.el -*- lexical-binding: t; -*-

(defun my-helm-display-frame-center (buffer &optional resume)
  "Display `helm-buffer' in a separate frame which centered in
parent frame."
  (if (not (display-graphic-p))
      ;; Fallback to default when frames are not usable.
      (helm-default-display-buffer buffer)
    (setq helm--buffer-in-new-frame-p t)
    (let* ((parent (selected-frame))
           (frame-pos (frame-position parent))
           (parent-left (car frame-pos))
           (parent-top (cdr frame-pos))
           (width (/ (frame-width parent) 2))
           (height (/ (frame-height parent) 3))
           tab-bar-mode
           (default-frame-alist
             (if resume
                 (buffer-local-value 'helm--last-frame-parameters
                                     (get-buffer buffer))
               `((parent . ,parent)
                 (width . ,width)
                 (height . ,height)
                 (undecorated . ,helm-use-undecorated-frame-option)
                 (left-fringe . 0)
                 (right-fringe . 0)
                 (tool-bar-lines . 0)
                 (line-spacing . 0)
                 (desktop-dont-save . t)
                 (no-special-glyphs . t)
                 (inhibit-double-buffering . t)
                 (tool-bar-lines . 0)
                 (left . ,(+ parent-left (/ (* (frame-char-width parent) (frame-width parent)) 4)))
                 (top . ,(+ parent-top (/ (* (frame-char-width parent) (frame-height parent)) 6)))
                 (title . "Helm")
                 (vertical-scroll-bars . nil)
                 (menu-bar-lines . 0)
                 (fullscreen . nil)
                 (visible . ,(null helm-display-buffer-reuse-frame))
                 ;; (internal-border-width . ,(if IS-MAC 1 0))
                )))
           display-buffer-alist)
      (set-face-background 'internal-border (face-foreground 'default))
      (helm-display-buffer-popup-frame buffer default-frame-alist))
    (helm-log-run-hook 'helm-window-configuration-hook)))

(setq helm-display-function 'my-helm-display-frame-center)

(provide 'exwm-floating-helm)
