;;; module/exwm/exwm.el -*- lexical-binding: t; -*-

(require 'exwm)
(require 'exwm-randr)
(require 'exwm-config)
(require 'exwm-systemtray)

(exwm-randr-enable)
(exwm-systemtray-enable)


;; Wrap Mouse
(setq mouse-autoselect-window t
      focus-follows-mouse t)

(defconst exwm-workspace-names '("a" "s" "d" "o" "p" "6" "7" "8"))
(setq exwm-workspace-index-map (lambda (i) (nth i exwm-workspace-names)))
(dotimes (i 8)
  (exwm-input-set-key (kbd (format "s-%s" (nth i exwm-workspace-names)))
                      `(lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))

;; (start-process-shell-command "xrandr" nil "xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal")
(setq exwm-workspace-number 5)
(start-process-shell-command
 "xrandr" nil
 "xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 0x-1080 --rotate normal")
 ;; "xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-0 --mode 1920x1080 --pos 0x-1080 --rotate normal")
(setq exwm-randr-workspace-monitor-plist '(0 "eDP" 1 "eDP" 2 "eDP" 3 "DisplayPort-1" 4 "DisplayPort-1"))
;; (setq exwm-randr-workspace-monitor-plist '(0 "eDP" 1 "eDP" 2 "eDP" 3 "eDP" 4 "eDP"))

;; Automatically move EXWM buffer to current workspace when selected
(setq exwm-layout-show-all-buffers t)

;; Display all EXWM buffers in every workspace buffer list
(setq exwm-workspace-show-all-buffers t)

(add-to-list 'display-buffer-alist '("*Async Shell Command*" display-buffer-no-window (nil)))

(provide 'exwm-home)
