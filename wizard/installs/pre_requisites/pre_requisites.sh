#------------------------------------------------------------
# Pre-requisites required to run the installation process
# such as homebrew.
# ------------------------------------------------------------
source ./wizard/settings/settings.sh

read -r -p "[PRE REQUISITES]: Install brew? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "Updating brew..."
    brew update
fi

read -r -p "[PRE REQUISITES]: Install pyenv? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    echo "Installing pyenv with brew..."
    brew install pyenv
fi

read -r -p "[PRE REQUISITES]: Configure pyenv in bash_profile? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then
    # Pyenv commands
    # https://github.com/pyenv/pyenv/blob/master/COMMANDS.md

    echo "Adding pyenv commands to bash_profile..."
    echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

    echo "Installing python 3.7.5 with pyenv..."
    pyenv install 3.7.5

    echo "Showing installed pyenv versions..."
    pyenv versions

    echo "Setting pyenv global..."
    pyenv global 3.7.5
fi

read -r -p "[PRE REQUISITES]: Install xcode command line tools? [y/n] " response
if [[ "$response" =~ $YES_REGEXP ]]
then

    echo "Adding xcode commands line tools..."
    xcode-select --install

fi