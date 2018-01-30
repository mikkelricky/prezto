#
# Defines custom aliases and functions.
#
# Authors:
#   Mikkel Ricky <mikkel@mikkelricky.dk>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
	return 1
fi

export PATH=$HOME/bin:$PATH

#
# Aliases
#

# Open file(s) in Emacs.
if [ -d "/Applications/Emacs.app" ]; then
	alias emacs='open -a "/Applications/Emacs.app"'
fi

if [ -d "/Applications/Gimp.app" ]; then
	alias gimp='open -a "/Applications/Gimp.app"'
fi

if [ -d "/Applications/Google Chrome.app" ]; then
	alias chrome='open -a "/Applications/Google Chrome.app"'
fi

if [ -d "/Applications/Firefox.app" ]; then
	alias firefox='open -a "/Applications/Firefox.app"'
fi

if [ -d "/Applications/Microsoft Excel.app" ]; then
	alias excel='open -a "/Applications/Microsoft Excel.app"'
fi

if [ -d "/Applications/PhpStorm.app" ]; then
	alias phpstorm='open -a "/Applications/PhpStorm.app"'
fi

if [ -d "/Applications/PyCharm.app" ]; then
	alias pycharm='open -a "/Applications/PyCharm.app"'
fi

if [ -d "/Applications/Meld.app" ]; then
	alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
fi

if [ -d "/Applications/Preview.app" ]; then
	alias preview='open -a "/Applications/Preview.app"'
fi

# PHP_CodeSniffer aliases.
phpcs --version &>/dev/null

if [ $? -eq 0 ]; then
	alias drupalcs="~/.composer/vendor/bin/phpcs --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,js,css,info,txt'"
	alias drupalcbf="~/.composer/vendor/bin/phpcbf --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,js,css,info,txt'"
	alias symfony2cs="phpcs --standard=Symfony2 --extensions='php,js,css'"
fi

alias css-grep='grep --include "*.css" --recursive --no-messages'
alias html-grep='grep --include "*.html" --recursive --no-messages'
alias js-grep='grep --include "*.js" --recursive --no-messages'
alias php-grep='grep --include "*.php" --recursive --no-messages'
alias py-grep='grep --include "*.py" --recursive --no-messages'
alias twig-grep='grep --include "*.twig" --recursive --no-messages'

alias php-xdebug='php -dxdebug.remote_enable=1 -dxdebug.remote_autostart=1 -dxdebug.idekey=netbeans-xdebug'

alias chrome-curl='curl --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36"'
alias firefox-curl='curl --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0) Gecko/20100101 Firefox/50.0"'

if [ -e '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then
	source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
fi
if [ -e '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then
	source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

precmd() {
	# sets the tab title to current dir
	echo -ne "\e]1;$(print -P %~)\a"
}

export PATH=$HOME/.composer/vendor/bin:$PATH
eval "$(symfony-autocomplete)"


# @see https://laravel.com/docs/5.5/homestead#daily-usage
function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

