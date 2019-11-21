;------------------------------------------------------------------------------
;- $Id: .emacs,v 1.9 1997/08/20 18:50:54 s814mll Exp $
;-
;- My emacs init file
;-
;- Look in the following URL for more info on Windows emacs.
;-      http://www.gnu.org/software/emacs/windows/ntemacs.html
;-

(defvar running-xemacs (string-match "Xemacs" (emacs-version)))
(cond (running-xemacs 
       (set-specifier default-toolbar-visible-p nil)
       (setq-default font-lock-maximum-decoration t)))

(defvar running-ntemacs (or (string-match "nt4." (emacs-version))
                            (string-match "nt5." (emacs-version))))

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (cons '( "\\.cs\\'" . csharp-mode ) auto-mode-alist ))
(setq auto-mode-alist (cons '("\\.pc\\'" . c-mode) auto-mode-alist))

;; GNU client/server stuff
;(require 'gnuserv)
;(gnuserv-start)

;- Pre-load the libraries that we are virtually certain we'll use.
(cond ((not (fboundp 'c-initialize-cc-mode)) (load-library "cc-mode")))
(cond ((not (fboundp 'global-font-lock-mode)) (load-library "font-lock")))
;(cond ((not (fboundp 'sqlplus)) (load-library "sql-mode")))

(put 'upcase-region 'disabled nil)	; allow up/downcase on regions
(put 'downcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(global-auto-revert-mode 1)

(column-number-mode 't)			; display column numbers
(line-number-mode t)			; display line numbers
(cond (running-ntemacs
       (setq ps-print-use-gs t)
       (setq ps-printer-name t)         ; Ghostscript doesn't understand -P
       (setq ps-lpr-command "C:/gs/gs7.04/bin/gswin32")
       (setq ps-lpr-switches '("-q" "-dNOPAUSE"
                               "-sDEVICE=laserjet"
                               "-r300"
                               "-sOutputFile=\\\\DRAGON\\HP_Front"
                               ))
                                        ; Setup the printing kludge for NT
       (setq lpr-command "c:\\pfe\\pfe32.exe") ; Use Programmer's File Editor as
					;  print tool
       (setq lpr-destination '("/p"))   ; PFE print only
       (setq ps-printer-name 'pipe)
       (setq tags-file "c:/My Documents/misys/5.5.1.45F/TAGS")
       (show-paren-mode 1)		; paren highlighting ON
       (transient-mark-mode nil)))	; marked region highlighting ON 

(setq-default c-basic-offset 4
	      indent-tabs-mode 't
	      comment-column 56)
(setq c++-mode-hook 'turn-on-auto-fill
      c-mode-hook 'turn-on-auto-fill
      c-recognize-knr-p nil
      user-full-name "Michael L Lockhart"
      case-replace nil
      complex-buffers-menu-p t
      default-fill-column 132
      display-time-echo-area t
      find-file-compare-truenames t
      find-file-use-truenames nil
      ;indent-tabs-mode nil		;- use spaces instead of tabs 
      java-mode-hook 'turn-on-auto-fill
      kept-new-versions 10
      kept-old-versions 5
      kill-whole-line t
      minibuffer-confirm-incomplete t
      minibuffer-max-depth nil
      next-line-add-newlines nil
      text-mode-hook 'turn-on-auto-fill
      version-control 't
      )

(load-library "mll-functions")

;------------------------------------------------------------------------------
;- Some handy key defs so its easy to map kbd macros to fkeys
;-
(global-set-key [f2] 'font-lock-fontify-buffer)

(fset 'do-compare-windows
   [?\C-a ?\C-n ?\C-x ?o ?\C-a ?\C-n ?\M-x ?m ?l ?l ?- ?c ?o ?m ?p ?a ?r ?e ?- ?w ?i ?n ?d ?o ?w ?s return])
(global-set-key [f3] 'advertised-undo)

(fset 'select-all
   "\C-x/`\C-xh\367\C-xj`")
(global-set-key [f4] 'select-all)

(fset 'foo-5
   [?\C-\M-s ?^ ?\\ ?( ?p ?r ?o ?c ?e ?d ?u ?r ?e ?\\ ?) ?\\ ?| ?\\ ?( ?f ?u ?n ?c ?t ?i ?o ?n ?\\ ?) ?\\ ?| ?\\ ?( ?c ?o ?n ?s ?t ?r ?u ?c ?t ?o ?r ?\\ ?) ?\C-f ?\C-b ?\M-f ?\M-b ?\C-  ?\C-\M-s ?\\ ?( ?; ?\C-? ?\C-? ?\C-? ?; ?\\ ?| ?( ?\\ ?| ?  ?\C-b ?\M-w ?\C-e ?\C-\M-s ?^ ?b ?e ?g ?i ?n ?\C-e return ?D ?e ?b ?u ?g ?A ?x ?. ?A ?d ?d ?L ?i ?n ?e ?  ?( ?' ?. backspace ?- ?- ?> ?  ?\C-y ?' ?) ?; ?\C-\M-s ?^ ?e ?n ?d ?; ?\C-a ?\C-o tab ?D ?e ?b ?u ?g ?A ?x ?. ?A ?d ?d ?L ?i ?n ?e ?  ?( ?' ?< ?- ?- ?  ?\C-y ?' ?) ?;])

(global-set-key [f5]  'foo-5)
(global-set-key [f6]  'foo-6)
(global-set-key [f7]  'foo-7)
(global-set-key [f8]  'foo-8)
(global-set-key [f9]  'foo-9)
(global-set-key [f10] 'foo-10)
(global-set-key [f11] 'foo-11)
(global-set-key [f12] 'foo-12)

; TBD - This breaks if there is a statment like 'exec sql execute dyn;'
(setq mll-ProC-re "exec\\W+sql\\W+\\(alter\\|at\\|connect\\|declare\\|delete\\|execute\\|fetch\\|insert\\|prepare\\|select\\|update\\)")
(defun mll-protect-ProC (&optional count)
"This func places comments before and after some Pro*C statements so that the indent program will leave them alone."
  (interactive "P")
  (if (equal count nil)
      (setq count 1))
  (while (> count 0)
    (re-search-forward mll-ProC-re)
    (setq match-str (match-string 1))
    (search-backward "exec")
    (beginning-of-line)
    (open-line 1)
    (insert "\t\t\t\t\t\t\t\t// *INDENT-OFF*")

    (if (or (equal match-str "execute") (equal match-str "EXECUTE"))
         (search-forward "end-exec;")   ;TBD - Test for success and optionally look for the next ";" if it fails.
      (search-forward ";"))
    (end-of-line)
    (insert "\n\t\t\t\t\t\t\t\t// *INDENT-ON*\n")
    (setq count (1- count))))

(global-set-key [f11] 'mll-protect-ProC)

;(if running-ntemacs
    (global-set-key [?\C-m] 'newline-and-indent)
;  (global-set-key [return] 'newline-and-indent))
(global-set-key [(control meta ?g)]     'goto-line)
(global-set-key [(control meta ?\%)]    'tags-query-replace)
(global-set-key [(meta ?s)]		'isearch-backward-regexp)
(global-set-key [(meta ?#)]		'query-replace-regexp)

;- embed the comment-region call here so global-set-key is easier to do
(defun my-uncomment-region ()
  (interactive)
  (comment-region (region-beginning) (region-end) -4))
(global-set-key [(control ?c) (meta ?c)] 'my-uncomment-region)

;------------------------------------------------------------------------------
;- customize indentation here
;-
(defun my-c-mode-common-hook ()
  ;- my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;- other customizations
  (setq tab-width 4
	c-basic-offset 4)
  (define-key c-mode-map [return] 'newline-and-indent)
  (define-key c-mode-map [backspace] 'c-electric-delete))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-ada-mode-common-hook ()
  ;- other customizations
  (setq tab-width 8)
  (define-key ada-mode-map [return] 'newline-and-indent))
(add-hook 'ada-mode-hook 'my-ada-mode-common-hook)

;------------------------------------------------------------------------------
; Set some frame defaults here.
;
; This lisp command will insert the string you want for whatever font you pick
; in the font selection dialog.
; (insert (prin1-to-string (w32-select-font)))
;
; "-outline-Courier New-normal-r-normal-normal-12-90-96-96-c-*-iso10646-1"
; "-raster-Fixedsys-normal-r-normal-normal-12-90-96-96-c-*-iso10646-1"
; "-outline-Lucida Console-normal-r-normal-normal-13-97-96-96-c-*-iso10646-1"
;
(setq default-frame-alist
      '((background-color . "white")
        (foreground-color . "black")
        (cursor-color . "red")
        (cursor-type . box)
	;(font . "-outline-Courier New-normal-r-normal-normal-12-90-96-96-c-*-iso10646-1")
	;(font . "-raster-Fixedsys-normal-r-normal-normal-12-90-96-96-c-*-iso10646-1")
	(font . "-outline-Lucida Console-normal-r-normal-normal-13-97-96-96-c-*-iso10646-1")
        ))

(custom-set-variables
 '(c-basic-offset 4)
 '(pascal-indent-level 2)
 '(comment-column 61 t)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(tcl-indent-level 4)
 '(global-font-lock-mode t nil (font-lock)))
(custom-set-faces
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "red"))))
 '(font-lock-string-face ((((class color) (background light)) (:foreground "DarkGreen"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:foreground "DarkBlue"))))
 '(custom-rogue-face ((((class color)) (:foreground "orange" :background "black"))))
 '(font-lock-type-face ((((class color) (background light)) (:foreground "brown4"))))
 '(font-lock-variable-name-face ((((class color) (background light)) (:foreground "DarkOrange"))))
 '(font-lock-function-name-face ((((class color) (background light)) (:foreground "blue")))))


(cond ((not (fboundp 'php-mode))(load-library "php-mode-102")))
