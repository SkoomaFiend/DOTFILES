# Man cmd

- Open command manpage in neovim


[text]

# s/

## Flags
- goes at end of s/ command

g - replace all occurences in each line
c - ask for confirmation
i - ignore case
I - dont ignore case
n - count matches that would be made and highlight

## &

Command or hotkey & will repeat last used s/ command


## Current line
s/doodo/replace - Replace first doodo on current line

s/pattern/replace/g - Replace all pattern on current line


## Whole File
%s/pattern/replace/g - Replace all patterns in file

## Specific lines
10,20s/pattern/replace - Replace only on global lines 10-20


# search
/search_pattern\c - ignore case

[files]

# file write

:'<,'>w TEST - select text with v then type this to write text to new file TEST

# read

:r filepath - will read file from path and output into current file
:r !ls 

# edit

:e filepath - will open file at path
:e! - reopen or restore current file to original state
    - will not work if save hapenned after loading 


[help]

:help w
:help c_CTRL-D
:help insert-index
:help user-manual

can use ctrl-d when in  command mode (:) to list commands starting with what is typed - :e then ctrl d "test" 

