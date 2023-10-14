
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;; Good way to install if not already
(unless (package-installed-p 'evil)
  (package-install 'evil))
(setq package-list '(
    lsp-mode company evil ivy-rich counsel doom-themes latex-preview-pane general elpy dired-sidebar dired-preview
))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(use-package doom-themes
  :ensure t
  :config
    (load-theme 'doom-dracula t))

(use-package ivy-rich
  :after ivy
  :ensure t)

(use-package ivy
  :ensure t
  :config
    (ivy-mode 1)
    (ivy-rich-mode 1))

(use-package company
  :ensure t
  :config
  (setq company-mode 1)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0))

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp-mode)
	 (c-mode . lsp-mode)))

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

(use-package counsel
  :ensure t
  :config
    (counsel-mode 1))

(use-package latex-preview-pane
  :ensure t)

(use-package elpy
  :ensure t
  :hook ((python-mode . lsp-mode)
	 (python-mode . elpy-mode))
  :config (elpy-enable))



;; Better syntax highlighting
(use-package tree-sitter
  :ensure t
  :hook (prog-mode . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :after tree-sitter)

(use-package dired-sidebar)
(use-package dired-preview
  :config (dired-preview-global-mode 1))
