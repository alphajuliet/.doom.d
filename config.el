;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andrew Joyner"
      user-mail-address "andrew@alphajuliet.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 13)
      doom-variable-pitch-font (font-spec :family "Avenir Next" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-city-lights)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Set default window size to maximised
;; (add-hook 'window-setup-hook #'toggle-frame-maximized)
(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(load! "~/.doom.d/smartparens-keys.el")
(load! "~/.doom.d/nial/nial-mode.el")
(load! "~/.doom.d/unison-mode-emacs/unisonlang-mode.el")
(load! "~/.doom.d/unison-config.el")
(load! "~/.doom.d/prop-menu.el")

(add-to-list 'load-path "~/.doom.d/idris2-mode/")
; (load! "~/.doom.d/idris2-mode/idris2-mode.el")

; (add-to-list 'load-path (locate-user-emacs-file "idris2-mode"))
(use-package idris2-mode)

(map! :map vterm-mode-map "<deletechar>" #'vterm-send-delete)

(after! cider
  (set-popup-rules!
   '(("^\\*cider-repl"
      :side right
      :width 95
      :quit nil
      :ttl nil))))

;; The End
