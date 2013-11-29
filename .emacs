(set-default-font "DejaVu Sans Mono-16")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#17B2FF")))))

;; rst mode
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))
;; rtf-mode
(autoload 'rtf-mode "rtf-mode" "RTF mode" t)
(add-to-list 'auto-mode-alist
  '("\\.rtf$" . rtf-mode))

;; org-mode
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords
  '((sequence "TODO" "CANCELED" "|" "IN PROCESS" "TESTING" "DONE" "DELEGATED")))
(require 'org-latex)
(setq org-export-latex-listings 'minted)
(add-to-list 'org-export-latex-packages-alist '("" "minted"))
(setq org-src-fontify-natively t)

;; visual-basic-mode
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ; VBscript

(autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" .
                              vbnet-mode)) auto-mode-alist))

;; Adding major modes
(add-to-list 'load-path "~/.emacs.d/lisp/")     ;Add custom major mode .el path
(setq ispell-program-name "aspell")
(require 'ispell)
(require 'linum+)
(global-linum-mode 1)

;; (dolist (hook '(text-mode-hook))
;;       (add-hook hook (lambda () (flyspell-mode 1))))
;;     (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
;;       (add-hook hook (lambda () (flyspell-mode -1))))

;; Adding auto complete
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp//ac-dict")
(ac-config-default)

;; ac-ispell
;; Completion words longer than 4 characters
(require 'ac-ispell)
(custom-set-variables
'(ac-ispell-requires 4))

(eval-after-load "auto-complete"
'(progn
(ac-ispell-ac-setup)))
(add-hook 'org-mode-hook 'ac-ispell-ac-setup)

(when (display-graphic-p)
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(custom-enabled-themes (quote (misterioso)))))
