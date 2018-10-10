;;; ~/.doom.d/init-lsp.el -*- lexical-binding: t; -*-

(def-package! lsp-mode
  :diminish lsp-mode
  :config
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t)

  ;; Restart server/workspace in case the lsp server exits unexpectedly.
  ;; https://emacs-china.org/t/topic/6392
  (defun restart-lsp-server ()
    "Restart LSP server."
    (interactive)
    (lsp-restart-workspace)
    (revert-buffer t t)
    (message "LSP server restarted."))

  (defun my-set-projectile-root ()
  (when lsp--cur-workspace
    (setq projectile-project-root (lsp--workspace-root lsp--cur-workspace))))
  (add-hook 'lsp-before-open-hook #'my-set-projectile-root)
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

(def-package! lsp-ui
  :init
    (setq lsp-ui-sideline-enable nil)
    (setq lsp-ui-doc-enable nil)
  ;  (setq lsp-ui-flycheck-live-reporting nil)
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references))
  :hook (lsp-mode . lsp-ui-mode)
  :init (setq scroll-margin 0))

(def-package! company-lsp
  :after company
  :defines company-backends
  :init (cl-pushnew 'company-lsp company-backends))

(def-package! cquery
  :defines projectile-project-root-files-top-down-recurring
  :commands lsp-cquery-enable
  :hook ((c-mode c++-mode objc-mode) . lsp-cquery-enable)
  :config
  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-top-down-recurring
          (append '("compile_commands.json"
                    ".cquery")
                  projectile-project-root-files-top-down-recurring)))
   (setq cquery-sem-highlight-method 'font-lock)

   ;; For rainbow semantic highlighting
   (cquery-use-default-rainbow-sem-highlight)
   (setq cquery-extra-args '("--log-file=~/.cache/log/cq.log"))
   (setq cquery-cache-dir "~/.cache/cquery-cache"))

