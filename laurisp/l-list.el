;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;


;;
;; List related functions
;;

(defun contains (list element)
  "returns t/nil if element is in list"
  (bool (member element list)))

(defun not-contains (list element)
  "returns t/nil if element is not in list"
  (not (contains list element)))
 
(defun list-difference (list1 list2)
  "returns a list with elements that are in list1 but not in list2"
  (seq-filter (lambda (el) (not-contains list2 el)) list1))
