; from the template file /lusr/share/udb/pub/dotfiles/emacs
;
; This is just to give you some idea of the things you can set
; in your .emacs file.  If you want to use any of these commands
; remove the ";" from in front of the line.

;; To change the font size under X.
; (set-default-font "9x15")

;; Set your term type to vt100
; (load "term/vt100")

;; When in text (or related mode) break the lines at 80 chars
; (setq text-mode-hook 'turn-on-auto-fill)
; (setq fill-column 80)
(custom-set-variables
 '(indent-tabs-mode nil)          ;; Convert all tabs to spaces
 '(cua-remap-control-z nil)       ;; Prevent CUA-mode from overriding ctrl-z
 '(transient-mark-mode t)         ;; make the current 'selection' visible
 '(delete-selection-mode t)       ;; delete the selection area with a keypress
 '(inhibit-startup-screen t))     ;; No startup screen

(custom-set-faces)

(cua-mode t)

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

;; Indent dat buffer
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;; PACKAGES
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Auto-Complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; C-Eldoc (show function parameters)
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-to-list 'load-path "~/.dotfiles/el")

;; Jade
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; Color-theme
(require 'color-theme)
(color-theme-initialize)
(add-to-list 'custom-theme-load-path "~/.dotfiles/el/emacs-color-theme-solarized")
;;(load-file "~/.dotfiles/el/color-theme-twilight.el")
;;(color-theme-twilight)
(load-theme 'solarized-dark t)

;; List of Package Installs:
;; auto-complete
;; c-eldoc
;; jade-mode
;; floobits
