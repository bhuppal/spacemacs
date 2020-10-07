;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;

;;
;; global related functions
;;


;; yasnippet
(yas-global-mode 1)

;; flycheck
(global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
