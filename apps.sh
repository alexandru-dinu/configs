# for app in /usr/share/applications/*.desktop; do echo "${app:24:-8}"; done
# https://kkovacs.eu/cool-but-obscure-unix-tools

# remove

sudo apt remove --purge "totem*"
sudo apt remove --purge "rhythmbox*"
sudo apt remove --purge "brasero*"
sudo apt remove --purge "parole*"
sudo apt remove --purge "catfish*"
sudo apt remove --purge "ristretto*"
sudo apt remove --purge "gedit*"
sudo apt remove --purge pidgin
sudo apt remove --purge xfburn
sudo apt remove --purge simple-scan
sudo apt remove --purge hplip
sudo apt remove --purge gnome-orca
sudo apt remove --purge evolution
sudo apt remove --purge fluid
sudo apt remove --purge gnome-mahjongg
sudo apt remove --purge gnome-mines
sudo apt remove --purge gnome-sudoku
sudo apt remove --purge "thunderbird*"
sudo apt remove --purge "mousepad*"
sudo apt remove --purge "remmina*"

# install

# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt-get install sublime-text

sudo apt-get install build-essential g++-multilib
sudo apt-get install chromium-browser htop vim git

sudo apt autoclean
sudo apt autoremove
