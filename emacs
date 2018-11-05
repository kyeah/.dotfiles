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
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(background-color "#141414")
 '(background-mode dark)
 '(compilation-message-face (quote default))
 '(coverlay:base-path "")
 '(coverlay:mark-tested-lines nil)
 '(coverlay:untested-line-background-color "#1c0101")
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cua-remap-control-z nil)
 '(cursor-color "#B0B0B0")
 '(custom-safe-themes
   (quote
    ("972e9adecad4b52e81c3e49a434bf189caf4be4d380a0106bd168429355c8bc9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(delete-selection-mode t)
 '(fci-rule-color "#073642")
 '(foreground-color "#B0B0B0")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (solarized-theme realgud indium git-link js2-highlight-vars ac-js2 import-js js-import flow-minor-mode prettier-js tide company-flow exec-path-from-shell eruby-mode docker-compose-mode dockerfile-mode terraform-mode js-doc benchmark-init coverlay mocha flycheck groovy-mode eslintd-fix elixir-mode yaml-mode web-mode undo-tree textmate sws-mode smex smartparens scala-mode rubocop robe rainbow-mode projectile-rails project-explorer multiple-cursors lua-mode jade-mode ido-vertical-mode icicles helm haskell-mode handlebars-mode haml-mode grizzl go-mode flymake-ruby floobits find-file-in-repository enh-ruby-mode dash-at-point company column-marker color-theme c-eldoc auto-complete-etags ag ace-jump-mode ac-racer ac-inf-ruby)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(transient-mark-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c3c373730000")
     (60 . "#b9b97d7d0000")
     (80 . "#b58900")
     (100 . "#a24c87870000")
     (120 . "#9b9b87870000")
     (140 . "#94e987870000")
     (160 . "#8e3887870000")
     (180 . "#859900")
     (200 . "#5a5a94e92d2c")
     (220 . "#43c39b9b43c3")
     (240 . "#2d2da24c5a59")
     (260 . "#1696a8fd70f0")
     (280 . "#2aa198")
     (300 . "#00009f9fa7a7")
     (320 . "#00009797b7b7")
     (340 . "#00008f8fc7c7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
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


(menu-bar-mode -1)

;; handles # files and stuff
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )

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
(global-set-key (kbd "C-z") 'suspend-frame)

(defun next-code-buffer ()
  (interactive)
  (let (( bread-crumb (buffer-name) ))
    (next-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
         (not ( equal bread-crumb (buffer-name) )) )
      (next-buffer))))
(global-set-key [remap next-buffer] 'next-code-buffer)

(defun previous-code-buffer ()
  (interactive)
  (let (( bread-crumb (buffer-name) ))
    (previous-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
         (not ( equal bread-crumb (buffer-name) )) )
      (previous-buffer))))
(global-set-key [remap previous-buffer] 'previous-code-buffer)


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
      '(auto-complete ag enh-ruby-mode projectile rainbow-mode dash-at-point multiple-cursors textmate web-mode c-eldoc jade-mode floobits color-theme undo-tree haskell-mode lua-mode scala-mode go-mode rust-mode find-file-in-repository smex ido-vertical-mode robe grizzl smartparens rubocop flymake-ruby eslintd-fix flycheck mocha helm-ls-git coverlay tide company-flow prettier-js flow-minor-mode import-js js2-highlight-vars js2-refactor company-tern))

     ;; (use-package rainbow-delimiters
     ;;   :ensure t
     ;;   :config
     ;;   (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
     ;;   (custom-set-faces
     ;;    '(rainbow-delimiters-depth-1-face ((t (:foreground "deep sky blue"))))
     ;;    '(rainbow-delimiters-depth-2-face ((t (:foreground "dark orange"))))
     ;;    '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
     ;;    '(rainbow-delimiters-depth-4-face ((t (:foreground "chartreuse"))))
     ;;    '(rainbow-delimiters-depth-5-face ((t (:foreground "orchid"))))
     ;;    '(rainbow-delimiters-depth-6-face ((t (:foreground "spring green"))))
     ;;    '(rainbow-delimiters-depth-7-face ((t (:foreground "sienna1")))))
     ;;    '(rainbow-delimiters-depth-8-face ((t (:foreground "deep pink"))))
     ;;   )

     (use-package rainbow-mode
       :ensure t
       :config
       (setq rainbow-x-colors nil)
       (add-hook 'prog-mode-hook 'rainbow-mode))

     (use-package git-link
       :ensure t
       :config
       (setq git-link-open-in-browser t)
       (global-set-key (kbd "C-c g") 'git-link)
       )

     (setq ruby-insert-encoding-magic-comment nil)

     (require 'benchmark-init)
     ;; To disable collection of benchmark data after init is done.
     (add-hook 'after-init-hook 'benchmark-init/deactivate)

     ;; robe
     ;;(require 'robe)
     (require 'company)
     (require 'company-tern)
     (defun setup-tide-mode ()
       (interactive)
       (tide-setup)
       (flycheck-mode +1)
       (setq flycheck-check-syntax-automatically '(save mode-enabled))
       (eldoc-mode +1)
       (tide-hl-identifier-mode +1)
       ;; company is an optional dependency. You have to
       ;; install it separately via package-install
       ;; `M-x package-install [ret] company`
       ;;(company-mode +1))
       )

     (setq company-idle-delay 0.2
           company-echo-delay 0.0
           company-minimum-prefix-length 2
           company-tooltip-flip-when-above t
           company-dabbrev-downcase nil)
     (add-hook 'after-init-hook 'global-company-mode)
     (add-to-list 'company-backends 'company-tern)
     (add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)))
     (define-key tern-mode-keymap (kbd "M-.") nil)
     (define-key tern-mode-keymap (kbd "M-,") nil)
     ;;(add-hook 'js2-mode-hook 'setup-tide-mode)
     (require 'prettier-js)
      (require 'flow-minor-mode)

      ;;(require 'tide)
      ;;(setq tide-completion-detailed t)
      ;;(setq tide-always-show-documentation t)
     ;; aligns annotation to the right hand side
      ;;(setq company-tooltip-align-annotations t)

     ;; formats the buffer before saving
      ;;(add-hook 'before-save-hook 'tide-format-before-save)
      (setq clean-buffer-list-delay-general 1)
      (setq clean-buffer-list-delay-special (* 20 60))
      (add-to-list 'clean-buffer-list-kill-regexps
                   '("^\\*"))
      (add-hook 'after-save-hook (lambda ()
                                   (clean-buffer-list)))

     (setq prettier-js-args '(
                              "--trailing-comma" "none"
                              "--parser" "flow"
                              "--semi" "false"
                              "single-quote" "true"
                              ))
;;(global-set-key (kbd "C-d") 'robe-jump)
     ;;(add-hook 'ruby-mode-hook 'robe-mode)
     ;;(eval-after-load 'company
     ;;  '(push 'company-robe company-backends))
     ;;(add-hook 'robe-mode-hook 'ac-robe-setup)
     
     ;;
     ;; (require 'helm)
     ;; (require 'helm-ls-git)
     (helm-mode 1)
     (global-set-key (kbd "M-x") #'helm-M-x)
     ;;(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
     (global-set-key (kbd "C-x C-f") #'helm-find-files)
     (global-set-key (kbd "C-w") #'helm-grep-do-git-grep)
     (global-set-key (kbd "C-x f") 'helm-ls-git-ls)
     (setq helm-ff-skip-boring-files t)
     (setq helm-ff-file-name-history-use-recentf t)
     (setq helm-boring-file-regexp-list
           '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$"
             "\\.so$" "\\.a$" "\\.elc$" "\\.fas$" "\\.fasl$" "\\.pyc$" "\\.pyo$" "node_modules"))

     (set-face-attribute 'helm-selection nil 
                    :background "yellow"
                    :foreground "black")

     (set-face-attribute 'helm-ff-file nil 
                         :foreground "white")


     ;; jsdoc
     (global-set-key (kbd "C-c i") 'js-doc-insert-function-doc)

     (require 'realgud)
     (load-file "~/.dotfiles/el/realgud-nodejs.el")
     (setq realgud:nodejs-command-name "node inspect")


     (setq ring-bell-function 'ignore)
     ;;(add-hook 'after-init-hook #'global-flycheck-mode)
     ;;(add-hook 'after-init-hook #'eslintd-fix-mode)
     ;;(add-to-list 'flycheck-disabled-checkers 'javascript-jshint)

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
     ;;(require 'auto-complete-config)
     ;;(add-to-list 'ac-dictionary-directories
     ;;            "~/.emacs.d/elpa/auto-complete-20170124.1845/dict/")
     ;;(ac-config-default)
     ;;(setq ac-ignore-case nil)
     ;;(add-to-list 'ac-modes 'enh-ruby-mode)
     ;;(add-to-list 'ac-modes 'web-mode)
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

     (defun vc-root-dir ()
       (let ((backend (vc-deduce-backend)))
         (and backend
              (ignore-errors
                (vc-call-backend backend 'root default-directory)))))

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

     (let ((root (ignore-errors (expand-file-name (get-closest-gemfile-root ".git")))))
       (when root
         (when (file-exists-p (format "%scoverage/lcov.info" root))
           (customize-set-variable 'coverlay:base-path "")
           (customize-set-variable 'coverlay:untested-line-background-color "#1c0101")
           (customize-set-variable 'coverlay:mark-tested-lines nil)
           (coverlay-load-file (format "%scoverage/lcov.info" root))
           (global-coverlay-mode))))

     (global-set-key (kbd "C-c c") 'global-coverlay-mode)

     ;; flycheck eslint_d / standard
     (require 'eslintd-fix)
     (use-package flycheck
                  :ensure t
                  :config (progn
                          (global-flycheck-mode)
                          (setq-default flycheck-disabled-checkers
                                        (append flycheck-disabled-checkers
                                                '(javascript-jshint)))
                          (setq-default flycheck-javascript-eslint-executable "eslint_d")
                          (setq-default flycheck-checker 'javascript-standard)
                          (let ((root (ignore-errors (expand-file-name (get-closest-gemfile-root ".eslintrc")))))
                            (when root
                              (setq-default flycheck-checker 'javascript-eslint)
                              (add-hook 'after-save-hook 'eslintd-fix)
                              ;; configure javascript-tide checker to run after your default javascript checker
                              ;;(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

))
                        
                          )
                  )


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

     (load-file "~/.dotfiles/el/mocha.el")
     (global-set-key (kbd "C-c l") 'mocha-test-at-point)
     (global-set-key (kbd "C-c k") 'mocha-test-file)
     (setq mocha-which-node "docker-compose exec app node")
     (setq mocha-environment-variables "NODE_ENV=test")
     (setq mocha-command "node_modules/.bin/nyc --cache --reporter=text-summary --reporter=html node_modules/.bin/mocha --exit --recursive --timeout 10000 --forbid-only")
     (setq mocha-debug-port "9230")

     ;; Load .env into emacs
     (let ((root (ignore-errors (expand-file-name (get-closest-gemfile-root ".git")))))
       (when root
         (when (file-exists-p (format "%s.env" root))
           (load-file "~/.dotfiles/el/parsenv.el")
           (parsenv-load-env (format "%s.env" root))
           (parsenv-adjust-exec-path))))

     (setq js2-mode-show-parse-errors nil)
     (setq js2-mode-show-strict-warnings nil)
     (require 'js2-mode)
     (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
     ;;(add-hook 'js-mode-hook 'js2-mode)
     ;;(add-hook 'js-mode-hook 'js2-minor-mode)
     (add-hook 'js2-mode-hook 'run-import-js)
     (add-hook 'js2-mode-hook 'ac-js2-mode)
     (setq ac-js2-evaluate-calls t)
     (add-hook 'js2-mode-hook
          (lambda ()
            (add-hook 'after-save-hook (lambda ()
                                         (import-js-fix)
                                         (flycheck-buffer)) nil 'make-it-local)
            (global-set-key (kbd "C-d") 'import-js-goto)
            ;;(require 'js2-highlight-vars-mode)
            (require 'js2-refactor)
            (js2-refactor-mode)
            (setq js2-skip-preprocessor-directives t)
            (js2r-add-keybindings-with-prefix "C-c C-a")
            )
          )
     (add-hook 'js2-mode-hook 'flow-minor-enable-automatically)
     (add-hook 'js2-mode-hook 'prettier-js-mode)
     (add-hook 'js2-mode-hook 'js2-highlight-vars-mode)

     (setq confirm-kill-processes nil)

     ;; projectile
     ;; (require 'grizzl)
     (projectile-global-mode)
     (setq projectile-enable-caching t)
     (setq projectile-completion-system 'grizzl)
     ;; Press Command-p for fuzzy find in project
     (global-set-key (kbd "C-x c") 'projectile-find-file)
     ;; Press Command-b for fuzzy switch buffer
     (global-set-key (kbd "C-x v") 'projectile-switch-to-buffer)

     ;; smartparens
     ;; (require 'smartparens-config)
     ;; (require 'smartparens-ruby)
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
     ;; (require 'scala-mode)
     ;; (require 'sws-mode)
     ;; (require 'jade-mode)
     (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
     (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

     ;; Undo-tree
     (global-undo-tree-mode)
(defun switch-theme (theme)
  ;; This interactive call is taken from `load-theme'
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme theme t))
     ;; Color-theme
     ;; (require 'color-theme)
     (color-theme-initialize)
     (add-to-list 'custom-theme-load-path "~/.dotfiles/el/emacs-color-theme-solarized")
     (switch-theme 'solarized-dark)
     (use-package panda-theme
       :ensure t
       :config
       (load-theme 'panda t)
       (custom-theme-set-faces 'panda
                               '(default ((t (:background "#141414"))))
                               '(js2-function-param ((t (:foreground "#35ffdc"))))
                               '(js2-object-property ((t (:foreground "#cdcdcd"))))
                          ))

     ;;(use-package color-theme :ensure t)
     ;;(use-package color-theme-solarized :ensure t)

     ;;(defun my/setup-color-theme ()
     ;;  (interactive)
     ;;  (load-theme 'solarized-dark t))

     ;;(eval-after-load 'color-theme (my/setup-color-theme))

     ;; Lua
     ;; (require 'lua-mode)
     (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
     (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

     ;; (require 'scala-mode)
     ;; (require 'rust-mode)

     ;; laggy af
     ;(require 'project-explorer)
     ;;(defalias 'nav 'project-explorer-open)
     ;;(global-set-key (kbd "C-w") 'nav)

     ;; (require 'find-file-in-repository)
     ;;(global-set-key (kbd "C-w") 'find-file)
     ;;(global-set-key (kbd "C-x f") 'find-file-in-repository)

     (defface mode-line-directory
       '((t :background "gray" :foreground "gray"))
       "Face used for buffer identification parts of the mode line."
       :group 'mode-line-faces
       :group 'basic-faces)
     (setq mode-line-position
            '(;; %p print percent of buffer above top of window, o Top, Bot or All
              ;; (-3 "%p")
              ;; %I print the size of the buffer, with kmG etc
              ;; (size-indication-mode ("/" (-4 "%I")))
              ;; " "
              ;; %l print the current line number
              ;; %c print the current column
              (line-number-mode ("%l" (column-number-mode ":%c")))))
     (defun shorten-directory (dir max-length)
       "Show up to `max-length' characters of a directory name `dir'."
       (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
             (output ""))
         (when (and path (equal "" (car path)))
           (setq path (cdr path)))
       (while (and path (< (length output) (- max-length 4)))
         (setq output (concat (car path) "/" output))
         (setq path (cdr path)))
       (when path
         (setq output (concat ".../" output)))
       output))
     (defvar mode-line-directory
  '(:propertize
    (:eval (if (buffer-file-name) (concat " " (shorten-directory default-directory 20)) " "))
                face mode-line-directory)
  "Formats the current directory.")
     (put 'mode-line-directory 'risky-local-variable t)
     (setq-default mode-line-buffer-identification
                   (propertized-buffer-identification "%b "))

     (setq-default mode-line-format
      '("%e"
        ;;mode-line-front-space
        ;; mode-line-mule-info
        ;;mode-line-client
        ;;mode-line-modified
        ;; mode-line-remote
        mode-line-frame-identification
        " "
        mode-line-directory
        mode-line-buffer-identification
        " "
        mode-line-position
        ;;(vc-mode vc-mode)  -- I use magit, not vc-mode
        ;;(flycheck-mode flycheck-mode-line)
        " "
        ;;mode-line-modes
        ;;mode-line-misc-info
        ;;mode-line-end-spaces))
        ))

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

     ;; (require 'smex)
     (smex-initialize)

     (global-set-key (kbd "M-x") 'smex)
     (global-set-key (kbd "M-X") 'smex-major-mode-commands)
     ;; This is your old M-x.
     (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
     )

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(load-file "~/.dotfiles/el/standardfmt.el")
;;(require 'standardfmt)

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

;; (require 'haskell-mode)
