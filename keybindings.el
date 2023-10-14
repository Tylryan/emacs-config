(use-package general
  :ensure t
  :config
    (general-create-definer my-leader-def
    ;; :prefix my-leader
    :prefix "SPC"))

;;(global-set-key (kbd "C-o") 'previous-buffer)
;; Mode Keybindings
(general-define-key
 :states 'normal
 :keymaps 'emacs-lisp-mode-map
 ;; or xref equivalent
 "K" 'elisp-slime-nav-describe-elisp-thing-at-point)

;; Navigate through thngs like M-x with C-j and C-k
(general-define-key
 :keymaps 'ivy-minibuffer-map
 "C-j" 'ivy-next-line-or-history
 "C-k" 'ivy-previous-line-or-history
)

(my-leader-def
  :states 'normal
  :keymaps 'override
  "SPC" 'counsel-fzf
  ":"   'counsel-M-x
  "."   'find-file
  ">"   'find-file-other-window-vertically
  ;; Bookmarks
  "RET RET" 'counsel-bookmark
  "RET r"   'bookmark-rename
  "RET d"   'bookmark-delete
  ;; Buffers
  "b RET" 'counsel-switch-buffer
  "b b"   'counsel-switch-buffer
  "b h"   'previous-buffer
  "b l"   'next-buffer
  "b q"   'evil-delete-buffer
  ;; Dired
  "d d" 'dired
  ;; Help
  "h d" 'describe-symbol
  "h k" 'describe-key
  "h m" 'evil-lookup
  ;; Open
  "o d" 'dired-sidebar-toggle-sidebar
  "o t" 'term-toggle
  ;; Tabs
  "t RET" 'tab-new
  "t t"   'tab-new
  "t l"   'tab-next
  "t h"   'tab-previous
  "t q"   'tab-close
  ;; Windows
  "w SPC" 'window-swap-states
  "w l"   'evil-window-right
  "w h"   'evil-window-left
  "w j"   'evil-window-down
  "w k"   'evil-window-up
  "w n"   'evil-window-vnew
  "w RET" 'evil-window-vnew
  "w w"   'evil-window-prev
  "w q"   'evil-delete-buffer
)

;; Straight from Stack Overflow
(defun find-file-other-window-vertically nil
  "Edit a file in another window, split vertically."
  (interactive)
  (let ((split-width-threshold 0)
        (split-height-threshold nil))
    (call-interactively 'find-file-other-window)))

(defun term-toggle nil
  (interactive)
  (if (get-buffer "*terminal*")
      (let ( bwindow get-buffer-window)
	(kill-buffer "*terminal*")
	(delete-window bwindow))
    (split-window-below 20)
    (other-window 1)
    (term "/usr/bin/bash")))
