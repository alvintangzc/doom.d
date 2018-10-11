;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (tsis-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

;; 恢复evil的s/S，要用evil-define-key, define-key不行，a bit tricky，一个issue里抄来的
; (with-eval-after-load 'evil-snipe
;   (evil-define-key* '(normal) evil-snipe-mode-map
;                     "s" #'evil-substitute
;                     "S" #'evil-change-whole-line)
;   (define-key evil-normal-state-map "s" #'evil-substitute)
;   (define-key evil-normal-state-map "S" #'evil-change-whole-line))

(map!
  :n "C-x |"   #'toggle-window-split
  :n "C-]"   #'+lookup/definition
  :n "<f2>"  #'+doom-dashboard/open
  (:leader
    (:prefix "f"
      :desc "Save File":n "w" #'save-buffer)
    (:desc "Mark" :prefix "m"
      :desc "Highlight" :n  "k" #'symbol-overlay-put
      :desc "Cancel Highlight" :n  "c" #'symbol-overlay-remove-all)))
