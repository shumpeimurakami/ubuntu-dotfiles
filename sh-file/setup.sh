#At first you must type chmod +x setup.sh
#And second bash setup.sh

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y git tmux python3 python3-dev curl

cp .vimrc ~/
cp .tmux.conf ~/
# cp .bashrc ~/

# cp -r sh-file /
# cp -r cheatsheet.md ~/../../usr/local/share/vim

# settings Plug Install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall





