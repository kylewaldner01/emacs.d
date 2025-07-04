;;; init-dired.el --- Dired customisations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default dired-dwim-target t)

;; Prefer g-prefixed coreutils version of standard utilities when available
(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))

(when (straight-use-package 'diredfl)
  (after-load 'dired
    (diredfl-global-mode)
    (require 'dired-x)))

;;     (define-key ctl-x-map "\C-j" nil)
;; (define-key ctl-x-4-map "\C-j" nil)

;; Hook up dired-x global bindings without loading it up-front
;;(define-key ctl-x-map "\C-j" 'dired-jump)
;;(define-key ctl-x-4-map "\C-j" 'dired-jump-other-window)
;; (define-key ctl-x-map "\C-j" nil)
;; (define-key ctl-x-4-map "\C-j" nil)

(after-load 'dired
  (setq dired-recursive-deletes 'top)
  (when *is-a-mac*
    (setq dired-use-ls-dired nil))
  (define-key dired-mode-map [mouse-2] 'dired-find-file)
  (define-key dired-mode-map (kbd "C-c C-q") 'wdired-change-to-wdired-mode))

;; Enable diff-hl in dired mode (diff-hl is installed in init-vc.el)
(after-load 'dired
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

(provide 'init-dired)
;;; init-dired.el ends here
