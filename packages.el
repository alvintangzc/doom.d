;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; common
(package! symbol-overlay)

;; language
;; wen
(package! css-eldoc)
(package! web-beautify)

;python
(package! py-autopep8)

;; code
(package! company)
(package! company-web)
(package! company-lsp)
(package! lsp-mode)
(package! lsp-ui)

; c
(package! cquery)

;vue
(package! lsp-vue)
