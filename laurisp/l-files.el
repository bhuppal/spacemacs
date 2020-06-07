;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;


;;
;; Files related functions
;;

;;
;; opening files
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


;;
;; inserting on file
;;

(defun insert-text-on-point (text)
    "insert text on where cursor stands"
    (insert text))


(defun remove-suffix (file)
  "remove suffix of file"
  (replace-regexp-in-string "\\.[a-z]*$" ""  file))


(defun new-laurisp-file (name dir)
  "create laurisp file"
  (interactive "sInsert filename: \nDWhere? ")
  (let* ((filename (concat "l-" name ".el"))
         (file (touch filename dir)))
    (echo-into file (format ";;\n;; @author Laura Viglioni\n;; 2020\n;; GNU Public License 3.0\n;;\n\n;;\n;; %s related functions\n;;\n\n" name))
    (find-file file)))


(defun relative-path (file1 file2)
  ""
  (let* ((path1-list (split-string (file-truename file1) "/"))
         (path2-list (split-string (file-truename file2) "/"))
         (zipped-path (zip path1-list path2-list))
         (diff-path (seq-filter (lambda (pair) "" (not (equal (head pair) (head (tail pair)))))  zipped-path))
         (unzipped (unzip diff-path))
         (pre-path1  (nbutlast (seq-filter #'bool (head unzipped)) 1))
         (pre-path2  (seq-filter #'bool (head (tail unzipped))))
         (path1 (concat "./" (s-join "/" (seq-map (lambda (el) "" "..") pre-path1))))
         (filename (head (last pre-path2)))
         (path2 (concat (s-join "/" pre-path2)))
         (relative-path (join-path path1 path2)))
    relative-path))

;; (defun teste ()
;; ""
;; (interactive)
;; (let* ((buf (get-buffer-create "*teste*"))
;;        )

;;   ;; (read-str (get-key))
;;   (call-interactively (read-char))
;;   )
;; )
;; (defun read-str (char)
;;   (progn
;;     (print char)
;;     (if (equal char "^M")
;;        char
;;       (get-key))))

;; (defun get-key ()  (read-key-sequence "Find File: "))

;; (defun teste-action (candidate)
;;   "Persistent action for file-related functionality.

;; Previews the contents of a file in a temporary buffer."
;;   (let ((buf (get-buffer-create " *helm-projectile persistent*")))
;;     (cl-flet ((preview (candidate)
;;                        (switch-to-buffer buf)
;;                        (setq inhibit-read-only t)
;;                        (erase-buffer)
;;                        (insert-file-contents candidate)
;;                        (let ((buffer-file-name candidate))
;;                          (set-auto-mode))
;;                        (font-lock-ensure)
;;                        (setq inhibit-read-only nil)))
;;       (if (and (helm-attr 'previewp)
;;                (string= candidate (helm-attr 'current-candidate)))
;;           (progn
;;             (kill-buffer buf)
;;             (helm-attrset 'previewp nil))
;;         (preview candidate)
;;         (helm-attrset 'previewp t)))
;;     (helm-attrset 'current-candidate candidate)))
