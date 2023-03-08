;;; ../../../etc/nixos/codex/home/.doom.d/module/themes/fonts.el -*- lexical-binding: t; -*-

;; Set fonts
(setq doom-font (font-spec :family "Iosevka SemiBold" :size 14)
      doom-variable-pitch-font (font-spec :family "Iosevka SemiBold" :size 14 )
      doom-big-font (font-spec :family "Iosevka SemiBold" :size 24))

(custom-set-faces
 '(mode-line ((t (:family "Iosevka SemiBold" :height 1.0 ))))
 '(mode-line-inactive ((t (:family "Iosevka SemiBold" :height 1.0)))))

(custom-set-faces!
  '(font-lock-comment-face :slant italic) ;; foreground "#909090"
  '(font-lock-keyword-face :slant italic))

(provide 'fonts)
