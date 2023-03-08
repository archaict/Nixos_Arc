;; Major Mode
;; (package! command-log-mode)
;; (package! vimrc-mode)

;; Bindings
;; (package! evil-swap-keys)

;; Text
;; (package! lorem-ipsum)
(package! org-bullets)
(package! org-alert)
(package! org-tree-slide)
(package! org-roam-ui)

(package! ewal)
(package! ewal-evil-cursors)
(package! ewal-doom-themes)

;; ENIME
(package! mpv)
(package! esxml)
(package! s)
(package! transient)
(package! dash)
(package! request)

;; Xclip
(package! xclip)

;; Music
(package! vuiet)
(package! emms)
(package! pass)

;; Virtualisation
;; (package! helm-lxc)

;; (package! figlet)

;; Presentation
;; (package! ox-reveal)
;; (package! ox-pandoc)

;; Lang
(package! mvn)

;; EXWM
(package! exwm)
(package! exwm-mff)
(package! edwina)
(package! doom-themes)
(package! evil-better-visual-line)
(package! mode-line-stats)
;; (package! mini-modeline)

;; Other
;; (package! weechat)
(package! google-this)
(package! fzf)
(package! beacon)
(package! zoxide)


;; CSS
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! prettier-eslint-emacs :recipe (:host github :repo "evindor/prettier-eslint-emacs"))
;; (package! js-imports :recipe (:host github :repo "KarimAziev/js-imports"))
(package! import-js)

;; Database dbdiagram.io
;; (package! exwm-firefox-core)
;; (package! exwm-firefox-evil)

(package! projectile-laravel :recipe(:host github :repo "strikerlulu/projectile-laravel"))

(provide 'packages)
