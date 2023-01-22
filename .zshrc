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

### EXPORT
export TERM="xterm-256color"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR="nvim"

### Default keybindinds (-e for emacs, -v for vi)
bindkey -e

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

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
alias l="exa -al --group-directories-first --icons"
alias lt="exa -aT --color=always --group-directories-first --icons"

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
alias df="df -h"
alias free="free -m"

# Path
if [ -d "$HOME/.local/bin" ];
	then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/goinfre/$user/homebrew/bin" ];
	then path="/goinfre/$user/homebrew/bin:$path"
fi

if [ -d "/goinfre/$user/homebrew/sbin" ];
	then path="/goinfre/$user/homebrew/bin:$path"
fi

if [ -d "/goinfre/$USER/.npm-global/bin" ];
	then PATH="$PATH:/goinfre/$USER/.npm-global/bin"
fi

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

### Function extract for common file formats ###
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS

### SETTING STARSHIP PROMPT ###
eval "$(starship init zsh)"
