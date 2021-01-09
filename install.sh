sudo apt-get update
sudo apt-get install zsh
sudo apt-get install fish
curl -L https://get.oh-my.fish | fish

omf install nvm

mkdir -p ~/.nvim/tmp/swap
mkdir -p ~/.nvim/tmp/undo
mkdir -p ~/.nvim/tmp/backup

sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty
npm install -g alacritty-themes
git clone https://github.com/alacritty/alacritty.git
sudo tic -xe alacritty,alacritty-direct alacritty/extra/alacritty.info
rm -rf alacritty

