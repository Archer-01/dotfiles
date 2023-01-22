#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|                          
#
# Zsh Run Commands
#
# By		Hamza Haddani
# Github	https://github.com/Archer-01
# Discord	Archer#0177
#

# dotiles config
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# 1337 Related
rm -f $HOME/.reset
alias cclean="$HOME/Cleaner_42.sh"
alias norm="norminette"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
local earphones="oraimo FreePods 3"
alias blconnect "blueutil --connect \"$earphones\""
alias bldisconnect "blueutil --disconnect \"$earphones\""
alias blpair "blueutil --pair \"$earphones\""
alias blunpair "blueutil --unpair \"$earphones\""
alias blon "blueutil --power 1"
alias bloff "blueutil --power 0"
export VAGRANT_HOME=/goinfre/$USER/.vagrant.d
function brew {
	local green="\033[0;32m"
	local reset="\033[0m"
	local brew_url="https://github.com/Homebrew/brew/tarball/master"
	local brew_tarfile="/tmp/homebrew.tar.gz"
	local brew_dir="/goinfre/$USER/homebrew"
	if [ ! -f "$brew_dir/bin/brew" ]; then
		echo "${green}Instaling brew...${reset}"
		mkdir -p $brew_dir
		curl --silent -l $brew_url > $brew_tarfile
		tar xz --strip 1 -c $brew_dir -f $brew_tarfile
		rm -f $brew_tarfile
	fi
	$brew_dir/bin/brew $@
	return $?
}
function valgrind {
	local brew_dir="/goinfre/$USER/homebrew"
	if [ ! -f "$brew_dir/bin/valgrind" ]; then
		brew tap "LouisBrunner/valgrind"
		brew install --HEAD "LouisBrunner/valgrind/valgrind"
	fi
	$brew_dir/bin/valgrind $@
	return $?
}

# Safety aliases
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Git Shortcuts
alias gcl="git clone --recurse-submodules"
alias gp="git push"
alias gl="git pull"
alias gst="git status"
alias gss="git status -s"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
alias gr="git remote"
alias gra="git remote add"
alias grv="git remote -v"
alias grr="git remote rm"
alias lg="lazygit"

# Ls shortcuts
alias ls="exa -a --group-directories-first --icons"
alias l="ls -l"

# Directory manipulation shortcuts
alias md="mkdir -p"
alias rd="rmdir"
function mdcd {
	if [ $# -ne 1 ]; then
		>&2 echo "Usage: mdcd <directory>"
		return 1
	fi
	mkdir -p $1
	cd $1
}
alias ..="cd .."
alias ...="cd ../.."

# Misc shortcuts
alias c="clear"
alias tree="tree -C"
alias grep="rg"
alias find="fd"
alias vim="nvim"
alias reload="source $HOME/.zshrc"
alias work="cd $HOME/Documents/Work"

# Path
PATH="$HOME/.local/bin:$PATH"
PATH="/goinfre/$USER/homebrew/bin:$PATH"
PATH="/goinfre/$USER/homebrew/sbin:$PATH"
PATH="/goinfre/$USER/.npm-global/bin:$PATH"
export PATH

function intra {
	if [ $# -eq 0 ]; then
		open https://intra.42.fr
	elif [ $# -eq 1 ]; then
		case $1 in
			map)
				open "https://meta.intra.42.fr/clusters"
				;;
			holygraph)
				open "https://projects.intra.42.fr/projects/graph"
				;;
			*)
				open "https://profile.intra.42.fr/users/$1"
				;;
		esac
	else
		>&2 echo "Usage: intra [map|holygraph|username]"
	fi
}

# C/C++ Environemt
export CC="cc"
export CFLAGS="-Wall -Wextra -Werror"
export CXX="c++"
export CXXFLAGS="-Wall -Wextra -Werror -std=c++98"

# Colored Manpages
export less_termcap_mb=$'\e[1;32m'
export less_termcap_md=$'\e[1;32m'
export less_termcap_me=$'\e[0m'
export less_termcap_se=$'\e[0m'
export less_termcap_so=$'\e[01;33m'
export less_termcap_ue=$'\e[0m'
export less_termcap_us=$'\e[1;4;31m'

# Misc Environemt
export EDITOR="nvim"
