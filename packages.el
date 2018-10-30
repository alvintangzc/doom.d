;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; common
(package! symbol-overlay)

;; code
(package! company)
(package! company-web)
(package! company-lsp)
(package! lsp-mode)
(package! lsp-ui)

;; language
;; c
(package! cquery)
(package! srefactor)

;; vue
(package! lsp-vue)

;; web
(package! web-beautify)

;; python
;(package! py-autopep8)
(package! lsp-python)

;; protobuf
(package! protobuf-mode)

;; rust
(package! lsp-rust)
