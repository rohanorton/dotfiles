;; Customizations to make emacs work more like vim

;; vim mode
(require 'evil)
(evil-mode t)

(require 'powerline-evil)
(powerline-evil-vim-color-theme)

(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "_") 'evil-numbers/dec-at-pt)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-commentary)
(evil-commentary-mode)

(require 'evil-visualstar)
(global-evil-visualstar-mode)
(set 'evil-visualstar/persistent t)

;; Allow hash to be entered
(define-key evil-insert-state-map (kbd "M-3") "#")
(define-key evil-normal-state-map (kbd "M-3") (kbd "#"))

;; Use helm-projectile like CtrlP in vim:
(require 'helm-projectile)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)


(require 'evil-exchange)
;; Change default key bindings (if you want) HERE
;; Currently cannot change to cx:
;; https://github.com/Dewdrops/evil-exchange/issues/6
;(setq evil-exchange-key (kbd "zx"))
(evil-exchange-install)

(require 'linum-relative)
(linum-relative-on)
(setq linum-relative-current-symbol "")
