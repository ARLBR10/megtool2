version="1.0"
madeby="megarthur"

# Settings colors
COLOR_RED='\033[0;31m'
COLOR_BLUE='\033[0;34m'

# Requiring `sudo` permission
sudo ls > /dev/null

# Checking if `gum` is installed
REQUIRED_PKG="gum"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")

# if not installed install it
if [ "" = "$PKG_OK" ]; then
  echo "Installing `gum` package..."
  sudo mkdir -p /etc/apt/keyrings > /dev/null
  curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg > /dev/null
  echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/>  sudo apt-get update > /dev/null
  sudo apt-get install gum > /dev/null
  echo "`gum` package is Installed"
fi

echo 'Instaling the latest package of the `meg-cli`'
#wget https://tools.megarthur.dev/release -P /usr/local/megcli/bin.sh
# ln -s /usr/local/megcli/bin.sh /usr/local/bin/megtool
clear
#echo 'Installed'
gum style \
        --foreground "#0148ca" --border-foreground "#061d5b" --border double \
        --align center --width 50 --margin "1 2" --padding "2 4" \
        'Welcome to `meg-cli`' 'Made by `megarthur` to make life easier'
