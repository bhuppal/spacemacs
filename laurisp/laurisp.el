;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;

(require 'seq)

;; import all laurisp files 
(let* ((all-files (directory-files-recursively "~/laurisp" "^[a-z\\-].*\\.el$"))
       (loaded-files
        (mapcar (lambda (laurisp-file)
                  (if (not (string-match-p "laurisp\\.el" laurisp-file))
                      (load-file laurisp-file)
                    t))
                all-files)))
  (if (seq-reduce (lambda (acc val) (and acc val)) loaded-files t)
      "laurisp files loaded!"
    "an error has ocurred"))





(provide 'laurisp)

