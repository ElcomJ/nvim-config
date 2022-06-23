Tutorial do que instalar antes do neovim: https://www.manualdocodigo.com.br/vim-basico/


Assim que baixar o arquivo de tema do tmux ir no diretório do arquivo e dar o comando abaixo:

cat tmux-gruvbox-dark.conf >> ~/.tmux.conf

Logo após fazer isso, reinicie o seu tmux e o tema ja irá estar aplicado

extensões utilizadas com o coc.nvim: 

let g:coc_global_extensions = ['coc-explorer', 'coc-go', 'coc-prettier', 'coc-snippets', 'coc-pyright', 'coc-tabnine']