(load-file (car (directory-files-recursively "./" "lists\\.el")))

;; import all files 

(defun load-all ()
  "load all files except "
  (let* ((all-files (directory-files "./" t "\\.el$"))
         (files-not-to-import
          (directory-files "./" t
                           (rx (or "laurisp.el" (eval (concat (file-name-base) ".el")) "#"))))
         (files-to-import (list-difference all-files files-not-to-import)))
    (dolist (laurisp-file files-to-import)
      (load-file laurisp-file))))

(load-all)

(provide 'laurisp)

