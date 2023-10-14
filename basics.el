;; Remove clunky features
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(add-hook 'prog-mode-hook 'toggle-truncate-lines)

;; stop making #files
(setq make-backup-files nil)
;; Thicker window divider
(window-divider-mode 1) 

;;(set-face-attribute 'default nil :family "Fira Code" :height 110)
(set-face-attribute 'default nil :height 110)
(setq kill-buffer-query-functions nil)
