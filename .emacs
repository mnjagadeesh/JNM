;; general customization
(tool-bar-mode -1)
(column-number-mode 0)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(mouse-avoidance-mode 'banish)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.backups/emacs"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "conkeror")

;; mode line color
(custom-set-faces
 '(mode-line ((t (:foreground "#17B2FF")))))

;; rst mode
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))
;; rtf mode
(autoload 'rtf-mode "rtf-mode" "RTF mode" t)
(add-to-list 'auto-mode-alist
  '("\\.rtf$" . rtf-mode))

;; org mode
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook 'turn-on-predictive-mode)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords
  '((sequence "TODO" "CANCELED" "|" "IN PROCESS" "TESTING" "DONE" "DELEGATED")))
(require 'org-latex)
(setq org-export-latex-listings 'minted)
(add-to-list 'org-export-latex-packages-alist '("" "minted"))
(setq org-src-fontify-natively t)

;; setup ispell
(setq ispell-program-name "aspell")
(require 'ispell)

;; visual basic modes
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ; VBscript
(autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" .
                              vbnet-mode)) auto-mode-alist))

;; auto complete mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp//ac-dict")
(ac-config-default)

;; predictive mode
(add-to-list 'load-path "~/.emacs.d/predictive/")
;; dictionary locations
(add-to-list 'load-path "~/.emacs.d/predictive/latex/")
(add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
(add-to-list 'load-path "~/.emacs.d/predictive/html/")
(require 'predictive)

;; predictive mode customization
(custom-set-variables
 '(completion-auto-show (quote ((t . completion-show-menu)))) ;Enamble completion auto show in predictive mode.
 '(mouse-avoidance-banish-position (quote ((frame-or-window . frame) (side . right) (side-pos . 3) (top-or-bottom . bottom) (top-or-bottom-pos . 0))))
 '(scroll-bar-mode (quote nil)))	;Remove the scroolbar.

;; enable color theme in graphics mode
(when (display-graphic-p)
  (custom-set-variables
   '(custom-enabled-themes (quote (misterioso)))))

;; set font size based on machine name.
(when (string= system-name "xw8600-i3-Arch.Home")
  (set-default-font "DejaVu Sans Mono-16"))

(when (string= system-name "HPPG7-i3-Arch.Home")
  (set-default-font "DejaVu Sans Mono-8"))
