;;; module/exwm/exwm-hooks.el -*- lexical-binding: t; -*-

(defun exwm-update-title ()
  (pcase exwm-class-name
     ("zoom" (exwm-workspace-rename-buffer (format "Zoom: %s" exwm-title)))
     ("Firefox"   (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title)))
     ("vivaldi"   (exwm-workspace-rename-buffer (format "Vivaldi: %s" exwm-title)))
     ("Zathura"   (exwm-workspace-rename-buffer (format "Zathura: %s" exwm-title)))
     ("Alacritty" (exwm-workspace-rename-buffer (format "Alacritty: %s" exwm-title)))
     ("Brave-browser"     (exwm-workspace-rename-buffer (format "Brave: %s" exwm-title)))
     ("VSCodium"     (exwm-workspace-rename-buffer (format "Codium: %s" exwm-title)))
     (".virt-manager-wrapped"     (exwm-workspace-rename-buffer (format "Virt-Manager: %s" exwm-title)))
))

(defun configure-window-by-class ()
  (interactive)
  (pcase exwm-class-name

    ("Alacritty"
     (exwm-floating-toggle-floating)
     (exwm-layout-hide-mode-line))

    ("zoom"
     (exwm-floating-toggle-floating)
     (exwm-layout-hide-mode-line))

    ("mpv"
     (exwm-floating-toggle-floating)
     (exwm-layout-toggle-mode-line))
    ))

(defun configure-window-by-name ()
  (interactive)
  (pcase exwm-title
    ("Picture-in-Picture" (exwm-layout-hide-mode-line))
    ))

(add-hook 'exwm-manage-finish-hook #'exwm-update-title)
(add-hook 'exwm-manage-finish-hook #'configure-window-by-name)
(add-hook 'exwm-manage-finish-hook #'configure-window-by-class)


(provide 'exwm-hooks)
