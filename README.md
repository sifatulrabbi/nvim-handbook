# Neovim Handbook

## Install and setup the init.lua

Linux  
```bash
sudo [apt/pacman] [install/-S] nvim
```
Macos with brew  
```bash
brew install nvim
```

Create a new folder in the home dir under .config folder
```bash
mkdir -p ~/.config/nvim
```

Now copy the contents inside `init.lua` then:
```bash
cd ~/.config/nvim
```
```bash
nvim init.lua
```
Now paste all the contents there using `p`. Then click `escape` and use `:wq` to save and quit. Now reopen the nvim and all the required plugins will auto-install. If you need to install any LSPs then use `:Mason` and select the LSPs required for your workflow.

## Key combos

- Insert before `i`
- Insert after `a`
- Insert from a new line `o`
- Select the entire line `V`
- Select char by char `v`
- Go to definition `gd`
- See all the implementation `gi`
- Search within the current file `<space>/`
- Search entire dir `<space>sf`
- Move the cursor to the end of file `G`
- Move the cursor to the start `gg`
- Jump to the end of the line `$`
- Jump to start of line `_` or `^`
- Delete a line `dd`
- Delete a selection `d`
- Delete a single char `vd` [basically select with `v` then delete with `d`]
- Copy/yank a selection `y`
- Copy/yank a line `yy`
- Copy single char `Y`
- Paste after `p`
- Pase before `P`
- Open terminal `:terminal`
- Format using the built-in LSP `:Format`
- Save the current file/buffer `:w`
- Quit nvim `:q`
- Quit and reset changes `:q!`
- Save and quit `:wq`
- Move to the start of the block `(`
- Move to the end of the block `)`
