;;; module/exwm/exwm-binds.el -*- lexical-binding: t; -*-

(setq exwm-manage-configurations
      '(((equal exwm-class-name "Firefox")
         simulation-keys (([?\C-q] . [?\C-w])
                          ([?\C-y] . [?\C-c])
                          ([?\C-p] . [?\C-v])
                          ([?\C-d] . [?\C-x])))))

(exwm-input-set-key (kbd "s-\\") (lambda () (interactive) (arc/run-in-vterm-toggle "wls-em ; exit")))

(exwm-input-set-key (kbd "<XF86AudioLowerVolume>")  (lambda () (interactive) (shell-command "amixer set Master 5%-")))
(exwm-input-set-key (kbd "<XF86AudioRaiseVolume>")  (lambda () (interactive) (shell-command "amixer set Master 5%+")))
(exwm-input-set-key (kbd "<XF86AudioMute>")         (lambda () (interactive) (shell-command "amixer set Master 1+ toggle")))
(exwm-input-set-key (kbd "<XF86MonBrightnessDown>") (lambda () (interactive) (shell-command "light -U 5; light")))
(exwm-input-set-key (kbd "<XF86MonBrightnessUp>")   (lambda () (interactive) (shell-command "light -A 5; light")))

(exwm-input-set-key (kbd "s--") (lambda () (interactive) (call-process-shell-command "amixer set Master 5%-")))
(exwm-input-set-key (kbd "s-=") (lambda () (interactive) (call-process-shell-command "amixer set Master 5%+")))
(exwm-input-set-key (kbd "s-0") (lambda () (interactive) (call-process-shell-command "amixer set Master 1+ toggle && notify-send Toggle Mute")))
(exwm-input-set-key (kbd "s-0") (lambda () (interactive) (call-process-shell-command "amixer set Master 1+ toggle && notify-send Toggle Mute")))

(exwm-input-set-key (kbd "s-[") (lambda () (interactive) (shell-command "light -U 5; light")))
(exwm-input-set-key (kbd "s-]") (lambda () (interactive) (shell-command "light -A 5; light")))

(exwm-input-set-key (kbd "s-.") (lambda () (interactive) (vuiet-next)))
(exwm-input-set-key (kbd "s-,") (lambda () (interactive) (vuiet-previous)))

(exwm-input-set-key (kbd "s-r") (lambda () (interactive) (load-theme 'ewal-doom-one)))

;; (exwm-input-set-key (kbd "s-i") (lambda () (interactive) (start-process-shell-command "Firefox" nil "firefox")))
(exwm-input-set-key (kbd "s-i") (lambda () (interactive) (start-process-shell-command "Vivaldi" nil "vivaldi --disable-renderer-accessibility")))
(exwm-input-set-key (kbd "s-c") (lambda () (interactive) (start-process-shell-command "Codium" nil "codium")))
(exwm-input-set-key (kbd "<print>") (lambda () (interactive) (shell-command "flameshot gui")))

(exwm-input-set-key (kbd "s-z") (lambda () (interactive) (enime-main-transient)))

(exwm-input-set-key (kbd "<s-backspace>") (lambda () (interactive) (call-process-shell-command "bkbd")))

;; sudo nixos-rebuild -v switch --flake /etc/nixos --option use-binary-cache false --option build-use-subtitutes false

;; ;; Line Message Notify > Group
;; (defun line-notify()
;;   "Send Line Notification"
;;   (interactive)
;;   (shell-command-to-string (format "line-notify %s" (read-string "LINE Message: " ))))

;; (exwm-input-set-key (kbd "s-e") (lambda () (interactive) (line-notify)))

;; (exwm-input-set-key (kbd "s-i") (lambda (command) (interactive (list (read-shell-command "$ "))) (start-process-shell-command command nil command)))

(provide 'exwm-binds)
