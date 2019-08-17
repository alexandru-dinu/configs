;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
    """
    Configuration Layers declaration.
    You should not put any user code in this function
    besides modifying the variable values.
    """
    (setq-default
        dotspacemacs-distribution 'spacemacs
        dotspacemacs-enable-lazy-installation 'unused
        dotspacemacs-ask-for-lazy-installation t
        dotspacemacs-configuration-layer-path '()

        dotspacemacs-configuration-layers
        '(
            asm
            auto-completion
            better-defaults
            c-c++
            csv
            emacs-lisp
            git
            helm
            ibuffer
            markdown
            python
            shell-scripts
            syntax-checking
            version-control
            vimscript
            yaml
        )

        dotspacemacs-additional-packages
        '(
            company
            company-rtags
            flycheck-clang-analyzer
            flycheck-clang-tidy
            flycheck-clangcheck
            flycheck-color-mode-line
            helm-flycheck
            rtags
            treemacs
            treemacs-evil
            treemacs-projectile
        )

        dotspacemacs-frozen-packages '()
        dotspacemacs-excluded-packages '()
        dotspacemacs-install-packages 'used-only
    )
)

(defun dotspacemacs/init ()
    """
    Initialization function.
    This function is called at the very startup of
    Spacemacs initialization before layers configuration.
    You should not put any user code in there
    besides modifying the variable values.
    """
    (setq-default
        dotspacemacs-elpa-https t
        dotspacemacs-elpa-timeout 5
        dotspacemacs-check-for-update nil
        dotspacemacs-elpa-subdirectory nil
        dotspacemacs-editing-style 'vim
        dotspacemacs-verbose-loading nil
        dotspacemacs-startup-banner 'official
        dotspacemacs-startup-lists
        '(
            (recents  . 5)
            (projects . 7)
        )
        dotspacemacs-startup-buffer-responsive t
        dotspacemacs-scratch-mode 'text-mode

        dotspacemacs-default-font
        '(
            "Source Code Pro"
            :size 14
            :weight normal
            :width normal
            :powerline-scale 1.1
        )
        dotspacemacs-colorize-cursor-according-to-state t

        dotspacemacs-leader-key "SPC"
        dotspacemacs-emacs-command-key "SPC"
        dotspacemacs-ex-command-key ":"
        dotspacemacs-emacs-leader-key "M-m"
        dotspacemacs-major-mode-leader-key ","
        dotspacemacs-major-mode-emacs-leader-key "C-M-m"

        dotspacemacs-distinguish-gui-tab nil
        dotspacemacs-remap-Y-to-y$ nil
        dotspacemacs-retain-visual-state-on-shift t
        dotspacemacs-visual-line-move-text nil
        dotspacemacs-ex-substitute-global nil
        dotspacemacs-default-layout-name "Default"
        dotspacemacs-display-default-layout nil
        dotspacemacs-auto-resume-layouts nil
        dotspacemacs-large-file-size 1
        dotspacemacs-auto-save-file-location 'cache
        dotspacemacs-max-rollback-slots 5
        dotspacemacs-helm-resize nil
        dotspacemacs-helm-no-header nil
        dotspacemacs-helm-position 'bottom
        dotspacemacs-helm-use-fuzzy 'always
        dotspacemacs-enable-paste-transient-state nil
        dotspacemacs-which-key-delay 0.4
        dotspacemacs-which-key-position 'bottom
        dotspacemacs-loading-progress-bar nil
        dotspacemacs-fullscreen-at-startup nil
        dotspacemacs-fullscreen-use-non-native nil
        dotspacemacs-maximized-at-startup nil
        dotspacemacs-active-transparency 90
        dotspacemacs-inactive-transparency 90
        dotspacemacs-show-transient-state-title t
        dotspacemacs-show-transient-state-color-guide t
        dotspacemacs-mode-line-unicode-symbols t
        dotspacemacs-smooth-scrolling t
        dotspacemacs-line-numbers t
        dotspacemacs-folding-method 'evil
        dotspacemacs-smartparens-strict-mode nil
        dotspacemacs-smart-closing-parenthesis nil
        dotspacemacs-highlight-delimiters 'all
        dotspacemacs-persistent-server nil
        dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
        dotspacemacs-default-package-repository nil

        dotspacemacs-whitespace-cleanup 'trailing
        vc-follow-symlinks t
    )
)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(defalias 'c-basic-offset 'tab-width)
(setq tab-stop-list (number-sequence 4 200 `4))
(global-set-key (kbd "<tab>") 'tab-to-tab-stop)

(global-set-key (kbd "<M-up>") 'evil-window-up)
(global-set-key (kbd "<M-down>") 'evil-window-down)
(global-set-key (kbd "<M-left>") 'evil-window-left)
(global-set-key (kbd "<M-right>") 'evil-window-right)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(global-set-key (kbd "C-a") 'helm-projectile-ag)

;; hooks
(add-hook 'c++-mode-hook
  (lambda()
    (global-set-key (kbd "C-a") 'helm-projectile-ag)
    (global-set-key (kbd "C-d") 'rtags-find-symbol-at-point)
    (global-set-key (kbd "C-f") 'rtags-find-symbol)
    )
)

(global-set-key [f7] 'treemacs)
(global-set-key [f6] 'treemacs-root-up)
(global-set-key [f8] 'treemacs-root-down)


(defun dotspacemacs/user-init ()
    """
    Initialization function for user code.
    It is called immediately after `dotspacemacs/init',
    before layer configuration executes.
    This function is mostly useful for variables that need to be set
    before packages are loaded. If you are unsure, you should try in setting them in
    `dotspacemacs/user-config' first.
    """
)

(defun dotspacemacs/user-config ()
    """
    Configuration function for user code.
    This function is called at the very end of Spacemacs initialization after
    layers configuration.
    This is the place where most of your configurations should be done. Unless it is
    explicitly specified that a variable should be set before a package is loaded,
    you should place your code here.
    """
)