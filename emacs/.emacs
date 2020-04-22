(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;(package-refresh-contents)

(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode)
(set-default-font "Fira Code Retina-11")

(load-theme 'wombat t)

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(require 'ido)
(ido-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (multiple-cursors rust-mode smex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'rust-mode)

(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)

(require 'multiple-cursors)
; To get out of multiple-cursors-mode, press <return> or C-g.
; The latter will first disable multiple regions before disabling multiple cursors.
; If you want to insert a newline in multiple-cursors-mode, use C-j.
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
