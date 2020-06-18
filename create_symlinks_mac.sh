rm -f  ~/.tmux.conf ~/.config/nvim/init.vim ~/.config/nvim/after/plugin ~/.zshrc
mkdir -p ~/.config/nvim/after
ln -sf ~/git/scripts/configuration/.tmux.conf ~/.tmux.conf
ln -sf ~/git/scripts/configuration/config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/git/scripts/configuration/config/nvim/after ~/.config/nvim/after/plugin
# put any configs in create local vim plugin 
mkdir -p ~/git/scripts/configuration/config/nvim/plugged/LocalVim/plugin
ln -sf ~/git/scripts/configuration/config/nvim/localconfig/init2.vim ~/git/scripts/configuration/config/nvim/plugged/LocalVim/plugin/LocalVim.vim

ln -sf ~/git/scripts/configuration/config/nvim/plugged/* ~/.config/nvim/plugged
ln -sf ~/git/scripts/configuration/.zshrc ~/.zshrc
ln -sf ~/git/scripts/vimwiki ~/vimwiki
