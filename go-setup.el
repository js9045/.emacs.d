;;; package -- Summary
;;; Commentary:
;;;  https://engdocs.uberinternal.com/go/additional_setup_pages/editors.html
;;; Code:

(require 'go-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
;(require 'go-autocomplete)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;go-guru-definition
(define-key go-mode-map (kbd "M-.") 'godef-jump)
(define-key go-mode-map (kbd "M-,") 'pop-tag-mark)

(require 'go-complete)
(add-hook 'completion-at-point-functions 'go-complete-at-point)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'go-guru)

;; Inside a buffer of Go source code, select an expression of
;; interest, and type `C-c C-o d' (for "describe") or run one of the
;; other go-guru-xxx commands.  If you use `menu-bar-mode', these
;; commands are available from the Guru menu.

(go-guru-hl-identifier-mode)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

;; Golang support - from Uber
(defun uber-go-mode-hook ()
  "Uber Golang Hook."
  (whitespace-mode -1) ; don't highlight hard tabs
  (auto-complete-mode 1)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq
   gofmt-command "goimports"
   tab-width 2         ; display tabs as two-spaces
   indent-tabs-mode 1  ; use hard tabs to indent
   fill-column 100)    ; set a reasonable fill width
  )

(add-hook 'go-mode-hook 'uber-go-mode-hook)

;; Spell check.
(add-hook 'go-mode-hook 'flyspell-prog-mode)

;; Enable the project explorer side bar (don't forget about minimap-mode)
;(add-hook 'go-mode-hook 'project-explorer-open)

;; Make it readable.
;(add-hook 'project-explorer-mode-hook 'hl-line-mode)

;; also c.f. neotree-mode with neo-smart-open.
;;(add-hook 'gnus-group-mode-hook 'hl-line-mode)
;;https://www.emacswiki.org/emacs/SrSpeedbar
;; http://cedet.sourceforge.net/speedbar.shtml
;; lots of MODES.
;; also neotree
;; https://github.com/jaypei/emacs-neotree

;; Need it for switching branches.
(add-hook 'go-mode-hook 'global-auto-revert-mode)

(provide 'go-setup)
;;; go-setup.el ends here
