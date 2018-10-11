;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; common
(package! symbol-overlay)

;; language
(package! css-mode)
(package! scss-mode)
(package! css-eldoc)
(package! json-mode)
(package! js2-mode)
(package! js2-refactor)
(package! web-mode)
(package! web-beautify)

;; code
(package! company)
(package! company-web)
(package! company-lsp)
(package! lsp-mode)
(package! lsp-ui)
(package! cquery)

;vue
(package! lsp-vue)
