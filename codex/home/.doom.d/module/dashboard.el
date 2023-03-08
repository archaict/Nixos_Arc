;;; module/dashboard.el -*- lexical-binding: t; -*-

(setq dashboard-center-content t)
(when (file-exists-p "~/Pictures/Nerv.png")
 (setq +doom-dashboard-banner-padding '(2 . 2)
       +doom-dashboard-banner-file "Nerv.png"
       +doom-dashboard-banner-dir "~/Pictures/"))

;; (setq initial-buffer-choice (lambda() (get-buffer-create "*dashboard*)")))

(provide 'dashboard)
