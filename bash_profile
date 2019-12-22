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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/henriksteude/google-cloud-sdk/path.bash.inc' ]; then . '/Users/henriksteude/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/henriksteude/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/henriksteude/google-cloud-sdk/completion.bash.inc'; fi

# some stuff for java and spark
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.4.3/libexec
export PATH=$PATH:$SPARK_HOME

# add anaconda python to path
export PATH=/usr/local/miniconda3/bin:$PATH

# language and encoding settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/miniconda3/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

# for sphinx documentations
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
