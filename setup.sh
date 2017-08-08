





<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{margin-bottom:8.0pt;
	line-height:107%;}
 /* Page Definitions */
 @page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
-->








#!/bin/bash

PROFILELINE='[[ -s "$HOME/.rvm/scripts/rvm" ]] && source
"$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a
function*'
PROFILEFILE=~/.profile
BASHRCLINE="source $PROFILEFILE"
BASHRCFILE=~/.bashrc
RUBYVERSION=2.3

checkerror () {
        RC=$?
        if [ $RC -ne 0 ]; then
                echo
"ERROR: $*"
        fi
}

echo "Installing gpg key"
gpg --keyserver hkp://keys.gnupg.net --recv-keys
409B6B1796C275462A1703113804BB82D39DC0E3
7D2BAF1CF37B13E2069D6956105BD0E739499BDB
checkerror "Unable to install GPG key required to install RVM"

\curl -sSL https://get.rvm.io |
bash -s stable --ruby
checkerror "Unable io install RVM"

source $PROFILEFILE
checkerror "Unable to source profile file"

echo "Installing Ruby - enter corporate password when prompted"
rvm install ruby-$RUBYVERSION
checkerror "Unable to install Ruby version $RUBYVERSION"

grep -qF "$PROFILELINE" "$PROFILEFILE" || echo
"$PROFILELINE" >> "$PROFILEFILE"
checkerror "Unable to add $PROFILELINE to $PROFILEFILE"

source $PROFILEFILE
checkerror "Unable to source profile file"

if [[ -f $BASHRCFILE ]]; then
    grep -qF "$BASHRCLINE"
"$BASHRCFILE" || echo "$BASHRCLINE" >>
"$BASHRCFILE"
    checkerror "Unable to add $BASHRCLINE to $BASHRCFILE"
else
    echo "Unable to locate the bashrc file
$BASHRCFILE"
    exit 1
fi


source $PROFILEFILE
checkerror "Unable to source profile file"

rvm --default use $RUBYVERSION
checkerror "Unable to set the default version of ruby within RVM to
$RUBYVERSION" 






