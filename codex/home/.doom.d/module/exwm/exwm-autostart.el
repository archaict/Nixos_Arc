;;; module/exwm/exwm-autostart.el -*- lexical-binding: t; -*-

;; (defun arca/run-in-background (command)
;;   (let ((command-parts (split-string command "[ ]+")))
;;     (apply #'call-process '(,(car command-parts) nil 0 nil ,@(cdr command-parts)))))

;; (start-process-shell-command "applet" nil  "flameshot")
;; (start-process-shell-command "applet" nil  "nm-applet")
;; (start-process-shell-command "applet" nil  "pa-applet")


;; (start-process-shell-command "dns" nil  "dunst")
;; (start-process-shell-command "sup" nil  "setxkbmap -option caps:super")
;; (start-process-shell-command "xse" nil  "xset b off")
;; (start-process-shell-command "xrt" nil  "xset r rate 200")
;; (start-process-shell-command "xof" nil  "xset s off -dpms")
;; (start-process-shell-command "unc" nil  "unclutter")
;; (start-process-shell-command "unc" nil  "fusuma -c ~/.config/fusuma/config.yaml")
;; (start-process-shell-command "clp" nil  "xclip")

;; (start-process-shell-command "lgt" nil  "light -I")
;; (start-process-shell-command "xin" nil  "xinput_fix")
;; (start-process-shell-command "feh" nil  "~/.fehbg")
;; (start-process-shell-command "pcm" nil  "sleep 5 && picom")

(provide 'exwm-autostart)
