;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;
(load! "+bindings")
(load! "init-company")
(load! "init-web")
(load! "init-lsp")

; (setq package-archives
;         '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
;         ("melpa" . "https://elpa.emacs-china.org/melpa/")
;         ("org"   . "https://orgmode.org/elpa/")))
; set theme
(setq doom-theme 'doom-molokai)
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 14))

;; scorll 留10行
(setq scroll-margin 10)

(which-function-mode 1)

;;不产生备份文件
(setq make-backup-files nil)
;;不生成临时文件
(setq-default make-backup-files nil)

; 定义快捷键
(defun move-x-line ()
  (interactive)
  (forward-line 10)
  )

(defun back-x-line()
  (interactive)
  (forward-line -10)
  )

(global-set-key (kbd "C-j") 'move-x-line)
(global-set-key (kbd "C-k") 'back-x-line)

(which-function-mode 1)
(setq which-func-unknown "n/a")

;; .h .cpp jump
(add-hook 'c-mode-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))
(add-hook 'c++-mode-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))

;; use c style comment
(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))


(after! hl-line
  (set-face-background 'hl-line "#3e4446") )

;evil mode
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))


;; 退出不提示
(defun my-save-buffers-kill-emacs (&optional arg)
  "Offer to save each buffer(once only), then kill this Emacs process.
With prefix ARG, silently save all file-visiting buffers, then kill."
  (interactive "P")
  (save-some-buffers arg t)
  (and (or (not (fboundp 'process-list))
       ;; process-list is not defined on MSDOS.
       (let ((processes (process-list))
         active)
         (while processes
           (and (memq (process-status (car processes)) '(run stop open listen))
            (process-query-on-exit-flag (car processes))
            (setq active t))
           (setq processes (cdr processes)))
         (or (not active)
         (progn (list-processes t)
            (yes-or-no-p "Active processes exist; kill them and exit anyway? ")))))
       ;; Query the user for other things, perhaps.
       (run-hook-with-args-until-failure 'kill-emacs-query-functions)
       (or (null confirm-kill-emacs)
       (funcall confirm-kill-emacs "Really exit Emacs? "))
       (kill-emacs)))
(global-set-key (kbd "C-x C-c") 'my-save-buffers-kill-emacs)
;; end

(def-package! protobuf-mode
    :init (add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode)))

