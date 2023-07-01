(use-package unisonlang-mode
  :mode "\\.u\\'"
  :ensure t
  :config
  
  (add-hook 'unisonlang-mode-hook 'lsp-deferred)
  (with-eval-after-load 'lsp-mode
    (add-to-list 'lsp-language-id-configuration
         '(unisonlang-mode . "unisonlang"))
    (setq-local lsp-tcp-connection-timeout 10)
    (lsp-register-client
     (make-lsp-client
      :new-connection
      (list
       :connect (lambda (filter sentinel name _environment-fn _workspace)
                  (let* ((host "localhost")
             (port 5757)
             (tcp-proc (lsp--open-network-stream host port (concat name "::tcp"))))

                    (set-process-query-on-exit-flag tcp-proc nil)
                    (set-process-filter tcp-proc filter)
                    (set-process-sentinel tcp-proc sentinel)
                    (cons tcp-proc tcp-proc)))
       :test? (lambda () t))
      :activation-fn (lsp-activate-on "unisonlang")
      :server-id 'unisonlang))))
