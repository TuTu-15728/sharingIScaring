# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# colors
dark_red="$(tput bold; tput setaf 1)"
dark_green="$(tput bold; tput setaf 2)"
dark_yellow="$(tput bold; tput setaf 3)"
dark_blue="$(tput bold; tput setaf 4)"
dark_violet="$(tput bold; tput setaf 5)"
dark_cyan="$(tput bold; tput setaf 6)"
dark_white="$(tput bold; tput setaf 7)"
grey="$(tput bold; tput setaf 8)"
red="$(tput bold; tput setaf 9)"
green="$(tput bold; tput setaf 10)"
yellow="$(tput bold; tput setaf 11)"
blue="$(tput bold; tput setaf 12)"
violet="$(tput bold; tput setaf 13)"
cyan="$(tput bold; tput setaf 14)"
white="$(tput bold; tput setaf 15)"

nc="$(tput sgr0)"

PS1='\[$white\][\[$dark_green\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u @ \h\[\033[00m\]\[$white\]]\[$nc\] \[$white\]: \[\033[01;34m\]\w\[\033[00m\] \[$dark_green\]\$\[$nc\] '
