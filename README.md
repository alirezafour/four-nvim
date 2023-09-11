# four-nvim
my custom neovim config file
## Install
### linux install
`git clone https://github.com/alirezafour/four-nvim.git ~/.config/nvim`
### windows install
`git clone https://github.com/alirezafour/four-nvim.git ~\AppData\Local\nvim`  

run nvim and let Lazy install all plugins.
then run `:MasonInstallAll`
done.

### adding or editing plugins
every plugins are seperatly confugues in `lua/plugins`  
- for deleting plugins simply remove the lua file in `lua/plugins` and run Lazy and Clean  
- for adding plugins create new lua file in plugins and return the plugin name and structure table  
