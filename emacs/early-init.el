;;; early-init.el --- -*- lexical-binding: t no-byte-compile: t -*-
;;; Commentary:
;;; Code:

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq load-prefer-newer noninteractive)
(when (or (daemonp)
          (boundp 'startup-now)
          (featurep 'esup-child)
          noninteractive)
  (setq package-enable-at-startup nil))
(setq package--init-file-ensured t)
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq frame-inhibit-implied-resize t)
(setq initial-major-mode 'fundamental-mode)
(setq default-frame-alist '((width . 180)
                            (height . 55)
                            (menu-bar-lines . 0)
                            (tool-bar-lines . 0)
                            (horizontal-scroll-bars)
                            (vertical-scroll-bars)))

(defvar file-name-handler-alist-backup file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
          (lambda () (setq file-name-handler-alist file-name-handler-alist-backup)))

(provide 'early-init)
;;; early-init.el ends here
