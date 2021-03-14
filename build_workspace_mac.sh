#!/bin/bash
set -eu
# set -x

echo 'Initing brew'
sudo mkdir -p /opt/homebrew
sudo chown -R $(whoami):staff /opt/homebrew
cd /opt
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
echo 'Initing ibrew'
arch -x86_64 /bin/bash ./ibrew_install.sh
# 修改brew镜像源
git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
git -C "$(ibrew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
# 修改homebrew-core镜像源
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
git -C "$(ibrew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
# 更新
brew update
ibrew update

echo "Installing tmux"
ibrew install tmux
touch  ~/.tmux.conf
echo 'set -g default-terminal "xterm-256color"' >> ~/.tmux.conf
source  ~/.tmux.conf

echo "Installing zsh & set zsh as default shell"
ibrew install zsh
echo '/usr/local/bin/zsh' >> /etc/shells
chsh -s /usr/local/bin/zsh
echo "Installing oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installing incr plugins"
wget https://mimosa-pudica.net/src/incr-0.2.zsh
mkdir -p ~/.oh-my-zsh/custom/plugins/incr && mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr
echo "Installing highlighting plugins"
git clone git://github.com/jimmijj/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "Installing auto-jump"
ibrew install autojump
echo "Copy zsh configuration file to the home root"
cp .mac_zshrc ~/.zshrc

echo "Installing my Emacs"
ibrew tap d12frosted/emacs-plus
ibrew install emacs-plus
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/ZhengWG/spacemacs-private.git ~/.spacemacs.d
