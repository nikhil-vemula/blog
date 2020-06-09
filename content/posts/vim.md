---
title: "Vim"
date: 2020-06-07T17:09:24+05:30
type: post
---

## General

* `:!` to run external command.
* `:w <filename>` to write to new file.
* `y` to copy `v` to paste

## Movement

* Move with `h, j, k, l`.
* Move to start of line with `0`.
* Move to start of next word with `w`.
* Move to end of current word with `e`.
* Move to start of file using `gg`
* Move to end of file using `G`
* Move to line number using `48G`
* Show current line number using `ctrl-g`
* Go to matching parenthesis using `%`

>Note: Movement can be combined with number. Ex: 2w, 3e

## Inserting or Editing

* Insert at current position with `i`.
  * Append at end of line with `A`.
* Put the deleted content under current position with `p`

## Replace

* Replace with character with `rx`. Replaces current characted with 'x'

## Search

* Use `/` followed by search text.
* Use `n` to search next
* Use `N` to search previous

* Typing ":set xxx" sets the option "xxx".  
 Some options are:  
  * 'ic' 'ignorecase'   ignore upper/lower case when searching
  * 'is' 'incsearch'    show partial matches for a search phrase
  * 'hls' 'hlsearch'    highlight all matching phrases

## Change operator

* c [number] [motion], puts in insert mode in the direction of motion.
* `ce` delete till end of current word and puts in insert mode.
* `c$` deleted till end of current line and puts in insert mode.

## Delete

* Delete a letter with `x`.
* Deletig with `d <motion>` 
  * w - start of next work.(exluding its first character).
  * e - end of current word. (including last letter)
  * $ - till end of current line.
* Delete a line with `dd`

>Note: Delete can be combined with number. Ex: d2w, d3e

## Undo

* Undo last command with `u`.
* Undo whole line with `U`


### Reference

* vimtutor program
