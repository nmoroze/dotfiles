;;; ../dotfiles/doom/+latex.el -*- lexical-binding: t; -*-

(defun latex/build ()
  (interactive)
  (progn
    (let ((TeX-save-query nil))
      (TeX-save-document (TeX-master-file)))
    (TeX-command "LatexMk" 'TeX-master-file -1)))

;; Spacemacs style build [b] and view [v] bindings on local leader

(map! :map LaTeX-mode-map
      :localleader
      :desc "Build document" "b" #'latex/build
      :desc "View document" "v" #'TeX-view)
