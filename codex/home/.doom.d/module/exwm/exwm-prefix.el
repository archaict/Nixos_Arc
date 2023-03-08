;;; module/exwm/exwm-prefix.el -*- lexical-binding: t; -*-

(setq exwm-input-prefix-keys
      '(?\C-u
        ;; ?\C-x
        ?\s-;

        s-SPC
        s-<left>
        s-<right>
        s-<up>
        s-<down>
        ?\C-h
        ?\M-x
        ?\M-`
        ?\M-&
        ?\M-:

        s-q
        s-w
        s-e
        s-r
        s-t
        s-y
        s-u
        s-i
        s-o
        s-p
        s-a
        s-s
        s-d
        s-f
        s-g
        s-h
        s-j
        s-k
        s-l
        s-z
        s-x
        s-c
        s-v
        s-b
        s-n
        s-m

        s-Q
        s-W
        s-E
        s-R
        s-T
        s-Y
        s-U
        s-I
        s-O
        s-P
        s-A
        s-S
        s-D
        s-F
        s-G
        s-H
        s-J
        s-K
        s-L
        s-Z
        s-X
        s-C
        s-V
        s-B
        s-N
        s-M

        ?\C-\M-j  ;; Buffer list
        ?\C-\ ))  ;; Ctrl+Space


;; (delete ?\C-x exwm-input-prefix-keys)
;; (delete ?\C-c exwm-input-prefix-keys)
;; (delete ?\C-v exwm-input-prefix-keys)

(push ?\C-g exwm-input-prefix-keys)

(define-key exwm-mode-map (kbd "C-c") nil)
(define-key exwm-mode-map (kbd "C-x") nil)
(define-key exwm-mode-map (kbd "C-v") nil)

(provide 'exwm-prefix)
