eval "$(/opt/homebrew/bin/brew shellenv)"
export TERM=screen-256color

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim

export LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export CPLUS_INCLUDE_PATH=/usr/local/include


PROMPT="%F{14}⏣ %F{2}%B%n%b%F{5}@%f%m %B%1~%b %F{13}→ %f"
#PROMPT="%F{13}╮ %F{14}⏣ %F{2}%B%n%b%F{5}@%f%m %B%1~%b
#%F{13}╰─────────────────────✦▶︎ %f"

RPROMPT='%F{07}%T%f'

# super clear
alias cclear="clear; printf '\33c\e[3J'"
# better ls
alias ls='ls -F'
# ls + rwx info
alias ll='ls -lh'
# ls by date
alias lsr='ls -alt | head -10'

# extract audio from youtube vid
alias grab_audio='yt-dlp -f "bestaudio[ext=m4a]"'

# copy with progress bar
alias cpv='rsync -ah --info=progress2'

# disable sleep
alias disable_sleep='sudo pmset -a sleep 0; sudo pmset -a disablesleep 1;'
# renable sleep (will throw error but still works)
alias enable_sleep='sudo pmset -a sleep 1; sudo pmset -a disablesleep 0;'

# React Native BULLSHIT
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# rust repl (return evaluate program loop)
alias rust='evcxr'

# windows icon replace
#alias replace_win_exe_icon = "f() { winresourcer --operation=Update --exeFile=$1 --resourceType=Icongroup --resourceName:1 --resourceFile:$2};f"

# mingw stuff
export MINGW32_PREFIX="/opt/homebrew/bin/i686-w64-mingw32-"
export MINGW64_PREFIX="/opt/homebrew/bin/x86_64-w64-mingw32-"

# python aliases
alias py3='python3'
alias py2='python2'
alias py='python3'
# alias python='python' DOES NOT WORK

# SCHOOL
alias pyne='ipython -i ~/.pyne.py'

# aplay 4 macOS
alias aplay='mplayer -cache 1024 -quiet -rawaudio samplesize=1:channels=1:rate=8000 -demuxer rawaudio -'
# echo "struct{int a:8,b:2,c:10;}d;main(){for(;;++d.c?:++d.b)putchar(d.a+=(d.b+5));}"|cc -xc -&&./a.out|aplay

# tmux vim + terminal coding :3
alias code='~/CODE'

alias valgrind="docker run -it -v $PWD:/tmp -w /tmp valgrind:1.0 /bin/sh -c 'valgrind $1'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias godot="/Applications/Godot351.app/Contents/MacOS/Godot"
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/calebd/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/calebd/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/calebd/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/calebd/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/calebd/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/calebd/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

