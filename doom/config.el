;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Monaco" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Disable smartparens
;; https://github.com/hlissner/doom-emacs/blob/develop/docs/faq.org#how-to-disable-smartparensautomatic-parentheses-completion
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Ignore default templates
(set-file-template! "/.gitignore" :ignore t)
(set-file-template! "\\.\py$" :ignore t) ; TODO: maybe use this if file is clearly entry point?

;; Don't open dired with find-file (https://emacs.stackexchange.com/a/33706)
;; ivy must be used in with-eval-after-load, not counsel, otherwise there's an
;; error due to alt being nil. If I try to wrap this with two with-eval-after-load,
;; this still doesn't work (unless the first one waits for ivy).
(with-eval-after-load 'ivy
  (let ((done (where-is-internal #'ivy-done     ivy-minibuffer-map t))
        (alt  (where-is-internal #'ivy-alt-done ivy-minibuffer-map t)))
    (if (and done alt)
        (let ()
         (define-key counsel-find-file-map done #'ivy-alt-done)
         (define-key counsel-find-file-map alt  #'ivy-done))
      (message "WARNING: error modifying find-file behavior"))))

(add-hook 'prog-mode-hook
          (lambda ()
            (auto-fill-mode 1)
            (setq comment-auto-fill-only-comments t)))
(add-hook 'text-mode-hook #'auto-fill-mode)

(setq +vc-gutter-in-remote-files 't)

(load! "+bindings.el")
(load! "+latex.el")
(load! "+org.el")
(load! "+private.el")
(load! "+verilog.el")
