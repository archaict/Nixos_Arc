;;; ../../../etc/nixos/codex/home/.doom.d/module/music.el -*- lexical-binding: t; -*-

(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/vault/Music")

(map!   :leader
        :desc "Emms Browser"             "M b"   #'emms-browser
        :desc "Music Next"               "M n"   #'emms-next
        :desc "Music Previous"           "M p"   #'emms-previous
        :desc "Music Stop"               "M x"   #'emms-stop
        :desc "Music Add Directory Tree" "M t"   #'emms-add-directory-tree

        :desc "Vuiet Next"               "M v n"   #'vuiet-next
        :desc "Vuiet Previous"           "M v p"   #'vuiet-previous
        :desc "Vuiet Stop"               "M v s"   #'vuiet-play-artist
        :desc "Vuiet Stop"               "M v x"   #'vuiet-stop
        )

(evil-collection-define-key 'normal 'emms-browser-mode-map
  (kbd "RET") 'emms-browser-add-tracks-and-play
  "q" 'kill-this-buffer
  )

;; EXWM BINDINGS
;; emms
;; (exwm-input-set-key (kbd "s-.") (lambda () (interactive) (emms-next)))
;; (exwm-input-set-key (kbd "s-,") (lambda () (interactive) (emms-previous)))

;; vuiet
(exwm-input-set-key (kbd "s-.") (lambda () (interactive) (vuiet-next)))
(exwm-input-set-key (kbd "s-,") (lambda () (interactive) (vuiet-previous)))

;; VUIET
;; https://github.com/mihaiolteanu/lastfm.el
;; (lastfm-generate-session-key)

(provide 'music)
