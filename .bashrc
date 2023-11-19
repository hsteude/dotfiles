# load aliases
if [ -f ~/.aliases ]; then
       source ~/.aliases
fi

# enter vi mode
set -o vi

# change python encoding
export PYTHONIOENCODING=UTF-8 

# add tex to path
TEX_PATH=/Library/TeX/texbin
export PATH=$PATH:$TEX_PATH

# add malmo path
export MALMO_XSD_PATH="/Users/henrik/Documents/hsu/game_environment/project-malmo/MALMO/MalmoPlatform/Schemas"

#this is my promt... haha, ridiculous (i was bored...)
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[01;36m\]\$(parse_git_branch) \[\033[00m\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\$\[\033[00m\] "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# add tex to path
export PATH ="/Library/TeX/texbin:$PATH"

# very important:
fortune | cowsay

# no zshellwarnings all the time
export BASH_SILENCE_DEPRECATION_WARNING=1

# ipbd instead of pdb by default breakpoint
export PYTHONBREAKPOINT=ipdb.set_trace
export TERM=tmux-256color


