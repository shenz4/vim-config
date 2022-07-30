sudo snap install node --classic
echo "node version: $(node -v)"
echo "npm version: $(npm -v)"
sudo npm install yarn -g

coc_dir=~/.vim/plugged/coc.nvim
cd $coc_dir
yarn install
yarn build
cd -
