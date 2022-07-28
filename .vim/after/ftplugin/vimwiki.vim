setlocal shiftwidth=2
setlocal tabstop=2

let lightmode = system("[ $(cat ~/.brightmode) == 'light' ] && echo -n 1 || echo -n 0 ")
if lightmode 
  colorscheme gruvbox
else
  colorscheme onedark
endif
