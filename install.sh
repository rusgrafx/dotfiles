#! /bin/bash

BACKUP_DIR="$HOME/.backup"
TIMESTAMP=`date "+%Y%m%d%H%M"`

echo -n "Overwrite your shell config? (y/n)? "
read answer

if echo "$answer" | grep -iq "^y" ; then
    echo " - Backing up your original files to $BACKUP_DIR"
    mkdir -p $BACKUP_DIR
    cp ~/.bash_profile "${BACKUP_DIR}/.bash_profile~${TIMESTAMP}"
    cp ~/.bash_aliases "${BACKUP_DIR}/.bash_aliases~${TIMESTAMP}"

    echo " - Updating your shell dot files..."
    cp ./_bash_profile ~/.bash_profile
    cp ./_bash_aliases ~/.bash_aliases

    echo " - Done"
    echo "   P.S. Restart your terminal to apply changes"
else
    echo "No changes were applied to your system"
fi

