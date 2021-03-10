;;; ~/dotfiles/doom/+verilog.el -*- lexical-binding: t; -*-

(add-hook! verilog-mode
  (setq yas-indent-line 'fixed) ; otherwise indentation of port list close paren gets screwed up
  (setq verilog-auto-endcomments nil)
  (setq verilog-auto-lineup '())
  (setq verilog-auto-newline nil)
  (setq verilog-cexp-indent 2)
  (setq verilog-indent-level 2)
  (setq verilog-indent-level-behavioral 2)
  (setq verilog-indent-level-declaration 2)
  (setq verilog-indent-level-module 2)
  (setq verilog-indent-lists nil))

(set-file-template! "\\.v$" :trigger "__" :mode 'verilog-mode)
