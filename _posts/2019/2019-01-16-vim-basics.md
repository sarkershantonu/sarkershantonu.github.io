---
layout: post
title: How to use vim in cli?
date: "2019-01-16 05:02"
tags: [tools]
permalink: /2019/01/16/vim-basics/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Tools"
gh-badge: [star,follow]
comments: true
---

[draft] 

In this article we are going to see how we can use Vim.

### What is VIM?
Vim is the most popular cli editor used mostly in linux/unix like Os. System admins, developer use vim daily basis for scripting and coding. You can see popularity of VIM in [stackoverflow](https://stackoverflow.blog/2017/05/23/stack-overflow-helping-one-million-developers-exit-vim/) only for exiting VIM. 
  
### installation via apt
- Vim CLI only ```sudo apt install vim```
- Vim Gtk2 GUI ```sudo apt install vim-gtk3```
- Vim tiny version ```sudo apt install vim-tiny```
- neovim ```sudo apt install neovim```
- Vim athena GUI ```sudo apt install vim-athena```
- Vim Gtk GUI ```sudo apt install vim-gtk```
- Another Vim tiny version ```sudo apt install vim-nox```

### How it works?
- Vim has three modes : 
    - Normal Mode : For navigation . When you press ESC, all modes come back to this mode. 
    - Insert Mode : For insert/edit. 
    - View/visual Mode
    - Command mode : For inserting editor command
    - Select Mode : Similar to visual mode but more functionality. 
    - Ex-mode

### Command Mode Basics
- To exit : ```:q``` 
- To save and exit ```:wq```
- To trash all changes ```:q!```
- To delete the unwanted character ```x```
- To undo the last the command and U to undo the whole line ```u``` 
- To redo ```CTRL-R ```
- To append text at the end ```A```
- Move the cursor to the beginning of the word to delete that word```dw ```
- To move the cursor two words forward```2w```
- To move the cursor to the end of the third word forward```3e```
- To move to the start of the line```0```
- To delete multiple words, we can use **dXw**, here X can be any number. For 2 words ```d2w```, for 3 words ```d3w```
- To delete multiple lines, we can use **Xdd** dd to delete the line and 2dd to delete to line .number can be changed for deleting the number of consecutive words