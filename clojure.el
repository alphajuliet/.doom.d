;; clojure.el

(defun save-eval-repl ()
  (save-buffer)
  (cider-eval-buffer)
  (cider-switch-to-repl-buffer))

(map! "C-c C-," 'save-eval-repl)
