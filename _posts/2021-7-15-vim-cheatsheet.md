---
title: Vim Cheatsheet
layout: post
preamble: Just a stupid cheatsheet for quick vim motions.
---

## General Commands

- `O` - put a line above
- `t!` go to the immediate left of !
- `f!` go on !
- `%` toggle between opening and closing brackets
- `cw` - change word, get rid of the word and drop in insert mode
- `D` - to delete the rest of the line
- `C` - delete the rest of the line and drop in insert mode
- `ct}` - delete everything up until } and drop in insert
- `dt/` - delete till /, or any char for that matter
- `*` - take the cursor to the same word, use it to drop to all the places the same word exists
- `zz` - center the cursor vertically
- `a` - drop in insert and move one position right
- `A` - go to the end of the line
- `10x` - delete 10 chars to the right
- `~` - swap the case of the character
- `5~` - swap the case of the next 5 characters
- `.` - repeat the last command
- `rt` - replace the current character with t
- `r3o` - replace the next 3 letters with o
- `>>` - indent that line forward
- `<<` - indent that line backward

## Macros

Record keystrokes and replay them

- `q` to start recording a macro, and then press the key you want to save the macro to, `qw` will start recording a macro for key `w`
- press `q` again to stop recording the macro, to replay the macro, press `@w`
- `20@w` to run the macro on the next 20 lines

## Searching

- `/` to start searching, `n` to go to the word, `N` to go back
