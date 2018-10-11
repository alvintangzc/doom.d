;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;
(load! "+bindings")
(load! "init-company")
(load! "init-web")
(load! "init-lsp")

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


;evil mode
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))

