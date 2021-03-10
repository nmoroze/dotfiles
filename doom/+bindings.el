;;; ~/dotfiles/doom/+bindings.el -*- lexical-binding: t; -*-

(map! :leader
      :desc "M-x" "SPC" #'counsel-M-x)

;; Spacemacs-style window bindings
(map! :map evil-window-map
      "-" #'evil-window-split
      "/" #'evil-window-vsplit)
(map! :leader
      :desc "Horizontal split" "W -" #'evil-window-split)
(map! :leader
      :desc "Select window 0 or 10" "0" #'winum-select-window-0-or-10)
(map! :leader
      :desc "Select window 1" "1" #'winum-select-window-1)
(map! :leader
      :desc "Select window 2" "2" #'winum-select-window-2)
(map! :leader
      :desc "Select window 3" "3" #'winum-select-window-3)
(map! :leader
      :desc "Select window 4" "4" #'winum-select-window-4)
(map! :leader
      :desc "Select window 5" "5" #'winum-select-window-5)
(map! :leader
      :desc "Select window 6" "6" #'winum-select-window-6)
(map! :leader
      :desc "Select window 7" "7" #'winum-select-window-7)
(map! :leader
      :desc "Select window 8" "8" #'winum-select-window-8)
(map! :leader
      :desc "Select window 9" "9" #'winum-select-window-9)
