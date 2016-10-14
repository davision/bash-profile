# Personal terminal set-up

This repository includes:
* iTerm2 custom color theme "Blue Lagoon"
* .bash_profile file with useful functions and aliases

Some functions are quite of a personal nature, so please ignore.

## Blue Lagoon theme example ##

Bellow example shows theme in action, including .bash_profile configuration with git integration.
![Blue Lagoon](https://raw.githubusercontent.com/davision/bash-profile/master/images/example.png)

# What's inside? #

Let's see what you get

## Usefull functions ##

* 1. Jumps into the folder of active Finder window *
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

* 2. Copies your public key into a clipboard *
```
rsa () {
	pbcopy < ~/.ssh/id_rsa.pub
	echo '## You public key has been copied to clipboard. ##'
}
```

* 3. Returns total lines of code in given extension files*
```
lines () {
   find . -name '*.$1' | xargs wc -l
}
```

## Usefull aliases ##

* 1. Open current path in Finder *
```
alias f='open -a Finder ./'
```

* 2. Moving around *
```
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
```
