#! /bin/bash

# run this script as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

CWD="$(pwd)"

# sudo update
echo "Updating sudoers file..."
apt-get update
echo "Upgrading..."
apt-get upgrade -y

# install curl
echo "Installing curl..."
apt-get install curl -y

# sudo apt install git
echo "Installing git..."
apt-get install git -y

# install zshell
echo "Installing zshell..."
apt-get install zsh -y


# install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerline fonts
echo "Installing powerline fonts..."

# install neovim
echo "Installing neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /usr/local/bin/nvim

# install tmux
echo "Installing tmux..."
apt-get install tmux -y

# install i3-cinnamon
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2022.02.17_all.deb keyring.deb SHA256:52053550c4ecb4e97c48900c61b2df4ec50728249d054190e8a0925addb12fc6
dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
apt update
apt install i3

# transfer dotfiles
echo "linking dotfiles..."
ln -s $(CWD)/zsh/.zshrc ~/.zshrc
ln -s $(CWD)/tmux/.tmux.conf ~/.tmux.conf
ln -s $(CWD)/nvim/init.vim ~/.config/nvim/init.vim
ln -s $(CWD)/i3/ ~/.config/i3
