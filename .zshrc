# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ffffff,bg=#66aebd"                                                                                                                                  
# Path to your oh-my-zsh installation.
  export ZSH="/home/bakasaka/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="pi"


# ZSH_THEME="elessar"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

alias venv="source venv/bin/activate"
alias platform126="echo 'imquang188' | sudo -S kubefwd svc -n default -n platform126"
alias myip="curl ifconfig.me"
alias c="cd ~/Projects"
alias newtab="qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_WINDOW newSession"
alias gitconfig_foobla="git config user.name 'Duy Quang' && git config user.email 'quangnd@foobla.com'"
alias pls="sudo"
alias zshconfig="nano ~/.zshrc"
alias tree="tree -I node_modules"
alias gcom="git commit -m"
alias cl="clear"
alias del="rm -rf"
alias jupyter-kernel="ipython kernel install --user --name=venv"
alias tat="shutdown now"
alias torch="source ~/virtualenvs/pytorch/bin/activate"

#source /home/bakasaka/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:~/.yarn/bin

###
setopt auto_cd

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/bakasaka/google-cloud-sdk/path.zsh.inc' ]; then . '/home/bakasaka/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/bakasaka/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/bakasaka/google-cloud-sdk/completion.zsh.inc'; fi

#####
source /home/bakasaka/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Cd-ing to auto-activate virtualenv python
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./venv ]] ; then
        source ./venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}
