# !/bin/bash
# ref1--- https://github.com/tpope/vim-pathogen ---
# ref2--- http://blog.csdn.net/cwqbuptcwqbupt/article/details/41179217 ---

# install vim & cscope
sudo apt-get install -y vim
sudo apt-get install -y cscope

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp pathogen.vim ~/.vim/autoload

# configure vim
echo -e "execute pathogen#infect() \nsyntax on \nfiletype plugin indent on" > ~/.vimrc
mkdir -p ~/.vim/bundle/cscope_maps/plugin/
cp cscope_maps.vim ~/.vim/bundle/cscope_maps/plugin/cscope_maps.vim

echo "Done!"

