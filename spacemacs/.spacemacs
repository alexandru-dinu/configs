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
            docker
            emacs-lisp
            emacs-lisp
            git
            helm
            ibuffer
            markdown
            python
            shell-scripts
            syntax-checking
            themes-megapack
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

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (unfill mwim helm-company helm-c-yasnippet fuzzy company-statistics company-shell company-c-headers company-anaconda auto-yasnippet yasnippet ac-ispell auto-complete helm-flycheck flycheck-color-mode-line flycheck-clangcheck flycheck-clang-tidy flycheck-clang-analyzer company-rtags rtags company zenburn-theme zen-and-art-theme yapfify yaml-mode x86-lookup white-sand-theme vimrc-mode underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-evil ht pfuture toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle seti-theme reverse-theme rebecca-theme railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme orgit organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nasm-mode naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme lush-theme live-py-mode light-soap-theme jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme ibuffer-projectile hy-mode dash-functional heroku-theme hemisu-theme helm-pydoc helm-gitignore hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme flycheck-pos-tip pos-tip flycheck flatui-theme flatland-theme fish-mode farmhouse-theme exotica-theme evil-magit magit transient git-commit with-editor lv espresso-theme dracula-theme dockerfile-mode django-theme disaster diff-hl darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmake-mode clues-theme clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme anaconda-mode pythonic ample-zen-theme ample-theme alect-themes afternoon-theme docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat csv treemacs ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#F7F7F7" :background "#282828")))))