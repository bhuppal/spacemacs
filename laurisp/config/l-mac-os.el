;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;

;;
;; mac-os related functions
;;


(when (memq window-system '(mac ns))
  (package-install 'exec-path-from-shell)
  (exec-path-from-shell-initialize))
