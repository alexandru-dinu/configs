### Common motions

- prepend on multiple lines: `C-v -> S-i -> <text> -> ESC`
- append on multiple lines: `C-v -> $ -> S-A -> <text> -> ESC`
- (replace) copy current word under cursor: `C-r-w`
- recording a macro: `qq -> <actions> -> q (in normal mode)` then `@q` to apply

### `<leader>` shortcuts

- toggle spell checking: `ss`

### Keybindings

|           Behaviour               |         vscode            |         vim        |
| --------------------------------- |-------------------------- | ------------------ |
| Select all                        | `C-a`                     | `ggVG`             |
| Go to beginning of the line       | `A-left`                  | `^`                |
| Go to end of the line             | `A-right`                 | `$`                |
| Go to line <n>                    | `C-g, _num_`              | `:_num_`           |
| Delete line(s)                    | `C-S-k`                   | `dd`               |
| Delete from cursor to line end    | `C-S-d`                   | `S-d`              |
| Duplicate line(s)                 | `C-d`                     | `yyp`              |
| Fast selection                    | `S`                       | `v`                |
| Go to matching bracket            | `C-S-/`                   | `%`                |
| Move line(s) up                   | `A-up`                    | `ddkP` or `:m<-N>` |
| Move line(s) down                 | `A-down`                  | `ddp` or `:m<+N>`  |
| Go to definition                  | `S-A-d`                   |                    |
| Go back (from definition)         | `S-A-s`                   |                    |
| Peek definition                   | `C-A-g`                   |                    |
| Change all occurrences            | `S-F2`                    | `:%s`              |
| Insert cursor up                  | `C-S-up`                  | visual mode        |
| Insert cursor down                | `C-S-down`                | visual mode        |
| Reveal (in) explorer              | `S-A-e`                   | `F2`               |
| Sidebar visibility                | `S-A-b`                   |                    |
| Open definition to the side       | `S-A-g`                   |                    |
| Split editor up/down/left/right   | `S-A-up/down/left/right`  |                    |
| Toggle show whitespace            |                           | `F5`               |


### Resources

- https://www.youtube.com/watch?v=MAHC9eZbx4o
- https://stackoverflow.com/a/2559262/3142472
- https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
