(setq inhibit-startup-screen t)
(set-default-font "CamingoCode-10.5")

"tabs"
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(defalias 'c-basic-offset 'tab-width)

(global-linum-mode t)
(setq column-number-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(ido-mode 1)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

"lines"
(global-set-key (kbd "M-<up>")  'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "M-c") 'kill-whole-line)
(global-set-key (kbd "M-d") "\C-a\C- \C-e\M-w\C-o\C-n\C-y")

(require 'package)
(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])

 '(custom-enabled-themes (quote (wombat)))

 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
)
(package-initialize)
(custom-set-faces
 )

"autocomplete"
(ac-config-default)
(ac-linum-workaround)

"smex"
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

"multiple cursors"
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

"jump to def"
(global-set-key (kbd "C-M-g") 'dumb-jump-go)
(global-set-key (kbd "C-M-b") 'dumb-jump-back)
(global-set-key (kbd "C-M-p") 'dumb-jump-quick-look)
