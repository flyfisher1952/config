<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0051)http://www.theprogrammerstoolbox.com/emacsinit.html -->
<!-- Created by htmlize-0.62 in css mode. --><HTML><HEAD><TITLE>emacsinit.el</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<STYLE type=text/css>BODY {
	COLOR: #000000; BACKGROUND-COLOR: #ffffff
}
SPAN.type {
	COLOR: #36648b; BACKGROUND-COLOR: #ffffff
}
SPAN.warning {
	FONT-WEIGHT: bold; COLOR: #d02090; BACKGROUND-COLOR: #ffffff
}
SPAN.variable-name {
	COLOR: #b8860b; BACKGROUND-COLOR: #ffffff
}
SPAN.function-name {
	COLOR: #6a5acd; BACKGROUND-COLOR: #ffffff
}
SPAN.constant {
	COLOR: #6b8e23; BACKGROUND-COLOR: #ffffff
}
SPAN.keyword {
	COLOR: #00008b; BACKGROUND-COLOR: #ffffff
}
SPAN.string {
	COLOR: #8b0000; BACKGROUND-COLOR: #ffffff
}
SPAN.comment {
	COLOR: #8c8c8c; FONT-STYLE: italic; BACKGROUND-COLOR: #ffffff
}
</STYLE>

<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY><PRE><SPAN class=comment>;; -----------------------------------------------------------------------------
;; START OF FILE
;; -----------------------------------------------------------------------------
;;
;; Filename: emacsinit.el
;; Emacs initialization file
;; David Gallucci
;; work mailto:david.gallucci@nasdaq.com
;; home mailto:davidgallucci@hotmail.com
;; bus mailto:dgallucci@TheProgrammersToolbox.com
;;
;; -----------------------------------------------------------------------------
;; REVISION HISTORY
;; -----------------------------------------------------------------------------
;; $Author: administrator $
;; $RCSfile: emacsinit.el,v $
;; $Revision: 1.14 $
;;
;; $Log: emacsinit.el,v $
;; Revision 1.14  2001-11-22 19:32:47-05  administrator
;; Corrected contact email addresses. Added RCS tags.
;;
;; Revision 1.13  2001-11-10 13:10:55-05  administrator
;; Major rewrite. Updated source URL's, removed old code, chg'd bindings.
;;
;;
;; -----------------------------------------------------------------------------
;; OVERVIEW
;; -----------------------------------------------------------------------------
;;
;; This emacs initialization file is continually changing. It is mainly set up
;; to provide efficiency and convenience in C/C++ development. I have
;; attempted to give credit for pieces of code that are not mine where
;; appropriate. Emacs can do anything you need. Period! If you think Emacs is
;; just another choice among editors, you don't understand what Emacs is all
;; about. It is much, much, more than an editor. It is a complete environment
;; that is fully extensible, to say the least. To become proficient at using
;; and extending Emacs takes a little time, but the rewards in productivity
;; are huge!
;;
;; I have tried to organize this file into logical sections, while making it
;; instructional as well. I'm continually learning too, so if you see anything
;; in this file that I can improve on, please let me know. If you like any of
;; my snippets, let me know that too.
;;
;; -----------------------------------------------------------------------------
;; THE REAL .emacs FILE
;; -----------------------------------------------------------------------------
;;
;; This file is NOT my real .emacs file. This following is what my real .emacs
;; file looks like. It simply sets a few enviroment variables, then loads this
;; file - emacsinit.el. This allows me to easily configure Emacs for various
;; machines I work on.
;;
;; START .emacs
;; (setenv "HOME" "c:/emacs")
;; (setenv "CUSTOM" "c:/custom")
;; (setenv "GHOST" "c:/ghostgum")
;; (load-file "$CUSTOM/emacs/lisp/emacsinit.el")
;; END .emacs
;;
;; -----------------------------------------------------------------------------
;; REQUIRED FILES / PACKAGES NOT INCLUDED WITH GNU EMACS
;; -----------------------------------------------------------------------------
;;
;; FILE                         SOURCE
;; browse-kill-ring.el          http://web.verbum.org/~walters/
;; bs.el                        http://www.geekware.de/index3.html
;; color-theme.el               http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme
;; defaultbanner.el             http://youpou.lip6.fr/queinnec/WWW/elisp.html
;; defaultcontent.el            http://youpou.lip6.fr/queinnec/WWW/elisp.html
;; desktop-menu.el              http://www.geekware.de/index3.html
;; dmacro package               ftp://ftp.sgi.com/other/dmacro/
;; ebackup.el                   http://www.anc.ed.ac.uk/~stephen/emacs/ell.html
;; flame.el                     http://www.splode.com/~friedman/software/emacs-lisp/src/
;; framepop.el                  http://www.maths.lancs.ac.uk/~smithdm1/elisp/framepop.html
;; generic-dl.el                http://www.geekware.de/index3.html
;; ghostscript                  http://www.cs.wisc.edu/~ghost/index.htm
;; grabbox.el                   http://xsteve.exit.de/prg/emacs/grabbox.el
;; igrep.el                     All over! ( Kevin Rodgers &lt;kevinr@ihs.com&gt; )
;; jdok.el                      http://perso.wanadoo.fr/david.ponce/
;; pc-bufsw.el                  http://www.fi.uib.no/~boukanov/emacs/index.html
;; redo.el                      Usenet post. Author: Kyle E. Jones, February 1997
;; remember.el                  http://www.gci-net.com/users/j/johnw/emacs.html
;; savehist.el                  Usenet post. Author: Hrvoje Niksic &lt;hniksic@srce.hr&gt;
;; scroll-in-place.el           http://www.cs.utah.edu/~eeide/emacs/scroll-in-place.el.gz
;; todo.el                      http://youpou.lip6.fr/queinnec/WWW/elisp.html
;; toggle-source                http://www.gnusoftware.com/Emacs/Lisp/
;; unix utilities               http://unxutils.sourceforge.net/
;; visemacs                     http://atnetsend.ne.mediaone.net:8080/computing/VisEmacs/
;;
;; -----------------------------------------------------------------------------
;; INITIAL SETTINGS - SO EMACS CAN CONTINUE WITH THE REST OF THIS FILE
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; Append additional directories to load-path. This is where I place all of
;; the additional lisp code that is not part of the standard Emacs
;; package. This makes it easier to back-up my custom setup.
</SPAN>(add-to-list 'load-path (substitute-in-file-name <SPAN class=string>"$CUSTOM/emacs/lisp"</SPAN>))

<SPAN class=comment>;; Load gnuserv. The main purpose for this is to have a single instance of
;; Emacs. Files are sent to gnuclientw instead of Emacs which prevents
;; numerous Emacs frames from opening all over the place. This is required for
;; things such as running emacs as the default MSVC editor using VisEmacs. I
;; usually start emacs once in the morning, then keep it running all day as my
;; only editor.
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>gnuserv</SPAN>)
(gnuserv-start)
(setq gnuserv-frame (selected-frame))

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; LOAD REQUIRED PACKAGES - SLOWER THAN AUTOLOAD, BUT LESS POTENTIAL HASSLES
;; -----------------------------------------------------------------------------
</SPAN>
(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>auto-show</SPAN>)                    <SPAN class=comment>; for better horizontal scroll
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>browse-kill-ring</SPAN>)             <SPAN class=comment>; interactively selectable kill ring
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>bs</SPAN>)                           <SPAN class=comment>; nice alternative to c-x c-b
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>cl</SPAN>)                           <SPAN class=comment>; load miscellaneous elisp stuff
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>color-theme</SPAN>)                  <SPAN class=comment>; color theme package
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>defaultcontent</SPAN>)               <SPAN class=comment>; standard file templates
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>defaultbanner</SPAN>)                <SPAN class=comment>; allows common banner conrol in files
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>desktop-menu</SPAN>)                 <SPAN class=comment>; to manage multiple desktops
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>dmacro</SPAN>)                       <SPAN class=comment>; load dmacro for auto-expanding - cool!
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>ebackup</SPAN>)                      <SPAN class=comment>; for centrally located backup files
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>expand</SPAN>)                       <SPAN class=comment>; expand required for use with dmacro
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>flame</SPAN>)                        <SPAN class=comment>; for amusing literary (not!) diversions
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>framepop</SPAN>)                     <SPAN class=comment>; special frames for special buffers
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>generic-dl</SPAN>)                   <SPAN class=comment>; function selection menus
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>generic-x</SPAN>)                    <SPAN class=comment>; for font-locked .bat files
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>grabbox</SPAN>)                      <SPAN class=comment>; helps remember file paths, etc.
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>igrep</SPAN>)                        <SPAN class=comment>; igrep stuff
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>jdok</SPAN>)                         <SPAN class=comment>; stuff for writing doxygen comments
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>misc</SPAN>)                         <SPAN class=comment>; load miscellaneous stuff
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>pc-bufsw</SPAN>)                     <SPAN class=comment>; for c-tab buffer switching
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>redo</SPAN>)                         <SPAN class=comment>; for undo/redo ops similar to windoze
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>remember</SPAN>)                     <SPAN class=comment>; like electronic post-it notes
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>savehist</SPAN>)                     <SPAN class=comment>; remembers commands between sessions
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>todo</SPAN>)                         <SPAN class=comment>; manages todo list
</SPAN>(<SPAN class=keyword>require</SPAN> '<SPAN class=constant>toggle-source</SPAN>)                <SPAN class=comment>; toggle between .cpp and .h
</SPAN>
<SPAN class=comment>;; -----------------------------------------------------------------------------
;; ENVIRONMENT - DIRECTORY LOCS, SYSTEM INTERACTION BEHAVIOR, ETC.
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; set the common location for different desktops
</SPAN>(setq desktop-menu-directory (substitute-in-file-name <SPAN class=string>"$CUSTOM/emacs/desktop"</SPAN>))

<SPAN class=comment>;; stop ^M's from displaying in system shell window
</SPAN>(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

<SPAN class=comment>;; this prevents shell commands from being echoed
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>my-comint-init</SPAN> ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)

<SPAN class=comment>;; load minibuffer command history from previous session. savehist.el makes
;; Emacs remember minibuffer commands between sessions. Very handy utility by
;; Hrvoje Niksic. I grabbed it off of Usenet. You can search for savehist.el
;; in the usenet archive.
</SPAN>(savehist-load)

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; DISPLAY SETTINGS - THESE CONTROL HOW EMACS LOOKS
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; Install my color theme du jour - color-theme.el package is fantastic!
</SPAN>(color-theme-gtk-ide)

<SPAN class=comment>;; format title bar to show full path of current file
</SPAN>(setq-default frame-title-format
              (list '((buffer-file-name <SPAN class=string>" %f"</SPAN> (dired-directory
                                               dired-directory
                                               (revert-buffer-function <SPAN class=string>" %b"</SPAN>
                                               (<SPAN class=string>"%b - Dir:  "</SPAN> default-directory)))))))

<SPAN class=comment>;; set icon "tool tip" to show full path of current file
</SPAN>(setq-default icon-title-format frame-title-format)

<SPAN class=comment>;; set speedbar frame location and size
</SPAN>(setq speedbar-frame-parameters (quote
                                 ((minibuffer)
                                  (width          . 40)
                                  (border-width   . 0)
                                  (menu-bar-lines . 0)
                                  (unsplittable   . t))))

<SPAN class=comment>;; these are my settings for 17 inch monitor running 1024 x 768 resolution. If
;; you change font sizes, you'll probably have to tweak this.
</SPAN>(set-frame-height (selected-frame) 45)
(set-frame-width (selected-frame) 120)

<SPAN class=comment>;; defaults for all frames
</SPAN>(setq default-frame-alist
      '((font . <SPAN class=string>"-outline-Courier New-normal-r-normal-normal-11-82-96-96-c-*-iso8859-15"</SPAN>)
        (cursor-color . <SPAN class=string>"red"</SPAN>)))

<SPAN class=comment>;; I prefer to use a bar rather than a block for the cursor
</SPAN>(<SPAN class=keyword>cond</SPAN> (window-system
       (<SPAN class=keyword>progn</SPAN>
         (setq default-frame-alist
               (append default-frame-alist
                       '((cursor-type . bar))))
         (setq initial-frame-alist
               '((cursor-type . bar))))))

<SPAN class=comment>;; add Emacs close confirmation
</SPAN>(setq kill-emacs-query-functions
      (cons (<SPAN class=keyword>lambda</SPAN> () (yes-or-no-p <SPAN class=string>"Ya sure bout that jerky?"</SPAN>))
            kill-emacs-query-functions))

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; PRINT CONFIGURATION - GHOSTSCRIPT REQUIRED!
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; tell Emacs where ghostscript print utility is located
</SPAN>(setq ps-lpr-command (substitute-in-file-name <SPAN class=string>"$GHOST/gsview/gsprint.exe"</SPAN>))

<SPAN class=comment>;; this line tells ghostscript to query which printer to use - which you may
;; not need if, for example, you only have one printer.
</SPAN>(setq ps-lpr-switches '(<SPAN class=string>"-query"</SPAN>))
(setq ps-printer-name t)

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; HANDY FUNCTIONS FOR EDITING REGULAR TEXT
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; fill current buffer
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>ewd-fill-buffer</SPAN> ()
  <SPAN class=string>"Fill current buffer (see `</SPAN><SPAN class=constant>fill-region</SPAN><SPAN class=string>' for details)"</SPAN>
  (interactive)
  (fill-region (point-min) (point-max)))

<SPAN class=comment>;; automatically kills trailing whitespace at file save including empty lines
;; at end of buffer. Thanks Roman Belenov &lt;roman@nstl.nnov.ru&gt;
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>kill-whitespace</SPAN> ()
  <SPAN class=string>"Kill trailing whitespace"</SPAN>
  (interactive)
  (<SPAN class=keyword>save-excursion</SPAN>
    (<SPAN class=keyword>progn</SPAN>
      (goto-char (point-min))
      (<SPAN class=keyword>while</SPAN> (re-search-forward <SPAN class=string>"[ \t]+$"</SPAN> nil t)
        (replace-match <SPAN class=string>""</SPAN> nil nil)))))
(add-hook 'write-file-hooks 'kill-whitespace)

<SPAN class=comment>;; makes a copy of current line and inserts it on next line. Thanks Eli Daniel.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>ewd-dup-line</SPAN>()
  <SPAN class=string>"Copy the current line and insert copy as the following line."</SPAN>
  (interactive)
  (<SPAN class=keyword>save-excursion</SPAN>
    (forward-line 1)
    (copy-from-above-command)
    (insert <SPAN class=string>"\n"</SPAN>)))

<SPAN class=comment>;; I map the standard C-w ( kill-region ) to this function. If the mark is
;; active, I call kill-region as normal. If the mark is not active, I kill the
;; entire line.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dg-kill-region</SPAN> ()
  <SPAN class=string>"Kills region if mark is active, otherwise kills entire line."</SPAN>
  (interactive)
  (<SPAN class=keyword>if</SPAN> mark-active
      (kill-region (region-beginning) (region-end))
    (<SPAN class=keyword>progn</SPAN>
      (beginning-of-line)
      (kill-line)
      (append-next-kill)
      (delete-char 1 1))))

<SPAN class=comment>;; I map the standard M-w ( kill-ring-save ) to this function. If the mark is
;; active, I call kill-ring-save as normal. If the mark is not active, I just
;; copy the entire current line.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dg-kill-ring-save</SPAN> ()
  <SPAN class=string>"Copies region if mark is active, otherwise copies entire line."</SPAN>
  (interactive)
  (<SPAN class=keyword>if</SPAN> mark-active
      (kill-ring-save (region-beginning) (region-end))
    (<SPAN class=keyword>progn</SPAN>
      (clipboard-kill-ring-save
       (clip-bol-position) (clip-eol-position)))))

<SPAN class=comment>;; these next 3 function were snarfed from google. They posters sig was:
;; Emilio Lopes (Emilio.Lopes@Physik.TU-Muenchen.DE). Credit to him.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>clip-bol-position</SPAN> ()
  <SPAN class=string>"Return minimum value of point for current line"</SPAN>
  (<SPAN class=keyword>save-excursion</SPAN>
    (<SPAN class=keyword>while</SPAN> (not (bolp))
      (forward-char -1))
    (point)))

(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>clip-eol-position</SPAN> ()
  <SPAN class=string>"Return maximum value of point for current line"</SPAN>
  (<SPAN class=keyword>save-excursion</SPAN>
    (<SPAN class=keyword>while</SPAN> (not (eolp))
      (forward-char 1))
    (forward-char 1)
    (point)))

(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>clipboard-copy-line</SPAN> ()
  <SPAN class=string>"Copy current line to kill-ring and X clipboard"</SPAN>
  (interactive)
  (clipboard-kill-ring-save
   (clip-bol-position) (clip-eol-position)))

<SPAN class=comment>;; Searches for word at cursor
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dg-find-word-at-cursor</SPAN> ()
  <SPAN class=string>"Finds word at cursor in either direction. Once this function is executing,
you can search in either direction for the word under the cursor. You can also
change the direction of the search mid-stream. Search direction is controlled
by the ',' (comma) and the '.' (period) keys. The comma key searches backwards
and the period key searches forwards. You can change the direction of the
search by simply hitting the key opposite to your current search
direction. The search is terminated when the last occurence in the current
direction is found, or when a key other than the comma or period has been
hit."</SPAN>
  (interactive)
  <SPAN class=comment>;; get user's choice of forward search or backward search
</SPAN>  (setq char (read-event <SPAN class=string>" "</SPAN>))
  (setq word (current-word))
  (<SPAN class=keyword>if</SPAN> (looking-at (regexp-quote word))
      (forward-char))
  (<SPAN class=keyword>while</SPAN> (or (eq char ?,) (eq char ?.))
    (<SPAN class=keyword>progn</SPAN>
      <SPAN class=comment>;; do search in selected direction...
</SPAN>      <SPAN class=comment>;; this one checks for forward
</SPAN>      (<SPAN class=keyword>if</SPAN> (eq char ?.)
          (<SPAN class=keyword>progn</SPAN>
            (<SPAN class=keyword>while</SPAN> (eq char ?.)
              (<SPAN class=keyword>progn</SPAN>
                (<SPAN class=keyword>if</SPAN> (not (search-forward word nil t))
                    (<SPAN class=keyword>progn</SPAN>
                      (message (format <SPAN class=string>"\"%s\" not found."</SPAN> word))
                      <SPAN class=comment>;; not found - break out of while
</SPAN>                      (setq char ?q))
                      <SPAN class=comment>;; else we did have a match
</SPAN>                  (<SPAN class=keyword>progn</SPAN>
                    (highlight-regexp word <SPAN class=string>"hi-yellow"</SPAN>)
                    (setq char (read-event <SPAN class=string>" "</SPAN>))
                    (<SPAN class=keyword>if</SPAN> (looking-at (regexp-quote word))
                        (forward-char)))
                  (unhighlight-regexp word))))))
      <SPAN class=comment>;; this one checks for backward
</SPAN>      (<SPAN class=keyword>if</SPAN> (eq char ?,)
          (<SPAN class=keyword>progn</SPAN>
            (<SPAN class=keyword>while</SPAN> (eq char ?,)
              (<SPAN class=keyword>progn</SPAN>
                (<SPAN class=keyword>if</SPAN> (not (search-backward word nil t))
                    (<SPAN class=keyword>progn</SPAN>
                      (message (format <SPAN class=string>"\"%s\" not found."</SPAN> word))
                      <SPAN class=comment>;; not found - break out of while
</SPAN>                      (setq char ?q))
                      <SPAN class=comment>;; else we did have a match
</SPAN>                  (<SPAN class=keyword>progn</SPAN>
                    (highlight-regexp word <SPAN class=string>"hi-yellow"</SPAN>)
                    (setq char (read-event <SPAN class=string>" "</SPAN>))
                    (<SPAN class=keyword>if</SPAN> (looking-at (regexp-quote word))
                        (forward-char)))
                  (unhighlight-regexp word))))))))
  <SPAN class=comment>;; make sure to remove any highlight!
</SPAN>  (unhighlight-regexp word))

<SPAN class=comment>;; Nukes current line
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dg-erase-line</SPAN> ()
  <SPAN class=string>"Kills current line. Does not push to kill-ring."</SPAN>
  (interactive)
  (beginning-of-line)
  (<SPAN class=keyword>while</SPAN> (not (eolp))
    (delete-char 1))
  (delete-char 1))

<SPAN class=comment>; automatically turn on auto-fill-mode when editing text files
</SPAN>(add-hook 'text-mode-hook 'turn-on-auto-fill)

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; BUFFER MANIPULATION AND GENERAL CONVENIENCE FUNCTIONS
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; print the cryptic(!) font name for Windows font.
</SPAN>(<SPAN class=keyword>if</SPAN> (eq window-system 'w32)
    (<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>ewd-get-x-font-name</SPAN> ()
      <SPAN class=string>"Select font from dialog box, then print X font name at point in current
buffer. The resulting string can then be used in other Emacs functions
requiring a font type."</SPAN>
      (interactive)
      (insert (prin1-to-string (w32-select-font)))))

<SPAN class=comment>;; replace "yes or no" prompt with "y or n" prompt
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>yes-or-no-p</SPAN> (arg)
  <SPAN class=string>"Allows letters 'y' or 'n' in response to prompts asking for either 'yes' or
'no'."</SPAN>
  (y-or-n-p arg))

<SPAN class=comment>;; kills current buffer without asking for confirmation. If current buffer
;; happens to be the scratch buffer it just erases the contents.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>kill-current-buffer</SPAN> ()
  <SPAN class=string>"Kills current buffer without asking for confirmation. If current buffer
happens to be the scratch buffer it just erases the contents."</SPAN>
  (interactive)
  (<SPAN class=keyword>if</SPAN> (equal (buffer-name) <SPAN class=string>"*scratch*"</SPAN>)
      (delete-region (point-min) (point-max))
    (kill-buffer (current-buffer))))

<SPAN class=comment>;; this is useful when you have a split window. This function will delete the
;; other window, which is the window that does not contain the cursor, and
;; make the window which does contain the cursor full size.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>kill-buffer-other-window</SPAN> (arg)
  <SPAN class=string>"Kill the buffer in the other window, and make the current buffer full size. If no
other window, kills current buffer."</SPAN>
  (interactive <SPAN class=string>"p"</SPAN>)
  (<SPAN class=keyword>let</SPAN> ((buf (<SPAN class=keyword>save-window-excursion</SPAN>
        (other-window arg)
        (current-buffer))))
    (delete-windows-on buf)
    (kill-buffer buf)))

<SPAN class=comment>;; this is also useful when you have a split window. This function will move
;; the cursor to the other window and delete the window from whence it came.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>kill-buffer-jump-other-window</SPAN> (arg)
  <SPAN class=string>"Kill this buffer and jump to other window."</SPAN>
  (interactive <SPAN class=string>"p"</SPAN>)
    (other-window arg)
    (kill-buffer-other-window arg))

<SPAN class=comment>;; Shut off message buffer. Note - if you need to debug emacs, comment these
;; out so you can see what's going on.
</SPAN>(setq message-log-max nil)
(kill-buffer <SPAN class=string>"*Messages*"</SPAN>)

<SPAN class=comment>;; here's a useful one - this gets rid of all the junk buffers that seem to
;; accumulate over the course of a day. I bind this to a key and when things
;; get too cluttered, I invoke the executioner!
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>delete-temp-buffers</SPAN> ()
  <SPAN class=string>"Delete temporary buffers."</SPAN>
  (interactive)
  (<SPAN class=keyword>let*</SPAN> ((buf-list
          '(<SPAN class=string>"*Help*"</SPAN> <SPAN class=string>"*Apropos*"</SPAN> <SPAN class=string>"*Completions*"</SPAN> <SPAN class=string>"*Summary*"</SPAN> <SPAN class=string>"*Registers*"</SPAN>
            <SPAN class=string>"*Compile-Log*"</SPAN> <SPAN class=string>"*Output*"</SPAN> <SPAN class=string>"*Newsgroups*"</SPAN> <SPAN class=string>"*Faces*"</SPAN> <SPAN class=string>"*Abbrevs*"</SPAN>
            <SPAN class=string>"*Ediff Registry*"</SPAN> <SPAN class=string>"*Directory*"</SPAN> <SPAN class=string>"*Kill Ring*"</SPAN> <SPAN class=string>"*Local Variables*"</SPAN>
            <SPAN class=string>"*Tags List*"</SPAN> <SPAN class=string>"*Zippy Apropos*"</SPAN> <SPAN class=string>"*Warning*"</SPAN> <SPAN class=string>"*Display-List*"</SPAN>
            <SPAN class=string>"*Disassemble*"</SPAN> <SPAN class=string>"*buffer-selection*"</SPAN> <SPAN class=string>"*Toplevel Definitions*"</SPAN>
            <SPAN class=string>"*temp*"</SPAN> <SPAN class=string>"*Display-Ring*"</SPAN> <SPAN class=string>" *Minibuf-1*"</SPAN> <SPAN class=string>"*Display-Table*"</SPAN>
            <SPAN class=string>"*Ibuffer*"</SPAN> <SPAN class=string>"*Shell Command Output*"</SPAN> <SPAN class=string>"*igrep*"</SPAN> <SPAN class=string>".grabbox"</SPAN>
            <SPAN class=string>"*Flame*"</SPAN> <SPAN class=string>"*info*"</SPAN> <SPAN class=string>"*compilation*"</SPAN>))
         (limit (length buf-list))
         (index 0)
         buff)
    (<SPAN class=keyword>while</SPAN> (&lt; index limit)
      (setq buff (get-buffer (nth index buf-list)))
      (<SPAN class=keyword>if</SPAN> buff
          (<SPAN class=keyword>progn</SPAN>
            (delete-windows-on buff nil)
            (kill-buffer buff)))
      (incf index))))

<SPAN class=comment>;; this is a list of all the buffers that I want to display in a separate
;; frame. I use framepop.el and it is great for this kind of thing.
</SPAN>(setq special-display-regexps '(<SPAN class=string>"*Shell Command Output*"</SPAN> <SPAN class=string>"*compilation*"</SPAN>
                                <SPAN class=string>"*buffer-selection*"</SPAN> <SPAN class=string>"*Tags List*"</SPAN> <SPAN class=string>"*Completions*"</SPAN>
                                <SPAN class=string>"*Flame*"</SPAN> <SPAN class=string>"*Remember*"</SPAN>))

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; IGREP STUFF - IF YOU WRITE CODE, IGREP IS GREAT FOR FINDING TEXT IN FILES!
;; -----------------------------------------------------------------------------
</SPAN>
(autoload 'igrep <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` PROGRAM to match EXPRESSION in FILES..."</SPAN> t)
(autoload 'igrep-find <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` via `find`..."</SPAN> t)
(autoload 'igrep-visited-files <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` ... on all visited files."</SPAN> t)
(autoload 'dired-do-igrep <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` on the marked (or next prefix ARG) files."</SPAN> t)
(autoload 'dired-do-igrep-find <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` via `find` on the marked (or next prefix ARG) directories."</SPAN> t)
(autoload 'Buffer-menu-igrep <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` on the files visited in buffers marked with '&gt;'."</SPAN> t)
(autoload 'igrep-insinuate <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"Define `</SPAN><SPAN class=constant>grep</SPAN><SPAN class=string>' aliases for the corresponding `</SPAN><SPAN class=constant>igrep</SPAN><SPAN class=string>' commands."</SPAN> t)
(autoload 'grep <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` PROGRAM to match EXPRESSION in FILES..."</SPAN> t)
(autoload 'egrep <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `egrep`..."</SPAN> t)
(autoload 'fgrep <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `fgrep`..."</SPAN> t)
(autoload 'agrep <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `agrep`..."</SPAN> t)
(autoload 'grep-find <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `grep` via `find`..."</SPAN> t)
(autoload 'egrep-find <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `egrep` via `find`..."</SPAN> t)
(autoload 'fgrep-find <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `fgrep` via `find`..."</SPAN> t)
(autoload 'agrep-find <SPAN class=string>"igrep"</SPAN>
  <SPAN class=string>"*Run `agrep` via `find`..."</SPAN> t)

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; CODE RELATED FUNCTIONS - THESE GET USED A LOT
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; this builds a tags table in the current directory. You can change the args
;; to etags to suit your needs. The dir command makes a list of source files (
;; *.h *.cpp ) in the current directory and pipes it via stdout to the etags
;; utility. The trailing hyphen to etags tells etags to read his input from
;; stdin. ( the /b switch tells dir to make a "bare" listing with nothing
;; except the file names. )
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>create-tags-here</SPAN>()
  <SPAN class=string>"(Re)Create tags file in same directory as current buffer."</SPAN>
  (interactive)
  (shell-command <SPAN class=string>"dir /b *.h *.cpp | etags -"</SPAN>))

<SPAN class=comment>;; these next two functions either add or remove a string in front of all
;; lines in the region. I like this better than the standard comment or
;; uncomment region commands because I can specify the strings I want to
;; use. Thanks to Eli Daniel.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>ewd-prepend</SPAN> (start end s)
  <SPAN class=string>"Add a string in front of all lines in the region."</SPAN>
  (interactive <SPAN class=string>"*r\nMEnter a string: "</SPAN>)
  (<SPAN class=keyword>save-excursion</SPAN>
    (<SPAN class=keyword>save-restriction</SPAN>
      (narrow-to-region
       (<SPAN class=keyword>progn</SPAN> (goto-char start) (beginning-of-line) (point))
       (<SPAN class=keyword>progn</SPAN> (goto-char end) (end-of-line) (point)))
      (goto-char (point-min))
      (beginning-of-line)
      (<SPAN class=keyword>while</SPAN> (not (eobp))
        (insert s)
        (forward-line 1)))))

(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>ewd-unprepend</SPAN> (start end s)
  <SPAN class=string>"Remove a string from the front of all lines in the region."</SPAN>
  (interactive <SPAN class=string>"*r\nMEnter a string: "</SPAN>)
 (<SPAN class=keyword>save-excursion</SPAN>
    (<SPAN class=keyword>save-restriction</SPAN>
      (narrow-to-region
       (<SPAN class=keyword>progn</SPAN> (goto-char start) (beginning-of-line) (point))
       (<SPAN class=keyword>progn</SPAN> (goto-char end) (end-of-line) (point)))
      (goto-char (point-min))
      (<SPAN class=keyword>while</SPAN> (not (eobp))
        (<SPAN class=keyword>if</SPAN> (looking-at (regexp-quote s))
            (delete-region (match-beginning 0) (match-end 0)))
        (forward-line 1)))))

<SPAN class=comment>;; copies sexp at cursor and stores in register for reuse
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dg-copy-sexp-at-cursor</SPAN> ()
  <SPAN class=string>"Copies sexp at cursor."</SPAN>
  (interactive)
  (<SPAN class=keyword>save-excursion</SPAN>
    (backward-sexp)
    (mark-sexp)
    (copy-to-register ?p (region-beginning) (region-end))))

<SPAN class=comment>;; replaces sexp at cursor with last sexp copied via sister function above
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dg-replace-sexp-at-cursor</SPAN> ()
  <SPAN class=string>"Deletes sexp at cursor and replaces it with last sexp copied via
dg-copy-sexp-at-cursor. If mark is currently active, replaces region."</SPAN>
  (interactive)
  (<SPAN class=keyword>save-excursion</SPAN>
    (<SPAN class=keyword>if</SPAN> mark-active
        (<SPAN class=keyword>progn</SPAN>
          (kill-region (region-beginning) (region-end))
          (insert-register ?p))
      (<SPAN class=keyword>progn</SPAN>
        (backward-sexp)
        (kill-sexp)
        (insert-register ?p)))))

<SPAN class=comment>;; Just go to tag at point and don't ask for soooo many confirmations!
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>find-tag-dont-ask</SPAN> ( )
  <SPAN class=string>"Find tag just like `</SPAN><SPAN class=constant>find-tag</SPAN><SPAN class=string>' but don't ask, just select the
word around point and run with it."</SPAN>
  (interactive)
  (<SPAN class=keyword>let</SPAN> ((default (funcall
                  (or find-tag-default-function
                      (get major-mode 'find-tag-default-function)
                      'find-tag-default))))
    (find-tag default)))

<SPAN class=comment>;; When I yank a piece of code ( known as paste in Windows lingo ) into an
;; existing function, I want it to indent itself to the proper level
;; automatically.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>smart-paste</SPAN> ()
  <SPAN class=string>"Insert code from kill ring and indent to proper level"</SPAN>
  (interactive)
  (yank)
  (c-indent-defun))

<SPAN class=comment>;; inserts a commented copy of the current region. Great for when you modify
;; sections of code but want to keep the original in case you need to roll
;; back the changes. Thanks to Wojciech Komornicki.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>comment-copy</SPAN> (beg end)
  <SPAN class=string>"Insert a commented copy of current region."</SPAN>
  (interactive <SPAN class=string>"r"</SPAN>)
  (goto-char beg)
  (insert (buffer-substring beg end))
  (comment-region beg end))

<SPAN class=comment>;; From Erik Naggum
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>forward-symbol</SPAN> (arg)
  <SPAN class=string>"Move point forward ARG symbols (backward if ARG is negative).
Normally returns t.
If an edge of the buffer is reached, point is left there
and nil is returned."</SPAN>
  (interactive <SPAN class=string>"p"</SPAN>)
  (<SPAN class=keyword>let*</SPAN> ((symbol <SPAN class=string>"_w"</SPAN>)
         (non-symbol (concat <SPAN class=string>"^"</SPAN> symbol)))
    (<SPAN class=keyword>while</SPAN> (&lt; arg 0)
      (skip-syntax-backward non-symbol)
      (skip-syntax-backward symbol)
      (incf arg))
    (<SPAN class=keyword>while</SPAN> (&gt; arg 0)
      (skip-syntax-forward non-symbol)
      (skip-syntax-forward symbol)
      (decf arg)))
  (not (or (eobp) (bobp))))

(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>backward-symbol</SPAN> (arg)
  <SPAN class=string>"Move point backward ARG symbols (forward if ARG is negative).
Normally returns t.
If an edge of the buffer is reached, point is left there
and nil is returned."</SPAN>
  (forward-symbol (- arg)))

<SPAN class=comment>;; insert header file template from specified directory. Both this function
;; and the next function (insert-cpp-template) are here for the
;; create-new-class function below.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>insert-header-template</SPAN> ()
  <SPAN class=string>"Insert template header file"</SPAN>
  (interactive)
  (insert-file-contents (substitute-in-file-name <SPAN class=string>"$CUSTOM/emacs/templates/header.h"</SPAN>)))

<SPAN class=comment>;; insert implementation file template from specified directory
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>insert-cpp-template</SPAN> ()
  <SPAN class=string>"Insert template cpp file"</SPAN>
  (interactive)
  (insert-file-contents (substitute-in-file-name <SPAN class=string>"$CUSTOM/emacs/templates/implementation.cpp"</SPAN>)))

<SPAN class=comment>;; create header and implementation files based on supplied classname
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>create-new-class</SPAN> (newclassname)
  <SPAN class=string>"Creates a new header file and corresponding implementation file in the
current directory based on the supplied class name."</SPAN>
  (interactive <SPAN class=string>"sClass Name: "</SPAN>)
  (<SPAN class=keyword>defvar</SPAN> <SPAN class=variable-name>hdr</SPAN>)
  (<SPAN class=keyword>defvar</SPAN> <SPAN class=variable-name>cpp</SPAN>)
  (find-file ( setq hdr ( concat newclassname <SPAN class=string>".h"</SPAN>)))
  (insert-header-template)
  (beginning-of-buffer)
  (replace-string <SPAN class=string>"foobar"</SPAN> newclassname)
  (find-file ( setq cpp ( concat newclassname <SPAN class=string>".cpp"</SPAN>)))
  (insert-cpp-template)
  (beginning-of-buffer)
  (replace-string <SPAN class=string>"foobar"</SPAN> newclassname))

<SPAN class=comment>;; if point is in a class definition, return the name of the class.
;; Otherwise, return nil. Big thanks to Elijah Daniel for this one.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>ewd-classname</SPAN> ()
  <SPAN class=string>"If the point is in a class definition, gets the name of the class.  Return
nil otherwise."</SPAN>
  (<SPAN class=keyword>save-excursion</SPAN>
    (<SPAN class=keyword>let</SPAN> ((brace (assoc 'inclass (c-guess-basic-syntax))))
      (<SPAN class=keyword>if</SPAN> (null brace) '()
        (goto-char (cdr brace))
        (<SPAN class=keyword>let</SPAN> ((class-open (assoc 'class-open (c-guess-basic-syntax))))
          (<SPAN class=keyword>if</SPAN> class-open (goto-char (cdr class-open)))
          (<SPAN class=keyword>if</SPAN> (looking-at <SPAN class=string>"^class[ \t]+\\([A-Za-z_][^ \t:{]*\\)"</SPAN>)
              (buffer-substring (match-beginning 1) (match-end 1))
            (<SPAN class=warning>error</SPAN> <SPAN class=string>"Error parsing class definition!"</SPAN>)))))))

<SPAN class=comment>;; insert function prototype in current header file and matching function
;; body in implementation file. More thanks to Eli Daniel.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>ewd-insert-new-method</SPAN> (rettype proto)
  <SPAN class=string>"Insert a function declaration into the current class header file at point,
along with matching function definition in the corresponding implementation
file, complete with class name and scope resolution operator.  This function
expects the implementation file to be named foo.cpp and in the same directory
as the current header file, foo.h."</SPAN>
  (interactive <SPAN class=string>"sReturn type:\nsPrototype: "</SPAN>)
  (<SPAN class=keyword>let</SPAN> ((classname (ewd-classname))
        (c-tab-always-indent t))
    (<SPAN class=keyword>if</SPAN> (null classname) (message <SPAN class=string>"Not in class definition!"</SPAN>)
      (<SPAN class=keyword>unless</SPAN> (string-equal rettype <SPAN class=string>""</SPAN>) (setq rettype (concat rettype <SPAN class=string>" "</SPAN>)))
      (insert rettype proto <SPAN class=string>";"</SPAN>)
      (c-indent-command)
      (<SPAN class=keyword>save-window-excursion</SPAN>
        (find-file (concat (file-name-sans-extension (buffer-file-name))
                           <SPAN class=string>".cpp"</SPAN>))
        (end-of-buffer)
        (insert <SPAN class=string>"\n\n"</SPAN>)
        (end-of-buffer)
        (insert rettype classname <SPAN class=string>"::"</SPAN> proto <SPAN class=string>"\n{\n}\n"</SPAN>)))))

<SPAN class=comment>;; Go to the matching parenthesis if on parenthesis otherwise insert %.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>match-paren</SPAN> (arg)
  <SPAN class=string>"Go to the matching parenthesis if on parenthesis otherwise insert %."</SPAN>
  (interactive <SPAN class=string>"p"</SPAN>)
  (<SPAN class=keyword>cond</SPAN> ((looking-at <SPAN class=string>"\\s\("</SPAN>) (forward-list 1) (backward-char 1))
        ((looking-at <SPAN class=string>"\\s\)"</SPAN>) (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>cust-list-tags</SPAN> ()
  <SPAN class=string>"Bring up tag list for current source file"</SPAN>
  (interactive)
  (<SPAN class=keyword>let</SPAN> (this-file)
    (<SPAN class=keyword>if</SPAN> (not (equal nil (setq this-file (buffer-file-name))))
        (list-tags (file-name-nondirectory this-file)))
    (message <SPAN class=string>"No file name associated with this buffer"</SPAN>)))

<SPAN class=comment>;; allows me to easily indent an entire region manually.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dg-indent-rigidly</SPAN> ()
  <SPAN class=string>"Indents region if mark is active."</SPAN>
  (interactive)
  (<SPAN class=keyword>if</SPAN> mark-active
      (indent-rigidly (region-beginning) (region-end) 4)))

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; COMPILING WITH MS VISUAL STUDIO
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; note that the lib and include environment variables must be set, and they
;; must point to all directories containing headers and static libs required
;; for your build
</SPAN>(setq compile-command <SPAN class=string>"NMAKE /f \"TestClasses.mak\" CFG=\"TestClasses - Win32 Release\""</SPAN>)
<SPAN class=comment>;;(setq compile-command "NMAKE /f \"TestClasses.mak\" CFG=\"TestClasses - Win32 Debug\"")
;; (setq compile-command "NMAKE /f \"SCTS.mak\" \"SCTS\" - Win32 Debug\"")
;; (setq compile-command "NMAKE /f \"SCTS.mak\" \"SCTS\" - Win32 Release\"")
;; (setq compile-command "NMAKE /f \"nqds_compare.mak\" \"nqds_compare\" - Win32 Debug\"")
;; (setq compile-command "NMAKE /f \"nqds_compare.mak\" \"nqds_compare\" - Win32 Release\"")
</SPAN>
<SPAN class=comment>;; -----------------------------------------------------------------------------
;; CODE RELATED SETTINGS - MAINLY GEARED TOWARD C/C++
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; tells Emacs which mode to use for which file type. this explicitly forces
;; these file types to invoke the modes I specify. This guarantees the
;; behavior I want when editing specific file types - source files in
;; particular.
</SPAN>(setq auto-mode-alist
      (append '((<SPAN class=string>"\\.C$"</SPAN>    . c++-mode)
                (<SPAN class=string>"\\.cc$"</SPAN>   . c++-mode)
                (<SPAN class=string>"\\.cpp$"</SPAN>  . c++-mode)
                (<SPAN class=string>"\\.cxx$"</SPAN>  . c++-mode)
                (<SPAN class=string>"\\.hxx$"</SPAN>  . c++-mode)
                (<SPAN class=string>"\\.h$"</SPAN>    . c++-mode)
                (<SPAN class=string>"\\.H$"</SPAN>    . c++-mode)
                (<SPAN class=string>"\\.hh$"</SPAN>   . c++-mode)
                (<SPAN class=string>"\\.idl$"</SPAN>  . c++-mode)
                (<SPAN class=string>"\\.ipp$"</SPAN>  . c++-mode)
                (<SPAN class=string>"\\.c$"</SPAN>    . c++-mode)
                (<SPAN class=string>"\\.java$"</SPAN> . java-mode)
                (<SPAN class=string>"\\.js$"</SPAN>   . java-mode)
                (<SPAN class=string>"\\.txt$"</SPAN>  . text-mode))
              auto-mode-alist))

<SPAN class=comment>;; the "gnu" coding style is just what I want - almost! The only changes I
;; want are offset levels of 4 instead of 2, and the open &amp; close braces to
;; not be indented. This syntax just takes the gnu style and makes these
;; specific changes.
</SPAN>(c-add-style <SPAN class=string>"standard"</SPAN>
             '(<SPAN class=string>"gnu"</SPAN>
               (c-echo-syntactic-information-p  . t)
               (c-toggle-hungry-state           . 1)
               (c-basic-offset                  . 4)
               (c-offsets-alist                 . ((substatement-open . 0)
                                                   (case-label        . +)
                                                   (block-close       . 0)))))

<SPAN class=comment>;; use the "slightly modified gnu style" as my default
</SPAN>(setq c-default-style <SPAN class=string>"standard"</SPAN>)

<SPAN class=comment>;; these are additional keywords that I want to be syntax-highlighted.
</SPAN>(setq c-font-lock-extra-types
      (append
       '(<SPAN class=string>"BOOL"</SPAN> <SPAN class=string>"LPCSTR"</SPAN> <SPAN class=string>"LPCTSTR"</SPAN> <SPAN class=string>"HRESULT"</SPAN> <SPAN class=string>"BYTE"</SPAN> <SPAN class=string>"DWORD"</SPAN> <SPAN class=string>"UINT"</SPAN> <SPAN class=string>"ULONG"</SPAN>
         <SPAN class=string>"bool"</SPAN> <SPAN class=string>"PCHAR"</SPAN> <SPAN class=string>"UCHAR"</SPAN> <SPAN class=string>"WORD"</SPAN> <SPAN class=string>"size_t"</SPAN> <SPAN class=string>"_int64"</SPAN> <SPAN class=string>"_unit64"</SPAN> <SPAN class=string>"bool"</SPAN>
         <SPAN class=string>"boolean"</SPAN> <SPAN class=string>"FILE"</SPAN> <SPAN class=string>"todo"</SPAN> <SPAN class=string>"TODO"</SPAN> <SPAN class=string>"BUG"</SPAN> <SPAN class=string>"FIXME"</SPAN> <SPAN class=string>"TRUE"</SPAN> <SPAN class=string>"FALSE"</SPAN> <SPAN class=string>"true"</SPAN>
         <SPAN class=string>"false"</SPAN>)
       c-font-lock-extra-types))

<SPAN class=comment>;; more C++ types to font-lock
</SPAN>(setq c++-font-lock-extra-types
      (append
       '(
         <SPAN class=string>"ios"</SPAN> <SPAN class=string>"string"</SPAN> <SPAN class=string>"rope"</SPAN> <SPAN class=string>"list"</SPAN> <SPAN class=string>"slist"</SPAN> <SPAN class=string>"deque"</SPAN> <SPAN class=string>"vector"</SPAN> <SPAN class=string>"set"</SPAN>
         <SPAN class=string>"multiset"</SPAN> <SPAN class=string>"map"</SPAN> <SPAN class=string>"multimap"</SPAN> <SPAN class=string>"hash"</SPAN> <SPAN class=string>"stack"</SPAN> <SPAN class=string>"queue"</SPAN> <SPAN class=string>"priority_queue"</SPAN>
         <SPAN class=string>"iterator"</SPAN> <SPAN class=string>"const_iterator"</SPAN> <SPAN class=string>"reverse_iterator"</SPAN> <SPAN class=string>"const_reverse_iterator"</SPAN>
         <SPAN class=string>"reference"</SPAN> <SPAN class=string>"const_reference"</SPAN> <SPAN class=string>"LPCTSTR"</SPAN> <SPAN class=string>"BYTE"</SPAN> <SPAN class=string>"WORD"</SPAN> <SPAN class=string>"DWORD"</SPAN> <SPAN class=string>"FIXME"</SPAN>
         <SPAN class=string>"true"</SPAN> <SPAN class=string>"false"</SPAN> <SPAN class=string>"private"</SPAN> <SPAN class=string>"protected"</SPAN> <SPAN class=string>"public"</SPAN> <SPAN class=string>"__forceinline"</SPAN> <SPAN class=string>"default"</SPAN>)
       c-font-lock-extra-types
       c++-font-lock-extra-types))

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; DMACRO SETTINGS - VERY COOL PACKAGE!!!
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; initialize dmacro stuff and make it available in C/C++ modes
</SPAN>(or (boundp 'c-mode-abbrev-table)
     (define-abbrev-table 'c-mode-abbrev-table ()))
(add-hook 'c-mode-hook '(<SPAN class=keyword>lambda</SPAN> () (expand-mode 1)))
(or (boundp 'c++-mode-abbrev-table)
     (define-abbrev-table 'c++-mode-abbrev-table ()))
(add-hook 'c++-mode-hook '(<SPAN class=keyword>lambda</SPAN> () (expand-mode 1)))

<SPAN class=comment>;; load my custom macros from my ( what else ) custom macro file
</SPAN>(dmacro-load (substitute-in-file-name <SPAN class=string>"$CUSTOM/emacs/lisp/cmacros.dm"</SPAN>))

<SPAN class=comment>;; turn macros into functions that auto-expand in place
</SPAN>(dmacro-command <SPAN class=string>"amain"</SPAN> nil 'dm-c-main)
(dmacro-command <SPAN class=string>"afor"</SPAN> nil 'dm-c-for)
(dmacro-command <SPAN class=string>"aswitch"</SPAN> nil 'dm-c-switch)
(dmacro-command <SPAN class=string>"adt"</SPAN> nil 'dm-c-timestamp)
(dmacro-command <SPAN class=string>"aif"</SPAN> nil 'dm-c-if)

<SPAN class=comment>;; Define my own expand -&gt; dmacro table
</SPAN>(<SPAN class=keyword>defconst</SPAN> <SPAN class=variable-name>my-c-abbrevs</SPAN>
  '(
    (<SPAN class=string>"amain"</SPAN> dm-c-main)
    (<SPAN class=string>"afor"</SPAN> dm-c-for)
    (<SPAN class=string>"aswitch"</SPAN> dm-c-switch)
    (<SPAN class=string>"adt"</SPAN> dm-c-timestamp)
    (<SPAN class=string>"aif"</SPAN> dm-c-if)
    (<SPAN class=string>"uns"</SPAN> <SPAN class=string>"unsigned "</SPAN>)
    (<SPAN class=string>"si"</SPAN> <SPAN class=string>"size_t "</SPAN>)
    (<SPAN class=string>"def"</SPAN> <SPAN class=string>"#define "</SPAN>)
    (<SPAN class=string>"inc"</SPAN> <SPAN class=string>"#include "</SPAN>)
    ))

(expand-add-abbrevs c-mode-abbrev-table my-c-abbrevs)
(expand-add-abbrevs c++-mode-abbrev-table my-c-abbrevs)

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; SET VARIABLES
;; -----------------------------------------------------------------------------
</SPAN>
(delete-selection-mode 1)                 <SPAN class=comment>; delete current selection if exists
</SPAN>(global-font-lock-mode t)                 <SPAN class=comment>; always do syntax coloring when possible
</SPAN>(put 'downcase-region 'disabled nil)      <SPAN class=comment>; enable lowercase conversions
</SPAN>(put 'upcase-region 'disabled nil)        <SPAN class=comment>; enable uppercase conversions
</SPAN>(set-default 'case-fold-search t)         <SPAN class=comment>; make searches case-INsensitive
</SPAN>(set-message-beep 'silent)                <SPAN class=comment>; shut off annoying beep
</SPAN>(setq auto-revert-mode t)                 <SPAN class=comment>; autorevert buffers if files change
</SPAN>(setq auto-save-interval 300)             <SPAN class=comment>; how many chars get typed before autosave
</SPAN>(setq backup-by-copying t)                <SPAN class=comment>; set style of backup
</SPAN>(setq blink-matching-paren-distance 51200)<SPAN class=comment>; distance to match paren as
</SPAN>(setq column-number-mode t)               <SPAN class=comment>; show column number in modeline
</SPAN>(setq comment-column 42)                  <SPAN class=comment>; sets start column for this kind of comment
</SPAN>(setq compilation-scroll-output t)        <SPAN class=comment>; scroll compile buffer to see live output
</SPAN>(setq default-fill-column 78)             <SPAN class=comment>; the column beyond which do word wrap
</SPAN>(setq default-major-mode 'text-mode)      <SPAN class=comment>; default mode is text mode
</SPAN>(setq default-truncate-lines t)           <SPAN class=comment>; don't wrap long lines when viewing
</SPAN>(setq delete-old-versions t)              <SPAN class=comment>; get rid of old versions of files
</SPAN>(setq fast-lock-save-events nil)          <SPAN class=comment>; don't save flc files
</SPAN>(setq find-file-run-dired t)              <SPAN class=comment>; run dired when find-file is a directory
</SPAN>(setq inhibit-startup-message t)          <SPAN class=comment>; no startup message
</SPAN>(setq kill-ring-max 20)                   <SPAN class=comment>; don't save too many kills
</SPAN>(setq line-number-display-limit 5000000)  <SPAN class=comment>; show line numbers even in very big files
</SPAN>(setq ls-lisp-dired-ignore-case t)        <SPAN class=comment>; emulate insert-directory completely in Emacs Lisp
</SPAN>(setq make-backup-files t)                <SPAN class=comment>; turn on file backup via ebackup.el
</SPAN>(setq next-screen-context-lines 1)        <SPAN class=comment>; # of lines of overlap when scrolling
</SPAN>(setq require-final-newline t)            <SPAN class=comment>; always terminate last line in file
</SPAN>(setq scroll-conservatively 1)            <SPAN class=comment>; scroll 1 line at a time
</SPAN>(setq scroll-preserve-screen-position t)  <SPAN class=comment>; make pgup/dn remember current line
</SPAN>(setq scroll-step 1)                      <SPAN class=comment>; so vertical scrolling is smooth
</SPAN>(setq show-paren-style 'parenthesis)      <SPAN class=comment>; highlight character, not expression
</SPAN>(setq tab-width 4)                        <SPAN class=comment>; set tabwidth to 4
</SPAN>(setq transient-mark-mode t)              <SPAN class=comment>; highlight selected region
</SPAN>(setq user-full-name <SPAN class=string>"David Gallucci"</SPAN>)    <SPAN class=comment>; That's me!
</SPAN>(setq version-control 'never)             <SPAN class=comment>; don't use version numbers for backup files
</SPAN>(setq w32-allow-system-shell t)           <SPAN class=comment>; Shut off warning messages when using system shell
</SPAN>(setq w32-pass-alt-to-system t)           <SPAN class=comment>; hit ALT ( Meta ) and release to activate menu
</SPAN>(setq-default indent-tabs-mode nil)       <SPAN class=comment>; use spaces (not tabs) for indenting
</SPAN>(show-paren-mode t)                       <SPAN class=comment>; highlight matching parenthesis
</SPAN>(standard-display-8bit 128 159)           <SPAN class=comment>; display Smartquotes, the Euro symbol and MS stuff
</SPAN>(which-function-mode)                     <SPAN class=comment>; displays name of current function in modeline
</SPAN>
<SPAN class=comment>;; -----------------------------------------------------------------------------
;; DIRED STUFF
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; Hit capital X to execute file at point
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dired-execute-file</SPAN> (<SPAN class=type>&amp;optional</SPAN> arg)
  (interactive <SPAN class=string>"P"</SPAN>)
  (mapcar #'(<SPAN class=keyword>lambda</SPAN> (file) (w32-shell-execute <SPAN class=string>"open"</SPAN> file))
          (dired-get-marked-files nil arg)))

(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>dired-mouse-execute-file</SPAN> (event)
  <SPAN class=string>"In dired, execute the file or goto directory name you click on."</SPAN>
  (interactive <SPAN class=string>"e"</SPAN>)
  (set-buffer (window-buffer (posn-window (event-end event))))
  (goto-char (posn-point (event-end event)))
  (<SPAN class=keyword>if</SPAN> (dired-is-dir)
      (dired-find-file)
    (dired-execute-file)))

<SPAN class=comment>;; a few preferences when in dired mode. Hit capital X or double click mouse
;; to execute file at point. Also, if I hit the enter key, this setup reuses
;; the same window as the dired buffer and will not open another window.
</SPAN>(<SPAN class=keyword>defun</SPAN> <SPAN class=function-name>my-dired-mode-hook</SPAN> ()
  <SPAN class=string>"Hook run when entering dired-mode."</SPAN>
    (define-key dired-mode-map <SPAN class=string>"X"</SPAN> 'dired-execute-file)
    (define-key dired-mode-map [double-down-mouse-1] 'dired-mouse-execute-file)
    (define-key dired-mode-map <SPAN class=string>"\C-m"</SPAN> 'dired-find-alternate-file))

(add-hook 'dired-mode-hook 'my-dired-mode-hook)

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; MY PREFERRED KEY BINDINGS
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; here I chose to use my own key map to invoke certain things. A single key
;; such as a function key exposes this keymap then the corresponding key
;; executes whatever. This allows me to map functions to what I believe to be
;; the most logical key without regard for whether or not Emacs has already
;; mapped the key. Sometimes it may even be fewer keystrokes than a
;; conventional custom binding would require.
</SPAN>(<SPAN class=keyword>defvar</SPAN> <SPAN class=variable-name>daves-keymap</SPAN> nil)
(<SPAN class=keyword>if</SPAN> daves-keymap nil
  (setq daves-keymap (make-sparse-keymap))
  (define-key daves-keymap <SPAN class=string>"b"</SPAN> 'browse-kill-ring)                 <SPAN class=comment>; b - Browse
</SPAN>  (define-key daves-keymap <SPAN class=string>"c"</SPAN> 'comment-copy)                     <SPAN class=comment>; c - Comment-Copy
</SPAN>  (define-key daves-keymap <SPAN class=string>"d"</SPAN> 'ewd-dup-line)                     <SPAN class=comment>; d - Duplicate
</SPAN>  (define-key daves-keymap <SPAN class=string>"e"</SPAN> 'dg-erase-line)                    <SPAN class=comment>; e - Erase line
</SPAN>  (define-key daves-keymap <SPAN class=string>"f"</SPAN> 'dl-popup)                         <SPAN class=comment>; f - Functions
</SPAN>  (define-key daves-keymap <SPAN class=string>"g"</SPAN> 'grabbox-mode)                     <SPAN class=comment>; g - Grabbox
</SPAN>  (define-key daves-keymap <SPAN class=string>"i"</SPAN> 'ewd-insert-new-method)            <SPAN class=comment>; i - Insert method
</SPAN>  (define-key daves-keymap <SPAN class=string>"j"</SPAN> 'jump-to-register)                 <SPAN class=comment>; j - Jump
</SPAN>  (define-key daves-keymap <SPAN class=string>"m"</SPAN> 'point-to-register)                <SPAN class=comment>; m - Mark
</SPAN>  (define-key daves-keymap <SPAN class=string>"o"</SPAN> 'find-file-at-point)               <SPAN class=comment>; o - Open
</SPAN>  (define-key daves-keymap <SPAN class=string>"p"</SPAN> 'smart-paste)                      <SPAN class=comment>; p - smart Paste
</SPAN>)

(global-set-key <SPAN class=string>"\C-cc"</SPAN>             'dg-copy-sexp-at-cursor)
(global-set-key <SPAN class=string>"\C-cv"</SPAN>             'dg-replace-sexp-at-cursor)
(define-key global-map (kbd <SPAN class=string>"M-p"</SPAN>)  daves-keymap)
(global-set-key (kbd <SPAN class=string>"%"</SPAN>)           'match-paren)
(global-set-key (kbd <SPAN class=string>"C-m"</SPAN>)         'newline-and-indent)
(global-set-key (kbd <SPAN class=string>"C-w"</SPAN>)         'dg-kill-region)
(global-set-key (kbd <SPAN class=string>"C-x C-b"</SPAN>)     'bs-show)
(global-set-key <SPAN class=string>"\C-xk"</SPAN>             'kill-current-buffer)
(global-set-key (kbd <SPAN class=string>"C-&lt;"</SPAN>)         'undo)
(global-set-key (kbd <SPAN class=string>"C-&gt;"</SPAN>)         'redo)
(global-set-key (kbd <SPAN class=string>"M-."</SPAN>)         'find-tag-dont-ask)
(global-set-key (kbd <SPAN class=string>"M-g"</SPAN>)         'goto-line)
(global-set-key (kbd <SPAN class=string>"M-w"</SPAN>)         'dg-kill-ring-save)
(global-set-key [M-down]            '(<SPAN class=keyword>lambda</SPAN> () (interactive) (scroll-up 1)))
(global-set-key [M-up]              '(<SPAN class=keyword>lambda</SPAN> () (interactive) (scroll-down 1)))
(global-set-key (kbd <SPAN class=string>"C-x C-i"</SPAN>)     'dg-indent-rigidly)
(define-key global-map [f2]         'dg-find-word-at-cursor)
(define-key global-map [f3]         framepop-map)
(global-set-key [f4]                'speedbar-get-focus)
(global-set-key [f7]                'remember)
(global-set-key [f8]                'remember-region)
(global-set-key [f9]                'font-lock-fontify-buffer)
(global-set-key [f10]               'delete-temp-buffers)
(global-set-key [f11]               'kill-buffer-jump-other-window)
(global-set-key [f12]               'kill-buffer-other-window)
(pc-bufsw::bind-keys [C-tab] [C-S-tab])

<SPAN class=comment>;; -----------------------------------------------------------------------------
;; END CODE SECTION
;; -----------------------------------------------------------------------------
</SPAN>
<SPAN class=comment>;; -----------------------------------------------------------------------------
;; USEFUL NOTES AND OTHER STUFF
;; -----------------------------------------------------------------------------
;;
;; How to record and display a keyboard macro
;;
;; Just open a buffer and type C-x ( Then start typing in your macro.  Once
;; you are finished defining your macro type C-x ) Then type M-x
;; name-last-kbd-macro. This will allow you to call your macro whatever you
;; want. Next open up your .emacs file and position your cursor where you want
;; the code for the macro to appear.  Type M-x insert-kbd-macro and type in
;; the name.  The code will automatically be generated.
;;
;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
;;
;; Use shell-command-on-region M-| to send region to external process. If you
;; use a prefix argument , C-u M-| this will replace the region with the
;; output of the external process. Good for sending something to stdin and
;; reading from stdout.
;;
;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
;;
;; Useful LISP stuff I came across and don't want to forget:
;; thing-at-point
;;
;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------
;;
;; How to add a message box
;; (if (yes-or-no-p "Are you feeling well? ")
;;      (message "You appear to be feeling well.")
;;   (message "Hope you will get better soon!"))
;;
;; (if (x-popup-dialog t '("Are you feeling well?" ("Yes" . t) ("No" . nil)))
;;     (message "You appear to be feeling well.")
;;   (message "Hope you will get better soon!"))
;;
;; -----------------------------------------------------------------------------
;; SOME GOOD LINKS FOR EMACS SOURCES
;; -----------------------------------------------------------------------------
;;
;; http://relativity.yi.org/Emacs/index.shtml
;; http://tiny-tools.sourceforge.net/
;; http://www.anc.ed.ac.uk/~stephen/emacs/ell.html
;; http://www.dotemacs.de/
;; http://www.gnusoftware.com/WebRing/
;; http://www.splode.com/users/friedman/software/emacs-lisp/
;;
;; -----------------------------------------------------------------------------
;; END OF FILE
;; -----------------------------------------------------------------------------
</SPAN>
</PRE></BODY></HTML>
