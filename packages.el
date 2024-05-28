(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
;(package-refresh-contents)

;; Good way to install if not already
(unless (package-installed-p 'evil)
  (package-install 'evil))
(setq package-list '(
    lsp-mode company evil ivy-rich counsel doom-themes latex-preview-pane
    general elpy dired-sidebar dired-preview yasnippet
    yasnippet-classic-snippets fill-column-indicator
))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Used to be able to copy text to clipboard while using emacs within the
;; terminal
(use-package xclip
  :ensure t)

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
  ;;(setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0))

(setq global-company-mode 1)
(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp-mode)
	 (c-mode . lsp-mode)
	 (js-mode . lsp-mode)
	 (rust-mode . lsp-mode)
	 (typescript-mode . lsp-mode)))

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

; This probably doesn't use any other mode than python
(use-package elpy
  :ensure t
  :hook ((python-mode . lsp-mode)
	 (python-mode . elpy-mode)
	 (c-mode      . lsp-mode)
	 (c++-mode    . lsp-mode)
	 (rust-mode   . lsp-mode))
	 ;;(js-mode     . lsp-mode))
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

(use-package org
  :config
        ;; indent after headers
  (setq org-adapt-indentation t
        ;; Don't show *bold* or /italic/ etc
        org-hide-emphasis-markers t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))
  ;:init
  ;(setq org-bullets-bullet-list '("◉", "●", "○", "●")))

;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/documents/notes/orgroam")
  (org-roam-db-location "~/documents/notes/orgroam/org-roam.db")
  :config
  (org-roam-setup))

(use-package org-roam-ui 
	     :ensure t
	     :after org-roam)

(setq org-roam-capture-templates
    '(
        ("a" "thoughts" plain (file "~/documents/notes/orgroam/thoughts/template.org")
            :target (file+head "thoughts/%<%Y%m%d%H%M%S>-${slug}.org"
            "#+title: ${title}\n") :unnarrowed t)
        ("c" "computer-science" plain (file "~/documents/notes/orgroam/computer-science/definition-template.org")
            :target (file+head "computer-science/%<%Y%m%d%H%M%S>-${slug}.org"
            "#+title: ${title}\n") :unnarrowed t)
    )
)

