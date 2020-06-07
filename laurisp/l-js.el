;;
;; @author Laura Viglioni
;; 2020
;; GNU Public License 3.0
;;

;;
;; js related functions
;;

(defun jsx (filename)
  "returns filename.jsx"
  (file-extension filename "jsx"))

(defun js (filename)
  "returns filename.js"
  (file-extension filename "js"))

(defun jsx-test (filename)
  "returns filename.spec.jsx"
  (file-extension filename "spec.jsx"))


(defun react-template (component-name)
  "Creates a react component string template"
  (format "import React from 'react';
import PropTypes from 'prop-types';
\n\n
const %s = ({}) => {
    return (<div/>);
};\n
%s.propTypes = {};\n
\nexport default %s;" component-name component-name component-name))



(defun create-react-component (component-name dir)
  ""
  (interactive "sInsert component name: \nDWhere? " )
  (let* ((filename (jsx component-name))
         (file (touch filename dir)))
    (echo-into file (react-template component-name))))

 
(defun import-file-js (component file-name)
  ""
  (interactive "sWhat do you want to import? \nfFrom? ")
  (let* ((path (remove-suffix (relative-path (buffer-file-name) file-name)))
         (imp (format "import %s from '%s';\n" component path))
         (current-point (+ (point) (length imp))))
    (progn
      (beginning-of-buffer)
      (search-forward-regexp "^$")
      (insert imp)
      (goto-char current-point))))

