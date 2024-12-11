# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

HISTFILE=$HOME/.zsh_history
SAVEHIST=65536
HISTSIZE=100000
DIRSTACKSIZE=10
setopt SHARE_HISTORY

# Path to brew
export PATH=/opt/homebrew/bin:$PATH
export PATH=~/.local/bin:$PATH


fpath+=/opt/homebrew/share/zsh/site-functions

 # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

### From .bashrc
# load aliases
if [ -f ~/.aliases ]; then
       source ~/.aliases
fi

# change python encoding
export PYTHONIOENCODING=UTF-8 

# add tex to path
TEX_PATH=/Library/TeX/texbin
export PATH=$PATH:$TEX_PATH

# add cargo stuff to path
CARGO_PATH=~/.cargo/bin
export PATH=$PATH:$CARGO_PATH

# ipbd instead of pdb by default breakpoint
export PYTHONBREAKPOINT=ipdb.set_trace

bindkey -v
bindkey '^R' history-incremental-search-backward

# strage delete key behaviour in vi moe
bindkey "^?" backward-delete-char


# Without this line conda shows a weird behaviour in tmux
# [[ -z $TMUX ]] || conda deactivate; conda activate base


# Needs to be source at the end of this file!!
# source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# enable git completion
autoload -Uz compinit && compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/henrik/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/henrik/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/henrik/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/henrik/google-cloud-sdk/completion.zsh.inc'; fi


# export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export TERM=tmux-256color
# export TERM=xterm-kitty


# Try to use starship prompt if available
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    # Simple fallback prompt showing username@hostname and current directory
    PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '
fi
