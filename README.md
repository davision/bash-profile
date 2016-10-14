# Personal terminal set-up

This repository includes:
* iTerm2 custom color theme "Blue Lagoon"
* .bash_profile file with useful functions and aliases

Some functions are quite of a personal nature, so please ignore.

Git promt integration is based on **Jim Myhrberg** Git-aware-promt solution fron: https://github.com/jimeh/git-aware-prompt

## Blue Lagoon theme example ##

Bellow example shows theme in action, including .bash_profile configuration with git integration.

![Blue Lagoon](https://raw.githubusercontent.com/davision/bash-profile/master/images/example.png)

# What's inside? #

Let's see what you get among other.

## Usefull functions ##

__1. Jumps into the folder of active Finder window__
```
cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"; pwd
	else
		echo 'No Finder window found' >&2
	fi
}
```

__2. Copies your public key into a clipboard__
```
rsa () {
	pbcopy < ~/.ssh/id_rsa.pub
	echo '## You public key has been copied to clipboard. ##'
}
```

__3. Returns total lines of code in given extension files__
```
lines () {
   find . -name '*.$1' | xargs wc -l
}
```

## Usefull aliases ##

__1. Open current path in Finder__
```
alias f='open -a Finder ./'
```

__2. Moving around__
```
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
```

__3. Git shortcuts__
```
alias gs='git status'
alias add='git add .'
alias gfom='git fetch origin master'
alias grom='git rebase origin/master'
alias master='git checkout master'
alias gp='git pull'
```

__4. Vagrant shortcuts__
```
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vsus='vagrant suspend'
alias vres='vagrant resume'
```
