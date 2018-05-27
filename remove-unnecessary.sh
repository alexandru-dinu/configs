# for app in /usr/share/applications/*.desktop; do echo "${app:24:-8}"; done

sudo apt remove --purge "totem*"
sudo apt remove --purge "rhythmbox*"
sudo apt remove --purge "brasero*"
sudo apt remove --purge "parole*"
sudo apt remove --purge "catfish*"
sudo apt remove --purge pidgin
sudo apt remove --purge xfburn
sudo apt remove --purge simple-scan
sudo apt remove --purge gnome-orca

sudo apt autoclean
sudo apt autoremove
