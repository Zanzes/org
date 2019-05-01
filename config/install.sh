#!/bin/bash

# Check that no more than one argumen is passed in
if [[ $# > 1 ]]; then
    echo "Argument error: Expected 1 argument got $#";
fi

OVERRIDE_CHECK=0

# Disable override check
if [[ $1 == "-f" ]]; then
    echo "Executing full install without prompting";
    OVERRIDE_CHECK=1
fi

rm ~/.emacs.d/init.el
rm ~/.emacs.d/lzconf.org

echo "Installing emacs configuration files..."
cp -v init.el ~/.emacs.d/init.el
cp -v lzconf.org ~/.emacs.d/lzconf.el 

INSTALL_EMACS_DESKTOP=0

if [[ $OVERRIDE_CHECK != 1 ]]; then
    awns="x";
    p_text="Install emacs desktop file? n/y\n[n]: ";
    while [[ $awns != "n" ]] && [[ $awns != "y" ]]; do
	read -p "$p_text" -n 1 awns;
    done
fi

if [[ $awns == "y" ]] || [[ $OVERRIDE_CHECK == 1 ]]; then
    echo "Installing desktop file...";
    cp -f emacs.desktop /usr/share/xsessions/emacs.desktop;
else
    echo "Skipping desktop file";
fi

if [[ $OVERRIDE_CHECK != 1 ]]; then
    awns="x";
    p_text="Install emacs .xinitrc file? n/y\n[n]: ";
    while [[ $awns != "n" ]] && [[ $awns != "y" ]]; do
	read -p "$p_text" -n 1 awns;
    done
fi

if [[ $awns == "y" ]] || [[ $OVERRIDE_CHECK == 1 ]]; then
    echo "Installing .xinitrc...";
    cp -f \?xinitrc ~/.xinitrc;
else
    echo "Skipping .xinitrc";
fi
