# adapted from https://raw.githubusercontent.com/KillianLucas/open-interpreter/main/installers/oi-mac-installer.sh
function openInterpreterInstall() {
    PYENV_VERSION='3.11.7'

    pyenv install $PYENV_VERSION --skip-existing
    pyenv global $PYENV_VERSION

    pyenv exec pip install open-interpreter

    pyenv shell $PYENV_VERSION
    pyenv pip install open-interpreter
    pyenv shell --unset
}
