;;; ../dotfiles/doom/+org.el -*- lexical-binding: t; -*-

(setq org-hide-emphasis-markers t)
(setq org-roam-directory "~/org/kb")

(setq org-blank-before-new-entry (quote ((heading . t)
                                         (plain-list-item . nil))))

(setq org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)

(add-hook! org-mode
  (org-autolist-mode))
