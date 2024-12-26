(require 'org)
(org-babel-load-file (expand-file-name "~/.config/emacs/config.org"))


; ;; Disable startup message
; (setq inhibit-startup-message t)

; ;; UI Tweaks
; (scroll-bar-mode -1)   ;; Disable visible scrollbar
; (tooltip-mode -1)      ;; Disable tooltips
; (tool-bar-mode -1)     ;; Disable the toolbar
; (menu-bar-mode -1)     ;; Disable the menu bar
; (set-fringe-mode 10)   ;; Set wide margins

; ;; Enable visible bell
; (setq visible-bell t)

; ;; Show column numbers
; (column-number-mode)

; ;; Enable line numbers globally except in specific modes
; (global-display-line-numbers-mode t)
; (dolist (mode '(org-mode-hook
;                 term-mode-hook
;                 shell-mode-hook
;                 treemacs-mode-hook
;                 eshell-mode-hook))
;   (add-hook mode (lambda () (display-line-numbers-mode 0))))

; ;; Make ESC quit prompts
; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; ;; Package management setup
; (require 'package)
; (setq package-archives
;       '(("melpa" . "https://melpa.org/packages/")
;         ("org" . "https://orgmode.org/elpa/")
;         ("gnu" . "https://elpa.gnu.org/packages/")))
; (package-initialize)

; (unless package-archive-contents
;   (package-refresh-contents))

; ;; Install `use-package` if not installed
; (unless (package-installed-p 'use-package)
;   (package-install 'use-package))
; (require 'use-package)
; (setq use-package-always-ensure t)

; ;; Load and apply the Tao Theme (dark version)
; ; (use-package tao-theme
; ;   :config
; ;   (load-theme 'tao-yin t))


; (unless (package-installed-p 'catppuccin-theme)
;   (package-install 'catppuccin-theme))

; ;; Install and configure `ivy`
; (use-package ivy
;   :diminish
;   :bind (("C-s" . swiper)
;          :map ivy-minibuffer-map
;          ("TAB" . ivy-alt-done)
;          ("C-l" . ivy-alt-done)
;          ("C-j" . ivy-next-line)
;          ("C-k" . ivy-previous-line))
;   :config
;   (ivy-mode 1))

; ;; Install and configure `doom-modeline`
; (use-package doom-modeline
;   :init
;   (doom-modeline-mode 1))

; ;; Install and configure `which-key`
; (use-package which-key
;   :defer 0
;   :diminish which-key-mode
;   :config
;   (which-key-mode)
;   (setq which-key-idle-delay 1))

; ;; Install and configure `counsel`
; (use-package counsel
;   :bind (("C-M-j" . 'counsel-switch-buffer)
;          :map minibuffer-local-map
;          ("C-r" . 'counsel-minibuffer-history))
;   :config
;   (counsel-mode 1))

; ;; Install and configure `evil`
; (use-package evil
;   :init
;   (setq evil-want-integration t)
;   (setq evil-want-keybinding nil)
;   (setq evil-want-C-u-scroll t)
;   (setq evil-want-C-i-jump nil)
;   :config
;   (evil-mode 1)
;   (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
;   (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;   ;; Use visual line motions even outside of visual-line-mode buffers
;   (evil-global-set-key 'motion "j" 'evil-next-visual-line)
;   (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

;   (evil-set-initial-state 'messages-buffer-mode 'normal)
;   (evil-set-initial-state 'dashboard-mode 'normal))

; ;; Install and configure `evil-collection`
; (use-package evil-collection
;   :after evil
;   :config
;   (evil-collection-init))

; ;; Org mode setup
; (use-package org
;   :ensure t
;   :config
;   ;; Add any org-mode-specific configuration here
;   )
