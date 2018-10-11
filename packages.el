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
(package! company-lsp)
(package! lsp-mode)
(package! lsp-ui)
(package! cquery)

;vue
(package! lsp-vue)
