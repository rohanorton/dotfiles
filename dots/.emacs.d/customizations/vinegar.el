;; ============
;; evil-vinegar
;; ============
;;
;; replicate behaviour of tpope's fantastic vim-vinegar
;;
;; btw, i don't know what i'm doing...

;; needed for dired-jump func:
(require 'dired-x)

;; ----------------
;; evil keybindings
;; ----------------
;;
;;   '-' keybinding to go to dired-mode
(define-key evil-normal-state-map (kbd "-") 'dired-jump)

;; ------------------
;; dired keybindings:
;; ------------------
;;
;;   '-' keybinding to go to parent dir:
(define-key dired-mode-map (kbd "-") 'dired-up-directory)
;;   '%' create file:
(define-key dired-mode-map (kbd "%") 'find-file)
;;   'd' create directory:
(define-key dired-mode-map (kbd "d") 'dired-create-directory)

;;   'D' delete already default
;;   'R' remame already default

;; not sure if I can be bothered adding '.' and '!'...
;; let's suck it and see.

