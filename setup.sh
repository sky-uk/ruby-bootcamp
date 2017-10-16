#!/bin/bash

PROFILELINE='export PATH=$PATH:/$HOME/.rvm/bin && [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*'


PROFILEFILE=~/.profile
BASHRCLINE="source $PROFILEFILE"
BASHRCFILE=~/.bashrc
RUBYVERSION=2.3

checkerror () {
        RC=$?
        if [ $RC -ne 0 ]; then
                echo "ERROR: $*"
        fi
}

echo "Installing gpg key"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
checkerror "Unable to install GPG key required to install RVM"

\curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/stable/binscripts/rvm-installer | bash -s stable 
checkerror "Unable io install RVM"

source $PROFILEFILE
checkerror "Unable to source profile file"

echo "Installing Ruby - enter corporate password when prompted"
rvm install ruby-$RUBYVERSION
checkerror "Unable to install Ruby version $RUBYVERSION"


grep -qF "$PROFILELINE" "$PROFILEFILE" || echo "$PROFILELINE" >> "$PROFILEFILE"
checkerror "Unable to add $PROFILELINE to $PROFILEFILE"

source $PROFILEFILE
checkerror "Unable to source profile file"

if [[ -f $BASHRCFILE ]]; then
    grep -qF "$BASHRCLINE" "$BASHRCFILE" || echo "$BASHRCLINE" >> "$BASHRCFILE"
    checkerror "Unable to add $BASHRCLINE to $BASHRCFILE"
else
    echo "Unable to locate the bashrc file $BASHRCFILE"
    exit 1
fi


source $PROFILEFILE
checkerror "Unable to source profile file"

rvm --default use $RUBYVERSION
checkerror "Unable to set the default version of ruby within RVM to $RUBYVERSION"
