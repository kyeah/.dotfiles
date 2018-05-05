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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-remap-control-z nil)
 '(delete-selection-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (mocha flycheck groovy-mode eslintd-fix elixir-mode yaml-mode web-mode undo-tree textmate sws-mode smex smartparens scala-mode rubocop robe rainbow-mode projectile-rails project-explorer multiple-cursors lua-mode jade-mode ido-vertical-mode icicles helm haskell-mode handlebars-mode haml-mode grizzl go-mode flymake-ruby floobits find-file-in-repository enh-ruby-mode dash-at-point company column-marker color-theme c-eldoc auto-complete-etags ag ace-jump-mode ac-racer ac-inf-ruby)))
 '(transient-mark-mode t))
 ;; No startup screen

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(cua-mode t)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max 0)
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

(setq js-indent-level 2)

(setq column-number-mode t)

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

;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)

;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
 (windmove-default-keybindings)

(when (> emacs-major-version 23)
     (require 'package)
     (add-to-list 'package-archives
                  '("marmalade" .
                          "http://marmalade-repo.org/packages/") t)
     (add-to-list 'package-archives
                  '("melpa" . "https://melpa.org/packages/"))
     (when (< emacs-major-version 24)
       ;; For important compatibility libraries like cl-lib
         (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
     (package-initialize)

     ;; Ensure all packages are installed
     (mapc
      (lambda (package)
        (or (package-installed-p package)
            (if (y-or-n-p (format "Package %s is missing. Install it? " package))
                (package-install package))))
      '(auto-complete ag enh-ruby-mode projectile rainbow-mode dash-at-point multiple-cursors textmate web-mode c-eldoc jade-mode floobits color-theme undo-tree haskell-mode lua-mode scala-mode go-mode rust-mode find-file-in-repository smex ido-vertical-mode robe grizzl smartparens rubocop flymake-ruby eslintd-fix flycheck mocha helm-ls-git))

     (setq ruby-insert-encoding-magic-comment nil)

     ;; robe
     ;;(require 'robe)
     ;;(require 'company)
     ;;(add-hook 'after-init-hook 'global-company-mode)
     ;;(global-set-key (kbd "C-d") 'robe-jump)
     ;;(add-hook 'ruby-mode-hook 'robe-mode)
     ;;(eval-after-load 'company
     ;;  '(push 'company-robe company-backends))
     ;;(add-hook 'robe-mode-hook 'ac-robe-setup)
     
     ;;
     (require 'helm)
     (require 'helm-ls-git)
     (helm-mode 1)
     (global-set-key (kbd "M-x") #'helm-M-x)
     ;;(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
     (global-set-key (kbd "C-x C-f") #'helm-find-files)
     (global-set-key (kbd "C-x C-g") #'helm-grep-do-git-grep)
     (global-set-key (kbd "C-x c") 'helm-ls-git-ls)
     (setq helm-ff-skip-boring-files t)
     (setq helm-ff-file-name-history-use-recentf t)
     (setq helm-boring-file-regexp-list
           '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$"
             "\\.so$" "\\.a$" "\\.elc$" "\\.fas$" "\\.fasl$" "\\.pyc$" "\\.pyo$" "node_modules"))

     ;; flycheck eslint_d
     (require 'flycheck)
     (require 'eslintd-fix)
     (setq flycheck-javascript-eslint-executable "eslint_d")
     (add-hook 'after-init-hook #'global-flycheck-mode)
     (add-hook 'after-init-hook #'eslintd-fix-mode)     

     ;;(require 'flymake-ruby)
     ;;(add-hook 'ruby-mode-hook 'flymake-ruby-load)

     ;;(flyspell-mode 1)
     
     ;;
     ;;(autoload
     ;;  'ace-jump-mode
     ;;  "ace-jump-mode"
     ;;  "Emacs quick move minor mode"
     ;;  t)
     ;; you can select the key you prefer to
     ;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)



     ;;
     ;; enable a more powerful jump back function from ace jump mode
     ;;
     ;;(autoload
     ;;  'ace-jump-mode-pop-mark
     ;;  "ace-jump-mode"
     ;;  "Ace jump back:-)"
     ;;  t)
     ;;(eval-after-load "ace-jump-mode"
     ;;  '(ace-jump-mode-enable-mark-sync))
     ;;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
     
     ;; tidalcycles
     ;;(setq load-path (cons "~/tidal/" load-path))
     ;;(require 'tidal)
     ;;(setq tidal-interpreter "/usr/local/bin/ghci")
     
     ;; Auto-Complete
     (require 'auto-complete-config)
     (add-to-list 'ac-dictionary-directories
                  "~/.emacs.d/elpa/auto-complete-20170124.1845/dict/")
     (ac-config-default)
     (setq ac-ignore-case nil)
     (add-to-list 'ac-modes 'enh-ruby-mode)
     (add-to-list 'ac-modes 'web-mode)

     ;; ruby
     (add-hook 'enh-ruby-mode-hook 'robe-mode)
     (setq enh-ruby-program "~/.rbenv/versions/2.2.5/bin/ruby")
     (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
     (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
     (add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
     (add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
     (add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
     (add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
     (add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
     (setq ruby-deep-indent-paren nil)
     (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

     (setq enh-ruby-deep-indent-construct nil)
     (setq enh-ruby-bounce-deep-indent t)
     (setq enh-ruby-hanging-brace-indent-level 2)

     (require 'cl) ; If you don't have it already

     (require 'compile)

     (defun* get-closest-gemfile-root (&optional (file "Gemfile"))
         "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
         (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
           (loop
            for d = default-directory then (expand-file-name ".." d)
            if (file-exists-p (expand-file-name file d))
            return d
            if (equal d root)
            return nil)))
     
     (defun rspec-compile-file ()
       (interactive)
       (compile (format "cd %s;bin/rails test %s"
                        (get-closest-gemfile-root)
                        (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                        ) t))

     (defun get-current-test-name ()
       (re-search-backward "context \".*\" do")
       (buffer-substring-no-properties (match-beginning 1) (match-end 1)))

     (defun rspec-compile-on-line ()
       (interactive)
       (compile (format "cd %s;bin/rails test %s %s"
                        (get-closest-gemfile-root)
                        (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                        (get-current-test-name)
                        ) t))

     ;; (add-hook 'enh-ruby-mode-hook
     ;;          (lambda ()
     ;;            (local-set-key (kbd "C-c l") 'rspec-compile-on-line)
     ;;            (local-set-key (kbd "C-c k") 'rspec-compile-file)
     ;;            ))

     (global-set-key (kbd "C-c l") 'mocha-test-at-point)
     (global-set-key (kbd "C-c k") 'mocha-test-file)
     (setq js2-mode-show-parse-errors nil)
     (setq js2-mode-show-strict-warnings nil)
     (require 'js2-mode)
     (add-hook 'js-mode-hook 'js2-minor-mode)

     ;; projectile
     (require 'grizzl)
     (projectile-global-mode)
     (setq projectile-enable-caching t)
     (setq projectile-completion-system 'grizzl)
     ;; Press Command-p for fuzzy find in project
     (global-set-key (kbd "s-p") 'projectile-find-file)
     ;; Press Command-b for fuzzy switch buffer
     (global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

     ;; smartparens
     (require 'smartparens-config)
     (require 'smartparens-ruby)
     (smartparens-global-mode)
     (show-smartparens-global-mode t)
     ;;(sp-with-modes '(rhtml-mode)
     ;;               (sp-local-pair "<" ">")
     ;;               (sp-local-pair ""))
     (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

     ;;; markdown-mode
     (sp-with-modes '(markdown-mode gfm-mode rst-mode)
                    (sp-local-pair "*" "*" :bind "C-*")
                    (sp-local-tag "2" "**" "**")
                    (sp-local-tag "s" "```scheme" "```")
                    (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

     ;;; tex-mode latex-mode
     (sp-with-modes '(tex-mode plain-tex-mode latex-mode)
                    (sp-local-tag "i" "\"<" "\">"))

     ;;; html-mode
     (sp-with-modes '(html-mode sgml-mode)
                    (sp-local-pair "<" ">"))

     ;;; lisp modes
     (sp-with-modes sp--lisp-modes
                    (sp-local-pair "(" nil :bind "C-("))

     (provide 'setup-smartparens)
     
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
     (global-undo-tree-mode)

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

     ;; laggy af
     ;(require 'project-explorer)
     ;;(defalias 'nav 'project-explorer-open)
     ;;(global-set-key (kbd "C-w") 'nav)

     (require 'find-file-in-repository)
     (global-set-key (kbd "C-w") 'find-file)
     (global-set-key (kbd "C-x f") 'find-file-in-repository)

     (ido-mode 1)
     (ido-everywhere 1)
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
