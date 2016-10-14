bold=$(tput bold)
normal=$(tput sgr0)

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# export PS1="\[\033[0;31m\]\u\[\033[m\]:\[\033[0;32m\]\w \[$txtwht\]~ \[$txtylw\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] \n \$ "
export PS1="\n\[\033[1;32m\]\w \[$txtwht\]~ \[$txtylw\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n \033[1m\$\033[0;m "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LC_CTYPE="utf-8"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FUNCTIONS
############

hints () {
  magerun $1 dev:template-hints --$2 1
}

cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"; pwd
	else
		echo 'No Finder window found' >&2
	fi
}

smu () {
	git submodule init
	git submodule update
}

rsa () {
	pbcopy < ~/.ssh/id_rsa.pub
	echo '## You public key has been copied to clipboard. ##'
}

# Vagrant
magerun () {
  vagrant ssh -- -t n98-magerun.phar --root-dir=/var/www/$1/magento $2 $3 $4 $5
}

vagrun () {
  vagrant ssh -- -t sudo service $1 $2
}

# Git
cmt () {
 git commit -m "$1"
}

# Drush commands #
sqldump () {
    drush cc all && drush sql-dump | gzip -9 > $1_$(date +%d-%m-%Y).sql.gz
}

# Image Tools
convert () {
    for i in *.$1; do sips -s format jpeg $i --out $i.jpg;done
}

resize () {
  for i in *.jpg; do sips -Z $1 $i --out Resized/$i.jpg;done
}

shots () {
   convert png
   zip screenshots_$(date +%d-%m-%Y).zip *.jpg
   find . -type f ! -name *.zip -execdir rm {} +
   echo '***************************'
   echo '*  Screenshots prepared!  *'
   echo '***************************'
}

lines () {
   find . -name '*.$1' | xargs wc -l
}

v() {
  CMD="cd /var/www/$1; $2";
  vagrant ssh -c "$CMD"
}

addhost() {
  echo 192.168.56.101 $1 | sudo tee -a /etc/hosts
}

# ALIASES
#########

# Global
alias ls='ls -loah'
alias logs='tail -f logs/php_error_log'
alias aliases='nano ~/.bash_profile'
alias refresh='source ~/.bash_profile'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias desktop='cd ~/Desktop'
alias f='open -a Finder ./'
alias myip="curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias www="cd /Users/davidlicen/Documents/www"

# Show hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles YES"

# Hide hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles NO"

# Git
alias gs='git status'
alias add='git add .'
alias gfom='git fetch origin master'
alias grom='git rebase origin/master'
alias master='git checkout master'
alias gp='git pull'

# Vagrant
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vsus='vagrant suspend'
alias vres='vagrant resume'
alias vafy='~/workspace/vagrant/vafy.sh ~/workspace/vagrant'
alias vcc="vagrant ssh -- cd /var/www/; drush cc all"

# SSH shortcuts
alias fu="du -sh */"
alias code="cd ~/Documents/_CODE"

source /Users/davidlicen/.rvm/scripts/rvm
export PATH="/usr/local/sbin:$PATH"
