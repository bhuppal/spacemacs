;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;


;;
;; Files related functions
;;

(defun open-spacemacs-config ()
    "opens .spacemacs file"
    (interactive)
    (find-file "~/.spacemacs"))

(defun open-skhd-config ()
  "opens .skhdrc file"
  (interactive)
  (find-file "~/../.skhdrc"))

(defun open-yabai-config ()
  "opens .yabairc file"
  (interactive)
  (find-file "~/../.yabairc"))

(defun open-zsh-config ()
  "opens .zshrc file"
  (interactive)
  (find-file "~/../.zshrc"))

(defun open-laurisp ()
  "opens laurisp.el file"
  (interactive)
  (find-file "~/laurisp/laurisp.el"))
