(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t))
(set-default-font "CamingoCode-10.5")
(custom-set-faces
 )
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-set-key (kbd "C-d") 'kill-whole-line)

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

(global-set-key (kbd "M-<up>")  'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
