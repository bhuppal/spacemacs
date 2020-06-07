;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;

;;
;; bash related functions
;;

(defun lpwd (&optional dir)
  "returns only the pwd path"
  (expand-file-name (or dir ".")))


(defun ls (&optional dir)
  "list files in directory"
  (directory-files (or dir ".")))

(defun projects-in (dir)
  "get full path of all dirs in dir - except . and .."
  (if (file-directory-p dir)
      (seq-filter #'file-directory-p (directory-files dir t "[a-z]"))
    '()))

(defun touch (FILENAME &optional DIR)
  "Creates a empty file if it does not exists, returns the file or nil"
  (let* ((PATH (if DIR (lpwd DIR) (lpwd)))
         (FILE (join-path PATH FILENAME)))
    (if (file-exists-p FILE)
        (progn (print "error: file already exists!") nil)
      (progn (write-region "" "" FILE) FILE))))


(defun echo-into (file text)
  ""
  (if (file-exists-p file)
      (progn (write-region text "" file) t)
    (progn (print "error: file does not exist!") nil)))
