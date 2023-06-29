;; Remove clunky features
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)

;; stop making #files
(setq make-backup-files nil)
;; Thicker window divider
(window-divider-mode 1) 

(set-face-attribute 'default nil :family "Fira Code" :height 110)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;; Good way to install if not already
(unless (package-installed-p 'evil)
  (package-install 'evil))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package ivy
  :ensure t
  :config
    (ivy-mode 1)
    (ivy-rich-mode 1))

(use-package counsel
  :ensure t
  :config
    (counsel-mode 1))

(use-package doom-themes
  :ensure t
  :config
    (load-theme 'doom-dracula t))

(use-package latex-preview-pane)

