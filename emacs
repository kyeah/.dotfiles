;; To change the font size under X.
                                        ; (set-default-font "9x15")

;; Set your term type to vt100
                                        ; (load "term/vt100")

;; When in text (or related mode) break the lines at 80 chars
                                        ; (setq text-mode-hook 'turn-on-auto-fill)
                                        ; (setq fill-column 80)


;; =================
;; === VARIABLES ===
;; =================

(custom-set-variables
 '(indent-tabs-mode nil)          ;; Convert all tabs to spaces
 '(cua-remap-control-z nil)       ;; Prevent CUA-mode from overriding ctrl-z
 '(transient-mark-mode t)         ;; make the current 'selection' visible
 '(delete-selection-mode t)       ;; delete the selection area with a keypress
 '(inhibit-startup-screen t))     ;; No startup screen

(custom-set-faces)
(cua-mode t)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; ===============
;; === ALIASES ===
;; ===============

;; Floobit Aliases!
(defalias 'floo-join 'floobits-join-workspace)
(defalias 'floo-share-pub 'floobits-share-dir-public)
(defalias 'floo-share-priv 'floobits-share-dir-private)
(defalias 'floo-leave 'floobits-leave-workspace)
(defalias 'floo-summon 'floobits-summon)
(defalias 'floo-follow-toggle 'floobits-follow-mode-toggle)
(defalias 'floo-clear-hl 'floobits-clear-highlights)

;; Extra: C-x r l <RET> will show bookmarks, which are created for each user's last action
;; when joining a workspace.

(when (> emacs-major-version 23)
     (defun my-cut-function (text &optional rest)
       "Allow copy-paste using linux clipboard in terminal mode"
       (let ((process-connection-type nil))
         (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
           (process-send-string proc text)
           (process-send-eof proc))))

     (defun my-paste-function ()
       (shell-command-to-string "pbpaste"))

       (setq interprogram-cut-function 'my-cut-function)
       (setq interprogram-paste-function 'my-paste-function)
     
     (global-set-key (kbd "C-M-z") 'undo-tree-visualize)
     (global-set-key (kbd "C-x u") 'undo-tree-undo)
     (global-set-key (kbd "C-b") 'undo-tree-undo)
     (global-set-key (kbd "C-n") 'undo-tree-redo)
)


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun prev-line-2 ()
  (interactive)
  (previous-line)
  (previous-line))

(defun next-line-2 ()
  (interactive)
  (next-line)
  (next-line))

(global-set-key (kbd "<M-up>")   'prev-line-2)
(global-set-key (kbd "<M-down>") 'next-line-2)
(global-set-key (kbd "C-q") 'iwb)   ;; Default binding is quoted-insert
(global-set-key (kbd "C-f") 'kmacro-start-macro-or-insert-counter)  ;; Default = forward-char
(global-set-key (kbd "C-g") 'kmacro-end-or-call-macro)  ;; Default = keyboard-quit
(global-set-key (kbd "C-z") 'suspend-emacs)
;----------------------------------------

;; ================
;; === PACKAGES ===
;; ================

;; List of Package Installs:
;; auto-complete
;; c-eldoc
;; jade-mode
;; floobits
;; color-theme
;; undo-tree
;; haskell-mode

;; !! We rely on cmdline xclip, so make sure you install that manually.

;;(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.dotfiles/el")

(when (> emacs-major-version 23)
     (require 'package)
     (add-to-list 'package-archives
                  '("marmalade" .
                          "http://marmalade-repo.org/packages/") t)
     (add-to-list 'package-archives
                  '("melpa" . "http://melpa.milkbox.net/packages/") t)
     (package-initialize)

     ;; Ensure all packages are installed
     (mapc
      (lambda (package)
        (or (package-installed-p package)
            (if (y-or-n-p (format "Package %s is missing. Install it? " package))
                (package-install package))))
      '(auto-complete c-eldoc jade-mode floobits color-theme undo-tree haskell-mode lua-mode scala-mode go-mode rust-mode project-explorer find-file-in-repository ido-ubiquitous smex ido-vertical-mode))

     (setq ruby-insert-encoding-magic-comment nil)
     
     ;; tidalcycles
     (setq load-path (cons "~/tidal/" load-path))
     (require 'tidal)
     (setq tidal-interpreter "/usr/local/bin/ghci")
     
     ;; Auto-Complete
     (require 'auto-complete-config)
     (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
     (ac-config-default)

     ;; C-Eldoc (show function parameters)
     (setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
     (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

     ;; Haskell-mode
     (add-hook 'haskell-mode-hook 'haskell-indent-mode)

     ;; Jade
     (require 'scala-mode)
     (require 'sws-mode)
     (require 'jade-mode)
     (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
     (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

     ;; Undo-tree
     (undo-tree-mode)

     ;; Color-theme
     (require 'color-theme)
     (color-theme-initialize)
     (add-to-list 'custom-theme-load-path "~/.dotfiles/el/emacs-color-theme-solarized")
     (load-theme 'solarized-dark t)
     
     ;; Lua
     (require 'lua-mode)
     (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
     (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

     (require 'scala-mode)
     (require 'rust-mode)

     (require 'project-explorer)
     (defalias 'nav 'project-explorer-open)
     (global-set-key (kbd "C-w") 'nav)

     (require 'find-file-in-repository)
     (global-set-key (kbd "C-x f") 'find-file-in-repository)

     (ido-mode 1)
     (ido-everywhere 1)
     (require 'ido-ubiquitous)
     (ido-ubiquitous-mode 1)
     (require 'ido-vertical-mode)
     (setq ido-use-faces t)
     (set-face-attribute 'ido-vertical-first-match-face nil
                         :background "#e5b7c0")
     (set-face-attribute 'ido-vertical-only-match-face nil
                         :background "#e52b50"
                         :foreground "white")
     (set-face-attribute 'ido-vertical-match-face nil
                         :foreground "#b00000")
     (ido-vertical-mode 1)
     (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

     (require 'smex)
     (smex-initialize)

     (global-set-key (kbd "M-x") 'smex)
     (global-set-key (kbd "M-X") 'smex-major-mode-commands)
     ;; This is your old M-x.
     (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
     )

(when (<= emacs-major-version 23)
  ;; If version <= 23
  (add-to-list 'load-path "~/.dotfiles/el/color-theme-6.6.0")
  (require 'color-theme)
  (color-theme-initialize)
  (load-file "~/.dotfiles/el/emacs-color-theme-solarized/color-theme-solarized.el")
  (color-theme-solarized-dark)

  (load-file "~/.dotfiles/el/haskell-mode-2.8.0/haskell-site-file.el")
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  )

(require 'haskell-mode)
