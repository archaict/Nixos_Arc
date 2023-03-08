;;; module/exwm/exwm-edwina.el -*- lexical-binding: t; -*-
(use-package! edwina
  :config
  (setq! display-buffer-base-action '(display-buffer-below-selected))

  (defun edwina--init ()
    (print! "Simplified Edwina init")
    (message "Simplified Edwina init")
    (unless (assoc 'edwina-mode mode-line-misc-info)
      (push '(edwina-mode (:eval (edwina-mode-line-indicator)))
            (cdr (last mode-line-misc-info))))
    (edwina-arrange))

  (defun doom-popup-filter (in-buffer)
    (with-current-buffer in-buffer
      (progn
        (message "[EDWINA] checking buffer t[%s] ib[%s] pun[%s] pub[%s] pu[%s] cb[%s] pm[%s]" (type-of in-buffer) in-buffer (+popup-buffer-p (buffer-name in-buffer)) (+popup-buffer-p in-buffer) (+popup-buffer-p) (current-buffer) +popup-mode)
        (if (or (+popup-buffer-p)
                (cond
                 (( string-match-p "popup" (buffer-name in-buffer)) t)
                 (( string-match-p "Password-Store" (buffer-name in-buffer)) t)
                 (( string-match-p "*transient*" (buffer-name in-buffer)) t)
                 (( string-match-p "*vterm*" (buffer-name in-buffer)) t)
                 (( string-match-p "*doom:vterm-popup:main*" (buffer-name in-buffer)) t)
                 (( string-match-p "magit" (buffer-name in-buffer)) t)
                 (t nil)))
            (progn
              (message "Filter %s" (buffer-name in-buffer)) t)
          (progn
            (message "No Filter %s" (buffer-name in-buffer)) nil)))))
  (setq! edwina-buffer-filter #'doom-popup-filter)

  (map! :leader
        (:prefix ("e" . "Edwina")
         :desc "Toggle Edwina" "e"  #'edwina-mode
         :desc "Arrange" "r"        #'edwina-arrange
         :desc "Next Window" "j"    #'edwina-select-next-window
         :desc "Prev Window" "k"    #'edwina-select-previous-window
         :desc "Swap Next" "L"      #'edwina-swap-next-window
         :desc "Swap Prev" "H"      #'edwina-swap-previous-window
         :desc "Dec MFact" "-"      #'edwina-dec-mfact
         :desc "Inc MFact" "="      #'edwina-inc-mfact
         :desc "Dec Master" "_"     #'edwina-dec-nmaster
         :desc "Inc Master" "+"     #'edwina-inc-nmaster
         :desc "Del Window" "d"     #'edwina-delete-window
         :desc "Zoom on Window" "z" #'edwina-zoom
         ))
  (edwina-mode 1))
