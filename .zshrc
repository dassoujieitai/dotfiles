# export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
# if which ebenv > /dev/null; then eval "$(rbenv init -)"; fi
# export CC=/usr/bin/gcc
autoload -U compinit
compinit
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

PROMPT="%n@%m:%c %% "

unamerslt=`uname`

if [ $unamerslt = "Darwin" ]; then
    alias ls="gls -F --color=auto"
    alias cp="gcp -i"
    alias mv="gmv -i"
    alias rm="grm -i"
fi
if [ $unamerslt = "Linux" ]; then
    alias ls="/bin/ls -F --color=auto"
    alias cp="/bin/cp -i"
    alias mv="/bin/mv -i"
    alias rm="/bin/rm -i"
fi
alias start-emacs-daemon="emacs --daemon"
alias start-emacs-client="emacsclient --create-frame &"
alias start-emacs-client-nw="emacsclient -nw"
alias start-emacs-client-terminal="emacsclient -nw"
alias kill-emacs-daemon="emacsclient -e '(kill-emacs)'"
alias stop-emacs-daemon="emacsclient -e '(kill-emacs)'"
alias end-emacs-daemon="emacsclient -e '(kill-emacs)'"

if [ $unamerslt != "Linux" ]; then
    source $(brew --prefix nvm)/nvm.sh
    export NVM_DIR=~/.nvm
fi

# for byobu
if [ $unamerslt = "Darwin" ]; then
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
fi
if [ $unamerslt = "Linux" ]; then
    export VTE_CJK_WIDTH=1
fi

# Ruby gems for 2.1.1
# export GEM_HOME=${HOME}/lib/gems/2.1.1

# export PATH=${GEM_HOME}/bin:${PATH}

# for rbenv
if [ $unamerslt = "Darwin" ]; then
    export RBENV_ROOT=/usr/local/var/rbenv
fi
eval "$(rbenv init -)"

# for byobu
if [ $unamerslt = "Darwin" ]; then
    export BYOBU_PREFIX=$(brew --prefix)
fi

# for zsh-syntax-highlight
if [ $unamerslt = "Darwin" ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# setup JAVA_HOME environment variable
if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=`/usr/libexec/java_home`
fi

# 00 : 標準色     40 : バックを黒色
# 01 : 明るくする 41 : バックを赤色
# 04 : 下線を引く 42 : バックを緑色
# 05 : 点滅させる 43 : バックを黄色
# 30 : 黒色文字   44 : バックを青色
# 31 : 赤色文字   45 : バックを紫色
# 32 : 緑色文字   46 : バックを水色
# 33 : 黄色文字   47 : バックを白色
# 34 : 青色文字
# 35 : 紫色文字
# 36 : 水色文字
# 37 : 白色文字

LS_COLORS='rs=0:di=01;36;44:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

kaitoupassword () {
    touch `/home/masa/util/password_generator.rb`
}

ulimit -c unlimited
