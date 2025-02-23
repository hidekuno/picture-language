(defun py2lisp ()
  (interactive)
  (if (use-region-p)
      (let ((start (region-beginning))
            (end (region-end)))

        (defun str-replace(word r-word)
          (goto-char start)
          (while (and (search-forward word end t))
            (replace-match r-word nil t)))

        (save-excursion
          (str-replace ")" "")
          (str-replace ".," ".0,")
          (str-replace "      " "")
          (str-replace "array(" "")
          (str-replace "," "")
          (str-replace "[" "(")
          (str-replace "]" ")")

          (str-replace ".)" ".0)")
          (str-replace "\n" "")))
    (message "No region selected.")))
