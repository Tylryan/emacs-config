(use-package general
  :ensure t
  :config
    (general-create-definer my-leader-def
    ;; :prefix my-leader
    :prefix "SPC"))

;; GLOBAL KEYBINDINGS USING A LEADER KEY
;;   These keybindings will override any other keybindings
(my-leader-def
  :states 'normal
  :keymaps 'override
  "SPC" 'counsel-fzf
  ":"   'counsel-M-x
  "."   'find-file
  ">"   'find-file-other-window-vertically
  ;; Bookmarks
  "RET ." 'counsel-bookmark
  "RET >" 'counsel-bookmark-next-window
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
  ;; Org Roam (and plain org)
  "r n" 'org-roam-node-open-vertical
  "r f" 'org-roam-node-open-vertical
  "r >" 'org-roam-node-open-vertical
  "r ." 'org-roam-node-find
  "r h" 'org-insert-heading
  "r b" 'org-roam-buffer-toggle      ;; Back links
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

;; MAP/MODE SPECIFIC KEYBINDS THAT DO USE LEADER KEY
;;    Create maps for specific modes with your leader key defined above
;;    Pretty sure the keybinds above will override any mode specific
;;    ones unless you make them override the global keybinds
(my-leader-def flycheck-mode-map
 :states 'normal
 ;:prefix "SPC"
 :keymaps 'flycheck-mode-map
 "e n" 'flycheck-next-error
 "e N" 'flycheck-previous-error
 )

(my-leader-def org-mode-map
 :states 'normal
 "r l" 'org-roam-node-insert
 "r o" 'org-open-at-point)

;; MODE KEYBINDINGS THAT DO NOT USE THE LEADER KEYS
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
 ;; In org roam, if you have a node called "hello world" and try to create
 ;; a new one called "hello", it will just select "hello world" instead of
 ;; creating the new node. This keybind will create the new node
 "C-<return>" 'ivy-immediate-done
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
  ;; If there is a temrinal buffer
  (if (get-buffer "*terminal*")
      ;; get that buffer
      (let ( bwindow (get-buffer-window "*terminal*"))
        (kill-buffer "*terminal*")
        (delete-window bwindow))
    ;; else
    (split-window-below 20)
    (other-window 1)
    (term "/usr/bin/bash")))

(defun org-roam-node-open-vertical ()
  (interactive)
  (org-roam-node-find (next-window)))

(defun counsel-bookmark-next-window ()
  (interactive)
  ;; Create a new window
  (split-window-right)
  ;; Select next window
  (other-window 1)
  ;; Create a scratch buffer because setting it to the current buffer
  ;; looks pretty uggly to me
  (scratch-buffer)
  ;; run counsel bookmark
  (counsel-bookmark))
