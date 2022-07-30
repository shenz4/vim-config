# check dependent command
if [ -x !$(command -v curl) ]
then
	sudo apt install curl
else
	echo 'checking: curl installed ok'
fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ ! -d ~/.vim/autoload/plug.vim ]
then 
	echo 'report: plug.vim install failed'
	exit 1
else
	echo 'report: plug.vim install success'
fi

# check dependent command
if [ -x !$(command -v git) ]
then
	sudo apt install git
else
	echo 'checking: git installed ok'
fi

# check dependent command
if [ -x !$(command -v vim) ]
then
	sudo apt install vim
else	
	echo 'checking: vim installed ok'
fi

# clone new config file
git clone https://github.com/shenz4/vim-config
if [ ! -d ./vim-config ]
then
	echo 'clone from git repo failed, exiting'
	exit 1
fi

# backup old config file
if [ -f ~/.vimrc ]
then
	echo 'moving your config file: ~/.vimrc => ~/.vimrc_backup'
	mv ~/.vimrc ~/.vimrc_backup
fi

# copy new config file
echo 'coping new config file: remote => ~/.vimrc'
cp vim-config/.vimrc ~/.vimrc
echo 'Emptying intermediate file: ./vim/config'
rm -rf vim-config
