;; Save the starting time...
(defvar *init-start-time* (current-time))

(setq load-path
      (append
       (list "~/.emacs.d/elisp/"
	     "/usr/local/share/emacs/site-lisp/"
	     "~/.local/share/emacs/site-lisp/")
       load-path))

;; no obnoxious tool bar
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

(set-background-color "black")
(set-foreground-color "white")

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Code styles
(load-file "~/.emacs.d/c-setup.el")

;; C styles
(load-file "~/.emacs.d/v-setup.el")

(cond
   ((string-equal system-type "darwin") ; Mac OS X
    (progn (message "Mac OS X"))
    (let ((default-directory "/usr/local/share/emacs/site-lisp/"))
      (normal-top-level-add-subdirs-to-load-path))
    (setq mac-option-modifier nil) ;; Default was meta
    (setq mac-command-modifier 'meta)
    )
)

;; SGML styles
(load-file "~/.emacs.d/sgml-setup.el")

;; From HomeBrew.
(require 'xcscope)
(setq cscope-do-not-update-database t)

(require 'company)
(require 'flycheck)
(require 'json-mode)
(require 'markdown-mode)

(require 'electric-spacing)
(require 'git-messenger)
(setq git-messenger:show-detail t)

(require 'helm)
(require 'emoji-cheat-sheet-plus)
(require 'gh)
(require 'gist)
(require 'git-modes)
(require 'go-mode-autoloads)

;; End From HomeBrew.

;; backups
(load-file "~/.emacs.d/backups.el")

;; saveplace
(load-file "~/.emacs.d/saveplace.el")

;; recentf
(load-file "~/.emacs.d/recentf.el")

;; doxymacs
(load-file "~/.emacs.d/doxymacs.el")

(require 'boxquote)

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(define-key esc-map "*" 'revert-buffer)
(define-key esc-map "z" 'compile)

(line-number-mode t)
(column-number-mode t)
(display-time-mode t)

(setq frame-title-format `(,(user-login-name) "@" ,(system-name) "  [%b]" ))

; http://superuser.com/questions/277956/emacs-variable-to-open-with-in-original-frame
(setq ns-pop-up-frames nil)

;; Spelling
(load-file "~/.emacs.d/spell.el")

;; set up a bunch of auto-mode-alist stuff
(load-file "~/.emacs.d/auto-mode-alist-setup.el")

;; Get the end time.
(defvar *init-end-time* (current-time))
;; Print init time.
(message "Init took %d seconds"
         (- (+ (lsh (car *init-end-time*) 16) (cadr *init-end-time*))
	    (+ (lsh (car *init-start-time*) 16) (cadr
						 *init-start-time*))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote text-mode))
 '(sgml-basic-offset 2)
 '(user-full-name "Alun Evans")
 '(user-mail-address "alun.evans@xockets.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
