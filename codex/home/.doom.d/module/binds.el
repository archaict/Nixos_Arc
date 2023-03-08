;;; module/binds.el -*- lexical-binding: t; -*-

(global-set-key (kbd "C-S-v") #'clipboard-yank)
(global-set-key (kbd "C-S-c") #'clipboard-kill-ring-save)

;; C-c to exit process vterm
(map! :after vterm
      :map vterm-mode-map
      :ni "M-w" #'+vterm/toggle
      :ni "M-;" #'+vterm/toggle
      :ni "C-e" #'+vterm/toggle
      :ni "C-c" #'vterm-send-C-c
      :ni "s-c" #'vterm-send-C-c
      :i  "<escape>" #'vterm-send-escape
      :i  "C--" #'text-scale-decrease
      :i  "C-=" #'text-scale-increase
      :ni "s-q" #'vterm-send-C-c)

(map! :leader
      :desc "Buffer Next"                       "j j"   #'next-buffer
      :desc "Buffer Prev"                       "k k"   #'previous-buffer
      :desc "Tangle current file"               "c t"   #'org-babel-tangle
      :desc "Tangle current file"               "t t"   #'org-babel-tangle
      :desc "Dired"                             "d d"   #'dired-jump
      :desc "Find Files"                        "f f"   #'counsel-find-file
      :desc "Find Wallpaper"                    "f w"   #'counsel-find-file
      :desc "Find Files"                        "."     #'counsel-find-file
      :desc "Toggle Fundamental mode"           "t m"   #'fundamental-mode
      )

(map! :leader
      :desc "Soundpeats On"  "t s n" (lambda () (interactive) (start-process-shell-command "soundpeats-on" nil "soundpeats-connect && notify-send Soundpeats Connected"))
      :desc "Soundpeats Off" "t s f" (lambda () (interactive) (start-process-shell-command "soundpeats-off" nil "soundpeats-disconnect && notify-send Soundpeats Disconnected"))
      :desc "Sayonara"       "Q Q Q" (lambda () (interactive) (start-process-shell-command "soundpeats-off" nil "sayonara ; notify-send 'SAYONARA!'"))
      :desc "Daijoubu"       "Q Q R" (lambda () (interactive) (start-process-shell-command "soundpeats-off" nil "reboot ; notify-send 'SAYONARA!'"))
      :desc "Picom On"       "t p" (lambda () (interactive) (start-process-shell-command "picom-on" nil "picom"))
      :desc "Picom Off"      "t P" (lambda () (interactive) (start-process-shell-command "picom-off" nil "pkill -9 picom"))
      )


(map! :leader
      :desc "Firefox"  "o i" (lambda () (interactive) (start-process-shell-command "Firefox" nil "firefox"))
      :desc "Virt-Manager"  "o v" (lambda () (interactive) (start-process-shell-command "Virt-Manager" nil "virt-manager"))
      )

(map! :leader
      :desc "Org Alert Enable"  "o a e" #'org-alert-enable
      :desc "Org Alert Check"   "o a c" #'org-alert-check
      :desc "Org Alert Disable" "o a d" #'org-alert-disable

      :desc "Org Tree Slide"      "o s s" #'org-tree-slide-mode
      :desc "Org Tree Slide Next" "o s j" #'org-tree-slide-move-next-tree
      :desc "Org Tree Slide Prev" "o s k" #'org-tree-slide-move-previous-tree
      )

(map! :leader
      :desc "Delete Other Windows"  "w o" #'delete-other-windows
      )

(map! :leader
      (:prefix-map ("T" . "Text")

       :desc "Figlet Border" "f b" #'figlet-border
       :desc "Figlet Future" "f f" #'figlet-future
       :desc "Figlet Pagga"  "f p" #'figlet-pagga
       :desc "Figlet Small"  "f s" #'figlet-small
       :desc "Figlet Future Border" "f F" #'figlet-future-border

       :desc "List - Lorem Ipsum" "l" #'lorem-ipsum-insert-list
       :desc "Sentences - Lorem Ipsum" "s" #'lorem-ipsum-insert-sentences
       :desc "Paragraphs - Lorem Ipsum" "p" #'lorem-ipsum-insert-paragraphs))

(map! (:after dired
       :map dired-mode-map
       :n "H" #'dired-up-directory
       :n "L" #'dired-find-file
       :n "<backspace>" #'dired-up-directory
       ))

;; Lang
(map! :localleader
      :map java-mode-map
      :desc "Maven Compile" :n "c" #'mvn-compile)

(map! :localleader
      :map js-mode-map
      :desc "Import-js" "m i" #'import-js-fix
      :desc "Prettify"  "m p" #'lsp-eslint-apply-all-fixes
      )

(provide 'binds)
