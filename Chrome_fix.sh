#!/bin/bash
echo "____    _    ___
/ ___|  / \  |_ _|
\___ \ / _ \  | |
 ___) / ___ \ | |
|____/_/   \_\___|"
echo "loding"
echo "____ _                              _____ _               ____  _
 / ___| |__  _ __ ___  _ __ ___   ___|  ___(_)_  _____ _ __/ ___|| |_ __ _
| |   | '_ \| '__/ _ \| '_ ` _ \ / _ \ |_  | \ \/ / _ \ '__\___ \| __/ _` |
| |___| | | | | | (_) | | | | | |  __/  _| | |>  <  __/ |   ___) | || (_| |
 \____|_| |_|_|  \___/|_| |_| |_|\___|_|   |_/_/\_\___|_|  |____/ \__\__,_|

      _           _
 _ __| |_ ___  __| |
| '__| __/ _ \/ _` |
| |  | ||  __/ (_| |
|_|   \__\___|\__,_|'
echo "Removing distribution provided chromium packages and dependencies..."
sudo apt purge chromium* chromium-browser* -y -qq && apt autoremove -y -qq
echo "Enabling PPA support..."
[ ! -f .parrot ] && apt update -qq; apt install software-properties-common gnupg --no-install-recommends -y -qq
echo " Adding chromium-team stable ppa"
sudo add-apt-repository ppa:ultrahacx/chromium-universal -y
apt update -qq; apt install chromium-browser --no-install-recommends -y
echo "Patching application shortcuts..."
sed -i 's/chromium-browser %U/chromium-browser --no-sandbox %U/g' /usr/share/applications/chromium-browser.desktop
echo 'alias chromium="chromium-browser --no-sandbox" >> /etc/profile'
echo "You can now start chromium by using the application icon or by typing chromium" && . /etc/profile
