# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search zsh-vi-mode kubectl)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# STUFF FROM BASH_PROFILE:

export BASH_SILENCE_DEPRECATION_WARNING=1
PATH="/opt/homebrew/bin:$PATH"

eval "$(oh-my-posh init zsh --config ~/.config/posh/atomic.omp.json)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2023-08-17 13:14:33
export PATH="$PATH:/Users/m0n0x41d/.local/bin"

grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add

export PATH="$HOME/bin:$PATH"
source $("/Users/m0n0x41d/bin/trdl" use werf "1.2" "stable")
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubectl stuff
export KUBECONFIG=~/.kube/all-in-one-kubeconfig.yaml

export CC='clang'
export CXX='clang++'
# export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"

if [ -f $(brew --prefix)/etc/zsh_completion ]; then
  . $(brew --prefix)/etc/zsh_completion
fi

source <(kubectl completion zsh)

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# export CLANG_BIN="/Users/m0n0x41d/Repos/llvm-project/build/bin/clang"


# RUBY STAFF
eval "$(rbenv init - zsh)"
rbenv global 3.1.3


# ENVS

KUBE_EDITOR=vim


#ALIASES

alias "python-cache-cleanup"='find . | grep -E "(.pytest_cache|/__pycache__$|\.pyc$|\.pyo$)" | xargs rm -rf'
alias "ns"="kubectl ns"
alias "ctx"="kubectl ctx"
alias "pods"="kubectl get pod"
alias "svc"="kubectl get svc"
alias "deploy"="kubectl get deployment"
alias "ing"="kubectl get ingresses"

alias "debug-ubuntu"="kubectl -n default run ubuntu --image=ubuntu --command -- /bin/sh -c 'while true; do sleep infinity; done'"

alias "kalibox"="docker exec -it kali bash"

alias "werf-secrets"="werf helm secret values edit .helm/secret-values.yaml"

alias pr="poetry run"

alias test_one="poetry run pytest --pdb -vvv -k"

alias vim="nvim"

alias pypo="pyenv local 3.10 && poetry env use 3.10 && poetry install && stb update env && stb update package"

alias pshell="poetry shell"



#FUNCS

kexec() {
  if [ $# -ne 1 ]; then
    echo "Usage: kexec <podname>"
    return 1
  fi

  local podname="$1"
  kubectl exec -it "$podname" -- bash
}



# ENV

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
