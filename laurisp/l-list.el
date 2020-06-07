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

(defun head (list)
  ""
  (car list))

(defun tail (list)
  ""
  (cdr list))

(defun inc (n) "returns n+1" (+ 1 n))

(defun l-list--zip-reduce (acc element list2) ""
       )

(defun ordered-by-length (list-of-lists)
  "return a list of lists ordered by length"
  (sort list-of-lists (lambda (a b) "" (< (length a) (length b)))))


(defun zip (list1 list2 &optional acc)
  ""
  (if (not (or list1 list2))
      acc
    (zip (tail list1) (tail list2) (append acc (list (list (head list1) (head list2)))))))

(defun unzip (zipped-list &optional acc)
  "((a b) (c d)) => ((a c) (b d))"
  (if zipped-list
      (let* ((list1 (seq-map #'head zipped-list))
             (list2 (seq-map #'head (seq-map #'tail zipped-list))))
        (list list1 list2))))


