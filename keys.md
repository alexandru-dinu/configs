## 1. zsh

- beginning / end of line: `C-a` / `C-e`
- forward / backwards one word: `A-f` / `A-b`
- clear line: `C-u`
- clear text after cursor: `C-k`
- delete word before / after cursor: `C-w` / `A-d`


## 2. vim + vscode

### 2.1. Common motions

- prepend on multiple lines: `C-v -> S-i -> <text> -> ESC`
- append on multiple lines: `C-v -> $ -> S-A -> <text> -> ESC`
- (replace) copy current word under cursor: `C-r-w`
- record a macro: `q<letter> -> <actions> -> q (in normal mode)` then `@<letter>` to apply
- **splits**
  - current window:   `:b <N/bufname>`
  - vertical split:   `:vsp | b <N/bufname>`
  - horizontal split: `:sp | b <N/bufname>`

### 2.2. Language specific

- [Python] run selection in interpreter:  `<visual><leader>py`
- [Haskell] run selection in interpreter: `<visual><leader>hs`

### 2.3. Keybindings

| Behaviour                         | vscode                     | vim                |
| :-------------------------------: | :------------------------: | :----------------: |
| select all                        | `C-a`                      | `ggVG`             |
| go to beginning of the line       | `A-left`                   | `^`                |
| go to end of the line             | `A-right`                  | `$`                |
| go to line <n>                    | `C-g, _num_`               | `:_num_`           |
| delete line(s)                    | `C-S-k`                    | `dd`               |
| delete from cursor to line end    | `C-S-d`                    | `S-d`              |
| duplicate line(s)                 | `C-d`                      | `yyp`              |
| fast selection                    | `S`                        | `v`                |
| go to matching bracket            | `C-S-/`                    | `%`                |
| move line(s) up                   | `A-up`                     | `ddkP` or `:m<-N>` |
| move line(s) down                 | `A-down`                   | `ddp` or `:m<+N>`  |
| go to definition                  | `S-A-d`                    |                    |
| go back (from definition)         | `S-A-s`                    |                    |
| peek definition                   | `C-A-g`                    |                    |
| change all occurrences            | `S-F2`                     | `:%s`              |
| insert cursor up                  | `C-S-up`                   | visual mode        |
| insert cursor down                | `C-S-down`                 | visual mode        |
| sidebar visibility                | `S-A-b`                    |                    |
| open definition to the side       | `S-A-g`                    |                    |
| split editor up/down/left/right   | `S-A-up/down/left/right`   |                    |
| reveal (in) explorer              | `S-A-e`                    | `F2`               |
| run shell cmd prompt              |                            | `F3`               |
| toggle cursorline                 |                            | `F4`               |
| toggle show whitespace            |                            | `F5`               |
| toggle spell check                |                            | `<leader>ss`       |

### 2.4. Resources

- https://www.youtube.com/watch?v=MAHC9eZbx4o
- https://stackoverflow.com/a/2559262/3142472
- https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
