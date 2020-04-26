(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width  . 100))

(setq inhibit-startup-screen t)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
    '(package-selected-packages (quote (multiple-cursors rust-mode smex))))

(require 'ido)
(require 'rust-mode)
(require 'multiple-cursors)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode)

(set-default-font "Fira Code Retina-11")
(load-theme 'wombat t)

(ido-mode 1)
(ido-everywhere 1)
(smex-initialize)

;;; HOOKS

(add-hook 'write-file-hooks 'delete-trailing-whitespace)


;;; KEYBINDINGS

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)


; To get out of multiple-cursors-mode, press <return> or C-g.
; The latter will first disable multiple regions before disabling multiple cursors.
; If you want to insert a newline in multiple-cursors-mode, use C-j.
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
