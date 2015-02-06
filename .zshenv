unamerlst=`uname`

printenv PATH | grep -i -q "$HOME"
flg=$?

if [ $unamerlst = "Linux" -a $flg -ne 0 ]; then
    path=(
        ~/.rbenv/bin
        ~/.cabal/bin
        /opt/lang/haskell/haskell-platform/haskell-platform-2013.2.0.0/bin
        /opt/lang/scheme/gauche/gauche-0.9.4/bin
        $path
    )
fi
if [ $unamerlst = "Darwin" -a $flg -ne 0 ]; then
    path=(
        ~/.cabal/bin
        /usr/local/opt/coreutils/libexec/gnubin
        /usr/local/bin
        /usr/local/sbin
        $path
    )
fi
