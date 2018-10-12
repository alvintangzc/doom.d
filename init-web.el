;;; ~/.doom.d/init-web.el -*- lexical-binding: t; -*-

(after! css-mode
   (setq css-indent-offset 2))

;; Major mode for editing web templates
(after! web-mode
  (add-to-list 'auto-mode-alist '("\\.\\(phtml\\|php|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\)$" . web-mode))
;  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'lsp-vue-enable))

;; Format HTML, CSS and JavaScript/JSON by js-beautify
(def-package! web-beautify
  :init
  (with-eval-after-load 'js-mode
    (bind-key "C-c b" #'web-beautify-js js-mode-map))
  (with-eval-after-load 'js2-mode
    (bind-key "C-c b" #'web-beautify-js js2-mode-map))
  (with-eval-after-load 'json-mode
    (bind-key "C-c b" #'web-beautify-js json-mode-map))
  (with-eval-after-load 'web-mode
    (bind-key "C-c b" #'web-beautify-html web-mode-map))
  (with-eval-after-load 'sgml-mode
    (bind-key "C-c b" #'web-beautify-html html-mode-map))
  (with-eval-after-load 'css-mode
    (bind-key "C-c b" #'web-beautify-css css-mode-map))
  :config
  ;; Set indent size to 2
  (setq web-beautify-args '("-s" "2" "-f" "-")))

(def-package! rainbow-mode
  :diminish rainbow-mode
  :hook ((emacs-lisp-mode web-mode css-mode) . rainbow-mode))
