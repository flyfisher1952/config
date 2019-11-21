;------------------------------------------------------------------------------
; These are here so I can use them in any version of emacs.
;
(provide 'mll-functions)

(setq pascal-indent-level       2
      pascal-case-indent        2
      pascal-auto-newline       nil
      pascal-tab-always-indent  t
      pascal-auto-endcomments   t
      pascal-auto-lineup        '(all)
      pascal-toggle-completions nil
      pascal-type-keywords      '("array" "file" "packed" "char" "integer"
                                  "real" "string" "record" "class")
      pascal-start-keywords     '("begin" "end" "function" "procedure"
                                  "repeat" "until" "while" "read" "readln"
                                  "reset" "rewrite" "write" "writeln" "try")
      pascal-separator-keywords '("downto" "else" "mod" "div" "then" "except"
                                  "on" "finally"))

;- Set up pascal mode like I like it.
(defun my-pascal-mode-hook ()
  (setq comment-start "{ "
        comment-end " }"
        comment-column 32
        pascal-indent-level 2
        pascal-auto-endcomments nil))
(add-hook 'pascal-mode-hook 'auto-fill-mode)
(add-hook 'pascal-mode-hook 'my-pascal-mode-hook)

;------------------------------------------------------------------------------
;- Some funcs I like
;-
(defun tcl-proc-header ()
  (interactive)
  (insert (format "#%s\n" (make-string 78 ?~)))
  (insert "# Name:\t\t\n")
  (insert "#\n")
  (insert "# Description:\t\n")
  (insert "#\n")
  (insert "# Parameters:\n")
  (insert "#\n")
  (insert "#   \n")
  (insert "#\n")
  (insert "# Returns:\t\n")
  (insert "#\n")
  (insert "# Example:\t\n")
  (insert (format "#%s\n" (make-string 78 ?~)))
  (insert "#\n"))

(defun the-copyright (the-prefix of1 of2 of3 company address the-char)
  (interactive)
  (insert (format "%s%s\n" the-prefix (make-string 77 the-char)))
  (insert (format "%s%s%s\n" the-prefix (make-string of1 ? ) company))
  (insert (format "%s%s%s\n" the-prefix (make-string of2 ? ) address))
  (insert (format "%s%sAll rights reserved.\n" the-prefix (make-string of3 ? )))
  (insert (format "%s%s\n" the-prefix (make-string 77 ?-)))
  )

(defun the-id-section (the-prefix)
  (interactive)
  (insert (format "%sFile:\t$Id\$\n" the-prefix))
  (insert (format "%sAuthor:\t%s\n" the-prefix (user-full-name)))
  (insert (format "%sCreated:\t%s\n" the-prefix (current-time-string)))
  (insert (format "%s\n" the-prefix))
  (insert (format "%sDescription:\t\n" the-prefix))
  (insert (format "%s\n" the-prefix)))

(defun ada-header ()
  (interactive)
  (insert (format "--*- ada -*-\n"))
  (the-copyright  "-- " offset-1 offset-2 offset-3 the-company the-address ?*)
  (the-id-section "-- ")
  (insert (format "-- \n\n")))

(defun php-header ()
  (interactive)
  (insert (format "//-*- php -*-\n"))
  (the-copyright  "// " offset-1 offset-2 offset-3 the-company the-address ?*)
  (the-id-section "// ")
  (insert (format "// \n\n")))

(defun cc-header ()
  (interactive)
  (insert (format "/*-*- c++ -*-\n"))
  (the-copyright " *" offset-1 offset-2 offset-3 the-company the-address ?*)
  (the-id-section " * ")
  (insert (format " */\n\n")))

(defun c-like-body ()
  (insert (format " * Program:\t%s\n" (buffer-name)))
  (insert (format " * Author:\t%s\n" (user-full-name)))
  (insert (format " * Created:\t%s\n" (current-time-string)))
  (insert (format " *\n"))
  (insert (format " * Description:\t\n"))
  (insert (format " *\n"))
  (insert (format " * $Log$\n"))
  (insert (format " %s/\n" (make-string 77 ?*))))

(defun pascal-header ()
  (interactive)
  (insert (format "{-*- pascal -*-\n"))
  (the-copyright  " - " offset-1 offset-2 offset-3 the-company the-address ?-)
  (the-id-section " - ")
  (insert (format " -}\n")))

(defun sh-like-body ()
  (insert (format "# Program:\t%s\n" (buffer-name)))
  (insert (format "# Author:\t%s\n" (user-full-name)))
  (insert (format "# Created:\t%s\n" (current-time-string)))
  (insert (format "#\n"))
  (insert (format "# Description:\t\n"))
  (insert (format "#\n"))
  (insert (format "# $Log$\n"))
  (insert (format "%s\n" (make-string 79 ?#))))

(defun tcl-body ()
  (insert (format "# Program:\t%s\n" (buffer-name)))
  (insert (format "# Author:\t%s\n" (user-full-name)))
  (insert (format "# Created:\t%s\n" (current-time-string)))
  (insert (format "#\n"))
  (insert (format "# Description:\t\n"))
  (insert (format "#\n"))
  (insert (format "# Attached:\t\n"))
  (insert (format "#\n"))
  (insert (format "# External Procedures:\n"))
  (insert (format "#\n"))
  (insert (format "#   NONE\n"))
  (insert (format "#\n"))
  (insert (format "# RPE Variables:\n"))
  (insert (format "#\n"))
  (insert (format "#   NONE\n"))
  (insert (format "#\n"))
  (insert (format "# Returns:\t\n"))
  (insert (format "#\n#\n"))
  (insert (format "# $Log$\n"))
  (insert (format "# %s\n" (make-string 77 ?#))))

(defun tcl-main-separator ()
  (interactive)
  (insert (format "#%s\n" (make-string 78 ?~)))
  (insert (format "#%s MAIN PROGRAM CODE SEGMENT %s\n"
                  (make-string 25 ?~) (make-string 26 ?~)))
  (insert (format "#%s\n" (make-string 78 ?~))))

(defun java-header ()
  (interactive)
  (insert (format "/**-*- java -*-\n"))
  (the-copyright " *" offset-1 offset-2 offset-3 the-company the-address ?*)
  (c-like-body))
  
(defun tcl-header ()
  (interactive)
  (insert (format "#-*- tcl -*-\n"))
  (the-copyright "# " offset-1 offset-2 offset-3 the-company the-address ?#)
  (tcl-body))

(defun sh-header ()
  (interactive)
  (insert (format "#-*- sh -*-\n"))
  (the-copyright "# " offset-1 offset-2 offset-3 the-company the-address ?#)
  (sh-like-body))
  
(defun mll-revert-buffer ()
  (interactive)
  (revert-buffer t t))

(defun mll-compare-windows ()
  (interactive)
  (compare-windows "-w"))
  
