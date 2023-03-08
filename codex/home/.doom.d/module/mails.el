;;; ../../../etc/nixos/codex/home/.doom.d/module/mails.el -*- lexical-binding: t; -*-

;; mu4e
;; Install isync << nixos already installed
;; app password gmail
;; run code below
;; $ bash /etc/nixos/dotfiles
;; $ mu init --maildir=~/Mail --my-address=yourmail@gmail.com

(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)

(add-to-list 'load-path "/run/current-system/sw/share/emacs/site-lisp/mu4e")
(setq mu4e-change-filenames-when-moving t)
(setq mu4e-update-interval (* 10 60))
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-maildir "~/Mail")

(setq mu4e-drafts-folder "/[Gmail]/Drafts")
(setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
(setq mu4e-refile-folder "/[Gmail]/All Mail")
(setq mu4e-trash-folder  "/[Gmail]/Trash")

(setq mu4e-maildir-shortcuts
    '(("/Inbox"             . ?i)
      ("/[Gmail]/Sent Mail" . ?s)
      ("/[Gmail]/Trash"     . ?t)
      ("/[Gmail]/Drafts"    . ?d)
      ("/[Gmail]/All Mail"  . ?a)))

(setq mu4e-change-filenames-when-moving t)

(setq mu4e-alert-interesting-mail-query
      (concat
       "flag:unread"
       " AND NOT flag:trashed"
       " AND NOT maildir:"
       "\"/[Gmail].All Mail\""))

(provide 'mails)
