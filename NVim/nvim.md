Absolutely! Here's a handy **NeoVim Cheat Sheet** to get you going fast. It's broken down by categories: basics, navigation, editing, search, window management, and plugins.

---

## 🟢 **NeoVim Cheat Sheet**

### 🧱 **Modes**
- `i` — Insert mode  
- `Esc` — Normal mode  
- `:` — Command mode  
- `v` — Visual mode  
- `V` — Visual line mode  
- `Ctrl + v` — Visual block mode

---

### 🚶 **Movement**
- `h` / `l` — Left / Right  
- `j` / `k` — Down / Up  
- `w` / `W` — Next word (W ignores punctuation)  
- `b` / `B` — Back word  
- `e` / `E` — End of word  
- `gg` — Go to start of file  
- `G` — Go to end of file  
- `0` — Beginning of line  
- `^` — First non-blank on line  
- `$` — End of line  
- `:n` — Go to line n  
- `Ctrl + d` / `Ctrl + u` — Half-page down / up  
- `Ctrl + f` / `Ctrl + b` — Full-page down / up

---

### ✍️ **Editing**
- `i` — Insert before cursor  
- `I` — Insert at beginning of line  
- `a` — Append after cursor  
- `A` — Append at end of line  
- `o` — Open new line below  
- `O` — Open new line above  
- `x` — Delete character  
- `dd` — Delete line  
- `yy` — Yank (copy) line  
- `p` — Paste after  
- `P` — Paste before  
- `r<char>` — Replace single character  
- `u` — Undo  
- `Ctrl + r` — Redo  
- `.` — Repeat last change  

---

### 🔍 **Search & Replace**
- `/word` — Search forward  
- `?word` — Search backward  
- `n` / `N` — Next / Previous match  
- `:%s/old/new/g` — Replace all in file  
- `:s/old/new/g` — Replace in current line

---

### 🪟 **Window (Split) Management**
- `:sp` — Horizontal split  
- `:vsp` — Vertical split  
- `Ctrl + w` + `h/j/k/l` — Move between splits  
- `Ctrl + w` + `c` — Close current split  
- `Ctrl + w` + `=` — Equalize split sizes  
- `Ctrl + w` + `r` — Rotate splits  

---

### 📁 **File Management**
- `:e <file>` — Edit (open) file  
- `:w` — Save  
- `:wq` — Save and quit  
- `:q!` — Quit without saving  
- `:bn` / `:bp` — Next / Previous buffer  
- `:bd` — Delete buffer  

---

### 🔌 **Plugins (with `vim-plug`)**
- `:PlugInstall` — Install plugins  
- `:PlugUpdate` — Update plugins  
- `:PlugClean` — Remove unused plugins  
- `:PlugStatus` — List plugin statuses  

---

### 🛠️ **Useful Commands**
- `:set number` — Show line numbers  
- `:set relativenumber` — Show relative numbers  
- `:set paste` — Disable autoindent (use before pasting)  
- `:noh` — Clear search highlight  
- `:help <cmd>` — Get help on a command  

---

### 🧠 **Pro Tips**
- Use `vim-surround`, `vim-commentary`, `telescope.nvim`, and `nvim-treesitter` for productivity.
- Use `init.lua` or `init.vim` to configure NeoVim (Lua is now preferred).
- Use `LSP` and `nvim-cmp` for autocompletion and diagnostics.

---

Want it as a downloadable PDF or a terminal-friendly version?
