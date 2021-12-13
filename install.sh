# Note: The URL Links should not has a ".git" suffix
plugins=(
	https://github.com/neoclide/coc.nvim
	https://github.com/kien/ctrlp.vim
	https://github.com/preservim/nerdtree
	https://github.com/AndrewRadev/splitjoin.vim
	https://github.com/preservim/tagbar
	https://github.com/SirVer/ultisnips
	https://github.com/vim-airline/vim-airline
	https://github.com/easymotion/vim-easymotion
	https://github.com/fatih/vim-go
	https://github.com/tpope/vim-commentary
	https://github.com/jiangmiao/auto-pairs
	https://github.com/tomasr/molokai
)

for i in ${plugins[*]}; do
	url=$i
	plug_name=$(basename ${url})

	if [ ! -d "./${plug_name}" ]
	then
		echo "Installing ... ${plug_name}"
		git clone ${url}
	else
		echo "Has been existed, quit for ${plug_name}"
	fi
done
