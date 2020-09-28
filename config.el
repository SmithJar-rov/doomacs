;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(use-package elfeed-org
	     :ensure t
	     :config
	     (elfeed-org)
	     (setq rmh-elfeed-org-files (list "/home/jared/bureau/elfeed.org")))

(use-package elfeed
	     :ensure t
	     :bind (:map elfeed-search-mode-map
			 ("A" . bjm/elfeed-show-all)
			 ("S" . bjm/elfeed-show-system)
			 ("N" . bjm/elfeed-show-news)))

(use-package ewal)
;;(use-package ewal-doom-themes
;;	:straight (ewal-doom-themes
;;		    :host gitlab
;;		    :repo "jjzmajic/ewal"
;;		    :branch "develop"
;;		    :files ("doom-themes/*.el")
;;		    :depth full))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; settings for org-recur
;; Refresh org-agenda after rescheduling a task
(defun org-agenda-refresh ()
  "Refresh all `org-agenda' buffers."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
	(when (derived-mode-p 'org-agenda-mode)
	  (org-agenda-maybe-redo)))))
(defadvice org-schedule (after refresh-agenda activate)
	   "Refresh org-agenda"
	   (org-agenda-refresh))

;;email settings
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Log time a task was set to Done
(setq org-log-done (quote time))

;;Don't log the time a task was rescheduled or redeadlined
(setq org-log-redeadline nil)
(setq org-log-reschedule nil)

(setq org-read-date-prefer-future 'time)

(use-package org-recur
     :hook ((org-mode . org-recur-mode)
	    (org-agenda-mode . org-recur-agenda-mode))
     :demand t
     :config
     (define-key org-recur-mode-map (kbd "C-c d") 'org-recur-finish)
     ;; Rebind the 'd' key in org-agenda (default: 'org-agenda-day-view')
     (define-key org-recur-agenda-mode-map (kbd "d") 'org-recur-finish)
     (define-key org-recur-agenda-mode-map (kbd "C-c d") 'org-recur-finish)

     (setq org-recur-finish-done t
	   org-recur-finish-archive t))
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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(load-theme 'ewal-doom-one t)
(enable-theme 'ewal-doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds '("https://www.france24.com/fr/rss"))
 '(org-agenda-files
   '("~/bureau/leftovers.org" "~/bureau/roblox.org" "~/bureau/bills.org" "~/bureau/pentacene.org" "~/bureau/la.org" "~/bureau/mechanics.org" "~/bureau/electronics.org" "~/bureau/number.org" "~/bureau/recurring.org" "~/bureau/daily.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
