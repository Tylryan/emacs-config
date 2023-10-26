;; Remove clunky features
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(add-hook 'prog-mode-hook 'toggle-truncate-lines)               ; Don't wrap text
(add-hook 'prog-mode-hook 'linum-mode)                          ; Turn on line numbers
(add-hook 'prog-mode-hook 'electric-pair-mode)                  ; Pair characters like ()
(add-hook 'c-mode-hook (lambda() (c-set-style "linux")))        ; Allow Allman brackets and use 4 spaces as index
(add-hook 'c++-mode-hook (lambda() (c-set-style "linux")))
(yas-global-mode 1)                                             ; Snippet completion

(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))
;; stop making #files
(setq make-backup-files nil)
;; Thicker window divider
(window-divider-mode 1) 

;;(set-face-attribute 'default nil :family "Fira Code" :height 110)
(set-face-attribute 'default nil :height 110)
(setq kill-buffer-query-functions nil)
