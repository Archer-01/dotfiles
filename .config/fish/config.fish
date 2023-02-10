#                  __ _          __ _     _     
#                 / _(_)        / _(_)   | |    
#  ___ ___  _ __ | |_ _  __ _  | |_ _ ___| |__  
# / __/ _ \| '_ \|  _| |/ _` | |  _| / __| '_ \ 
#| (_| (_) | | | | | | | (_| |_| | | \__ \ | | |
# \___\___/|_| |_|_| |_|\__, (_)_| |_|___/_| |_|
#                        __/ |                  
#                       |___/                   
#
# By		Hamza Haddani
# Github	https://github.com/Archer-01
# Discord	Archer#0177
#

### Supresses fish's intro message
set fish_greeting

### EXPORT 
set TERM "xterm-256color"
set EDITOR "nvim"

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx BAT_THEME "Dracula"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

### DOTFILES CONFIG ###
alias config "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

### KEY BINDINGS
function fish_user_key_bindings
	fish_default_key_bindings
	# fish_vi_key_bindings

	bind \cy forward-char
	bind \ck kill-line
end

### 1337 RELATED ###
rm -f $HOME/.reset
alias cclean "$HOME/Cleaner_42.sh"
alias norm "norminette"
alias code "/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
set -gx VAGRANT_HOME "/goinfre/$USER/.vagrant.d"

function brew
	set -l brew_url "https://github.com/Homebrew/brew/tarball/master"
	set -l brew_tarfile "/tmp/homebrew.tar.gz"
	set -l brew_dir "/goinfre/$USER/homebrew"
	if test ! -f "$brew_dir/bin/brew"
		echo $(set_color green) "Installing brew..." $(set_color normal)
		mkdir -p $brew_dir
		curl --silent -l $brew_url > $brew_tarfile
		tar xz --strip 1 -c $brew_dir -f $brew_tarfile
		rm -f $brew_tarfile
	end
	$brew_dir/bin/brew $argv
	return $status
end

function valgrind
	set -l brew_dir "/goinfre/$USER/homebrew"
	if test ! -f "$brew_dir/bin/valgrind"
		echo $(set_color green) "Installing valgrind..." $(set_color normal)
		brew tap "LouisBrunner/valgrind"
		brew install --HEAD "LouisBrunner/valgrind/valgrind"
	end
	$brew_dir/bin/valgrind $argv
	return $status
end

### BLUETOOTH EARPHONES ###
set -l earphones "oraimo FreePods 3"
alias blconnect "blueutil --connect \"$earphones\""
alias bldisconnect "blueutil --disconnect \"$earphones\""
alias blpair "blueutil --pair \"$earphones\""
alias blunpair "blueutil --unpair \"$earphones\""
alias blon "blueutil --power 1"
alias bloff "blueutil --power 0"

### SAFETY ALIASES ###
alias rm "rm -i"
alias cp "cp -i"
alias mv "mv -i"

# GIT SHORTCUTS ###
alias gcl "git clone --recurse-submodules"
alias gp "git push"
alias gl "git pull"
alias gst "git status"
alias gss "git status -s"
alias ga "git add"
alias gc "git commit"
alias gco "git checkout"
alias gb "git branch"
alias gr "git remote"
alias gra "git remote add"
alias grv "git remote -v"
alias grr "git remote rm"
alias lg "lazygit"

### DOCKER SHORTCUTS ###
alias drun "docker run -it --rm"
alias dps "docker ps --all"
alias dils "docker image ls"
alias dvls "docker volume ls"
alias dnls "docker network ls"
alias dex "docker exec -it"
alias dc "docker-compose"
alias dpr "docker system prune"

### VAGRANT SHORTCUTS ###
alias vup "vagrant up"
alias vssh "vagrant ssh"
alias vrel "vagrant reload"
alias vhalt "vagrant halt"

### LS SHORTCUTS ###
function ls
	command --query exa
	if test $status -ne 0
		command ls $argv
	else
		command exa -a --group-directories-first --icons $argv
	end
	return $status
end
alias l "ls -l"
alias lt "ls -lT"

### DIRECTORY MANIPULATION SHORTCUTS ###
alias md "mkdir -p"
alias rd "rmdir"
alias .. "cd .."
alias ... "cd ../.."

alias vopen "fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"

function mdcd
	if test $(count $argv) -eq 0
		echo "Usage: mdcd [directory]"
		return 1
	end
	mkdir -p $argv[1]
	cd $argv[1]
	return $status
end

function cdls
	if test $(count $argv) -ne 1
		echo "Usage: cdls [directory]"
		return 1
	end
	cd $argv[1]
	ls
	return $status
end

# MISC SHORTCUTS ###
alias c "clear"
alias tree "tree -C"
alias grep "rg"
alias find "fd"
alias vim "nvim"
alias reload "source $HOME/.config/fish/config.fish"
alias work "cd $HOME/Documents/Work"
alias df "df -h"
alias free "free -m"

### PATH ###
if test -d "$HOME/.local/bin"
	set PATH "$HOME/.local/bin:$PATH"
end

if test -d "/goinfre/$USER/homebrew/bin"
	set PATH "/goinfre/$USER/homebrew/bin:$PATH"
end

if test -d "/goinfre/$USER/homebrew/sbin"
	set PATH "/goinfre/$USER/homebrew/sbin:$PATH"
end

if test -d "/goinfre/$USER/.npm-global/bin"
	set PATH "/goinfre/$USER/.npm-global/bin:$PATH"
end

function intra
	set -l arg_count $(count $argv)

	if test $arg_count -eq 0
		open "https://intra.42.fr"
	else if test $arg_count -eq 1
		switch $argv[1]
			case "map"
				open "https://meta.intra.42.fr/clusters"
			case "holygraph"
				open "https://projects.intra.42.fr/projects/graph"
			case '*'
				open "https://profile.intra.42.fr/users/$argv[1]"
		end
	else
		echo "Usage: intra [map|holygraph|username]"
		return 1
	end
end

### C/C++ ENVIRONMENT ###
set -gx CC "cc"
set -gx CFLAGS "-Wall -Wextra -Werror"
set -gx CXX "c++"
set -gx CXXFLAGS "-Wall -Wextra -Werror -std=c++98"

### STARSHIP PROMPT ###
starship init fish | source
