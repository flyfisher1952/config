;------------------------------------------------------------------------------
;- $Id: .emacs,v 1.9 1997/08/20 18:50:54 s814mll Exp $
;-
;- My emacs init file
;-
;- Look in the following URL for more info on Windows emacs.
;-      http://www.gnu.org/software/emacs/windows/ntemacs.html
;-

(put 'upcase-region 'disabled nil)	; allow up/downcase on regions
(put 'downcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(global-auto-revert-mode 1)

(column-number-mode 't)			; display column numbers
(line-number-mode t)			; display line numbers
 
;------------------------------------------------------------------------------
;- Some handy key defs so its easy to map kbd macros to fkeys
;-
(global-set-key [f2]  'foo-2)
(global-set-key [f3]  'foo-3)
(global-set-key [f4]  'foo-4)
(global-set-key [f5]  'foo-5)
(global-set-key [f6]  'foo-6)
(global-set-key [f7]  'foo-7)
(global-set-key [f8]  'foo-8)
(global-set-key [f9]  'foo-9)
(global-set-key [f10] 'foo-10)
(global-set-key [f11] 'foo-11)
(global-set-key [f12] 'foo-12)

(global-set-key [?\C-m] 'newline-and-indent)
(global-set-key [(control meta ?g)]     'goto-line)
(global-set-key [(control meta ?\%)]    'tags-query-replace)
(global-set-key [(meta ?s)]		'isearch-backward-regexp)
(global-set-key [(meta ?#)]		'query-replace-regexp)

(load-library "dark-emacs-theme")

;--------------------------------------------------------------------------------
;-- emacs edits this so be careful
;--
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
