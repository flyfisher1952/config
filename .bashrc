#-*- sh -*-
#------------------------------------------------------------------------------
# File:		$Id$
# Author:	Michael Lockhart
# Created:	Tue Oct 12 15:34:36 1999
#
# Description:	The .rc file for bash.
#
#

#PS1='\n\w\n'

alias cvsm='cvs status | grep Modified'
alias cvss='cvs status | grep File'
alias e=runemacs
alias find=/usr/bin/find.exe
alias gmm="pushd /cygdrive/c/mll/projects/MinuteMall"
alias l='ls -f'
alias la='ls -alF'
alias ll='ls -lF'
alias more=/usr/bin/less.exe
alias pd=pushd
alias po=popd
alias pu='rm -f *~ .*~ *.~[pd][pfsa][krms]'
alias vi=vim

export EDITOR=emacs
ip=`ipconfig | grep 'IP Address' | sed -e 's/.*://' -e 's/ //g'`
export DISPLAY=$ip:0.0

if [ -d /cygdrive/c/emacs/XEmacs/XEmacs-21.4.11/i586-pc-win32 ]; then
    PATH=$PATH:/cygdrive/c/emacs/XEmacs/XEmacs-21.4.11/i586-pc-win32
fi

if [ -d /cygdrive/c/emacs/bin ]; then
    PATH=$PATH:/cygdrive/c/emacs/bin
fi

# This sets up the Visual Tcl stuff. The command 'vtcl' can be run from the command line.
# It is currently unavailable as a double-clickable icon/shortcut.
export VTCL_HOME=/usr/local/vtcl-1.6.0
PATH=$PATH:$VTCL_HOME

xe () {
    xemacs $* &
}

