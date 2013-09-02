(defun fontify-frame (frame)
(set-frame-parameter frame 'font "DejaVu Sans Mono-10")
)

(custom-set-variables
)

(custom-set-faces
;; '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 80 :width normal))))     ;Set the buffer font 
;; '(mode-line ((t (:background "#17B2FF" :foreground "black" :box (:line-width -1 :style released-button)))))
;; '(mode-line ((t(:foreground "#17B2FF" :box (:line-width -1 :style released-button)))))
 '(mode-line ((t(:foreground "#17B2FF"))))
)
;; rst mode
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))
;; rtf-mode
(autoload 'rtf-mode "rtf-mode" "RTF mode" t)
(add-to-list 'auto-mode-alist
  '("\\.rtf$" . rtf-mode))

;; Adding major modes
(add-to-list 'load-path "~/.emacs.d/lisp/")     ;Add custom major mode .el path
(setq ispell-program-name "aspell")
(require 'ispell)
(require 'linum+)
(require 'gnus)

(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))
    (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
      (add-hook hook (lambda () (flyspell-mode -1))))
