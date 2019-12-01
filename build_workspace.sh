echo "Installing tmux"
sudo apt install tmux
echo "Installing pyenv"
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo "Installing virtualenv"
sudo pip install virtualenv
mkdir ~/virtualenv
echo "Installing zsh & set zsh as default shell"
sudo apt install zsh
chsh -s /bin/zsh
echo "Installing oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://mimosa-pudica.net/src/incr-0.2.zsh
mkdir -p ~/.oh-my-zsh/plugins/incr && mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr
chmod 777 ~/.oh-my-zsh/plugins/incr/incr-0.2.zsh
git clone git://github.com/jimmijj/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "Copy zsh configuration file to the home root"
cp .zshrc ~/
echo "Installing neo-vim"
wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage ~/
chmod u+x ~/nvim.appimage
echo 'alias vim='~/nvim.appimage' > ~/.zshrc
#TODO configuration for nvim
echo "Installing my Emacs"
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/ZhengWG/spacemacs-private.git ~/.spacemacs.d
