;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;

;;
;; tide related functions
;;

(defun my-tide-setup-hook ()
    (tide-setup)
    (eldoc-mode)
    (tide-hl-identifier-mode +1)

    (setq web-mode-enable-auto-quoting nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-attr-indent-offset 2)
    (setq web-mode-attr-value-indent-offset 2)
    (setq lsp-eslint-server-command '("node" (concat (getenv "HOME") "/var/src/vscode-eslint/server/out/eslintServer.js") "--stdio"))
    (set (make-local-variable 'company-backends)
         '((company-tide company-files :with company-yasnippet)
           (company-dabbrev-code company-dabbrev)))
    ;; (general-define-key
    ;;  :states 'normal
    ;;  :keymaps 'local
    ;;  :prefix ", ."
    ;;  "f" 'tide-fix
    ;;  "i" 'tide-organize-imports
    ;;  "u" 'tide-references
    ;;  "R" 'tide-restart-server
    ;;  "d" 'tide-documentation-at-point
    ;;  "F" 'tide-format

    ;;  "e s" 'tide-error-at-point
    ;;  "e l" 'tide-project-errors
    ;;  "e i" 'tide-add-tslint-disable-next-line
    ;;  "e n" 'flycheck-next-error
    ;;  "e p" 'flycheck-previous-error

    ;;  "r r" 'tide-rename-symbol
    ;;  "r F" 'tide-refactor
    ;;  "r f" 'tide-rename-file)
    ;; (general-define-key
    ;;  :states 'normal
    ;;  :keymaps 'local
    ;;  :prefix "g"
    ;;  :override t

    ;;  "d" 'tide-jump-to-definition
    ;;  "D" 'tide-jump-to-implementation
    ;;  "b" 'tide-jump-back)
    )

;; use rjsx-mode for .js* files except json
(add-to-list 'auto-mode-alist '("\\.js.*$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))



(add-hook 'rjsx-mode-hook 'my-tide-setup-hook)

;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'my-tide-setup-hook
          (lambda () (pcase (file-name-extension buffer-file-name)
                  ("tsx" ('my-tide-setup-hook))
                  (_ (my-web-mode-hook)))))
