# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# source /Users/henrik/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



# export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export TERM=tmux-256color
# export TERM=xterm-kitty


eval "$(starship init zsh)"
