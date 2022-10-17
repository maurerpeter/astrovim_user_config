# Custom AstroNvim user config

## Installation

#### Make sure you have AstroNvim set up correctly: [AstroNvim GitHub](https://github.com/AstroNvim/AstroNvim)

#### Make a backup of your AstroNvim user config, if you have one

```
mv ~/.config/nvim/lua/user ~/.config/nvim/lua/backup/user
```

#### Clone the repository and change the folder name

```
git clone https://github.com/maurerpeter/astrovim_user_config.git ~/.config/nvim/lua
mv ~/.config/nvim/lua/astrovim_user_config ~/.config/nvim/lua/user
```

#### Run PackerSync

```
nvim +PackerSync
```
