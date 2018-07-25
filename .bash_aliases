
# Global
# alias git="touch untitled; git"
alias simpser='python -m SimpleHTTPServer'
alias freakout='git commit -am "Quick push. No time for messages. This is an alias." && git push'
alias csug="ssh keh222@csug05.csuglab.cornell.edu"
alias ll='ls -al'
alias ls='ls -l'
alias ltr='ls -l -t -r' # ls command: long, sort by mod date, rev order
alias t='tmux'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias checkout='git checkout'
alias gm='git checkout master'
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias latexclean='rm *.log *.aux *.pdf *.out'
alias atomshell='/opt/homebrew-cask/Caskroom/atom-shell/0.21.2/Atom.app/Contents/MacOS/Atom ./'
alias :q='exit'

alias :r='tmux movew -r'
alias venv='source venv/bin/activate'
alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias buildtest='ocamlbuild  -use-menhir -pkgs oUnit,str,yojson,ANSITerminal staff_test.byte'

# 3110
function checktypess
{
  command cd ./$1 && ./checktypes.sh; cd ..
}

function youtubemp3
{
  command youtube-dl --extract-audio --audio-format=mp3 $1
}

function youtubeaac
{
  command youtube-dl --extract-audio --audio-format=aac $1
}

function youtubewav
{
  command youtube-dl --extract-audio --audio-format=wav $1
}

function mkcd
{
  command mkdir $1 && cd $1
}

function when
{
  command history | grep $1
}


function pand
{
  command pandoc ${1} -o ${1}.pdf && open ${1}.pdf
}

function gccc
{
  command gcc -o ${1} ${1}.c $$ ./${1}
}

# For goodness
alias o='open ./'
alias s='subl ./'

case "$OSTYPE" in
  solaris*)
    echo "SOLARIS"
    ;;
  darwin*)
    ## OSX
    alias xmysql='/Applications/XAMPP/xamppfiles/bin/mysql'

    # For showing hidden files
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'

    # For looks
    alias hidedesktop='defaults write com.apple.finder CreateDesktop false; killall Finder'
    alias showdesktop='defaults write com.apple.finder CreateDesktop true; killall Finder'

    # For killing and recovering the dock
    alias hidedock='defaults write com.apple.Dock autohide-delay -float 1000 && killall Dock'
    alias showdock='defaults delete com.apple.Dock autohide-delay && killall Dock'
    ;;
  linux*)
    echo "LINUX"
    ;;
  bsd*)
    echo "BSD"
    ;;
  *)
    echo "unknown: $OSTYPE"
    ;;
esac

