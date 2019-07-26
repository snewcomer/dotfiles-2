log_file=~/install_progress_log.txt

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get install zsh-syntax-highlighting

sudo apt-get -y install vim-gnome
if type -p vim > /dev/null; then
    echo "Vim Installed" >> $log_file
else
    echo "Vim FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install keepassx
if type -p keepassx > /dev/null; then
    echo "Keepassx Installed" >> $log_file
else
    echo "Keepassx FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install figlet
if type -p figlet > /dev/null; then
    echo "figlet Installed" >> $log_file
else
    echo "figlet FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install espeak
if type -p espeak > /dev/null; then
    echo "espeak Installed" >> $log_file
else
    echo "espeak FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install curl
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "crul FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install exuberant-ctags
if type -p ctags-exuberant > /dev/null; then
    echo "exuberant-ctags Installed" >> $log_file
else
    echo "exuberant-ctags FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y gtk-redshift
if type -p redshift > /dev/null; then
    echo "redshift Installed" >> $log_file
else
    echo "redshift FAILED TO INSTALL!!!" >> $log_file
fi


# ---
# Install git-completion and git-prompt
# ---
cd ~/
curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv ~/git-completion.bash ~/.git-completion.bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
echo "git-completion and git-prompt Installed and Configured" >> $log_file

# ---
# Install node
# ---
cd ~/
curl https://get.volta.sh | bash
volta install node
cd ~/

curl http://beyondgrep.com/ack-2.08-single-file > ~/ack && chmod 0755 !#:3
sudo mv ~/ack /usr/bin/ack
sudo chmod 755 /usr/bin/ack
if type -p ack > /dev/null; then
    echo "Ack Downloaded and Installed" >> $log_file
else
    echo "Ack FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get install silversearcher-ag
if type -p ag > /dev/null; then
    echo "Silver searcher Installed" >> $log_file
else
    echo "Silver searcher FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install python3-pip
if type -p pip3 > /dev/null; then
    echo "pip Installed" >> $log_file
else
    echo "pip FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install bpython3
if type -p bpython3 > /dev/null; then
    echo "bpython3 Installed" >> $log_file
else
    echo "bpython3 FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install conky
if type -p conky > /dev/null; then
    echo "conky Installed" >> $log_file
else
    echo "conky FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install tmux
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install python3-dev

sudo pip3 install virtualenvwrapper
if pip3 freeze | grep virtualenvwrapper > /dev/null; then
    echo "virtualenvwrapper Installed" >> $log_file
else
    echo "virtualenvwrapper FAILED TO INSTALL!!!" >> $log_file
fi

sudo pip3 install jedi
if pip3 freeze | grep jedi > /dev/null; then
    echo "jedi Installed" >> $log_file
else
    echo "jedi FAILED TO INSTALL!!!" >> $log_file
fi

sudo pip3 install flake8
if pip3 freeze | grep flake8 > /dev/null; then
    echo "flake8 Installed" >> $log_file
else
    echo "flake8 FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install automake autoconf m4 libncurses5-dev libssl-dev unixodbc-dev
sudo apt-get -y xsltproc fop

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy -Scott"
rm $log_file
