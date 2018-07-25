# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Always run on tmux
if [ -z "$TMUX" ]
then
  _trap_exit() { tmux detach -t default; }
  trap _trap_exit EXIT
  tmux -2 new-session -t default || tmux -2 new-session -s default
else

  source ~/.bash_prompt

  # Space expands commands before executing them
  # bind Space:magic-space

  # Set terminal colors
  export TERM="xterm-256color"
  
  ## PATHS ###

  # Homebrew?
  export PATH="~/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/X11/bin"

  # Texlive
  export PATH="/usr/local/texlive/2015basic/bin/universal-darwin:$PATH"

  # Rust
  export PATH="/Users/Kevin/.cargo/bin:$PATH"
  
  # ~/.bin
  export PATH="/Users/Kevin/.bin:$PATH"

  # mysql vanilla
  PATH=${PATH}:/usr/local/mysql/bin

  # Go
  # export GOROOT=/usr/lcoal/opt/go/libexec
  export GOPATH="$HOME/Sites/go"
  export PATH="$PATH:$GOPATH/bin"

  # RVM things
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

  ### History ###

  HISTCONTROL=ignoreboth:erasedups # dont include duplicate lines + lines starting with space
  shopt -s histappend # append to the history file, don't overwrite it
  HISTSIZE=1000000
  HISTFILESIZE=200000
  export PROMPT_COMMAND='history -a' # This will record each command to the history file as it is issued.

  # If set, the pattern "**" used in a pathname expansion context will
  # match all files and zero or more directories and subdirectories.
  #shopt -s globstar

  ### Other Sources ###

  # Alias definitions.
  [ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

  # Source .bashrc
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
  
  [ -f "$HOME/.mysql_profile" ] && . "$HOME/.mysql_profile"

  ### Misc ###

  # For more github searches on Homebrew
  export HOMEBREW_GITHUB_API_TOKEN=edc857c1e994cabab884168ed8983da5e781cbe5

  # Git autocomplete branch names
  [ -f "$HOME/.git-completion.bash" ] && . "$HOME/.git-completion.bash"

  # For playing video on terminal using libcaca
  CACA_DRIVER=ncurses

  ### for the lolz ###
  date | figlet | lolcat

fi

# OPAM configuration
. /Users/Kevin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
 export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
export PATH="/usr/local/sbin:$PATH"
eval $(opam config env)

