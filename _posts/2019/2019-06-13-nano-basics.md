---
layout: post
title: How to use nano in cli?
date: "2019-06-13 05:02"
tags: [tools]
permalink: /2019/06/13/nano-basics/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Tools"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can use Vim.

### What is NANO?
Nano is one of the commandline editor pre installed mostly in debian based linux distribution. 

### installation 
- via apt(debian) ``` sudo apt install -y nano```
- Via yum(CentOS/Fedora)``` yum install nano ```
  
### Basic Commands
- Open a file Syntax ```nano _fileName_```. Example : ```nano readme.md```. 
- Open a file with specific position by line number and column number ```nano +lineNo,columnNo _filename_```. 

### Basic Commands on file open
- Exit ```CTRL+X```
- Get Help ```CTRL+G```
- Write Out ```CTRL+O```
- Find letter/word ```CTRL+W```
- Cut Text ```CTRL+K```
- Justify ```CTRL+j```
- Cur Pos ```CTRL+C```
- Read File ```CTRL+R```
- Replace text ```CTRL+\```
- Uncut text ```CTRL+U```
- TO Liner ```CTRL+\```
- Go to line No ```CTRL+_```
- move forward one character: ```Ctrl+F``` (^F)
- move back one character: ```Ctrl+B``` (^B)
- move forward one word: ```Ctrl+Space``` (^Space)
- move back one word: ```Alt+Space``` (M-Space)
- move to the previous line: ```Ctrl+P``` (^P)
- move to the next line: ```Ctrl+N``` (^N)
- move to the next page: ```Ctrl+V``` (^V)
- move to the previous page: ```Ctrl+Y``` (^Y)
- move to the beginning of the line: ```Ctrl+A``` (^A)
- move to the end of the line: ```Ctrl+E``` (^E)

### All Keyboard shortcuts
After opening nano, if you press ```CTRL+G```, you will get all shortcuts 

``` 
^G    (F1)      Display this help text
^X    (F2)      Close the current file buffer / Exit from nano
^O    (F3)      Write the current file to disk
^R    (F5)      Insert another file into the current one

^W    (F6)      Search forward for a string or a regular expression
^\    (M-R)     Replace a string or a regular expression
^K    (F9)      Cut the current line and store it in the cutbuffer
^U    (F10)     Uncut from the cutbuffer into the current line

^J    (F4)      Justify the current paragraph
                Invoke the spell checker, if available
^T    (F12)     Invoke the linter, if available
                Invoke formatter, if available

^C    (F11)     Display the position of the cursor
^_    (M-G)     Go to line and column number

M-U             Undo the last operation
M-E             Redo the last undone operation

M-A   (^6)      Mark text starting from the cursor position
M-6   (M-^)     Copy the current line and store it in the cutbuffer

M-]             Go to the matching bracket

M-W   (F16)     Repeat the last search
M-▲             Search next occurrence backward
M-▼             Search next occurrence forward

^B    (◀)       Go back one character
^F    (▶)       Go forward one character
^◀    (M-Space) Go back one word
^▶    (^Space)  Go forward one word
^A    (Home)    Go to beginning of current line
^E    (End)     Go to end of current line

^P    (▲)       Go to previous line
^N    (▼)       Go to next line
M--   (M-_)     Scroll up one line without scrolling the cursor
M-+   (M-=)     Scroll down one line without scrolling the cursor

^▲    (M-7)     Go to previous block of text
^▼    (M-8)     Go to next block of text
M-(   (M-9)     Go to beginning of paragraph; then of previous paragraph
M-)   (M-0)     Go just beyond end of paragraph; then of next paragraph

M-◀   (M-<)     Switch to the previous file buffer
M-▶   (M->)     Switch to the next file buffer

^I    (Tab)     Insert a tab at the cursor position
^M    (Enter)   Insert a newline at the cursor position

^D    (Del)     Delete the character under the cursor
^H    (Bsp)     Delete the character to the left of the cursor
                Cut backward from cursor to word start
                Cut forward from cursor to next word start
M-T             Cut from the cursor position to the end of the file

M-J             Justify the entire file
M-D             Count the number of words, lines, and characters
M-V             Insert the next keystroke verbatim

^L              Refresh (redraw) the current screen
^Z              Suspend the editor (if suspension is enabled)

M-}   (Tab)     Indent the current line (or marked lines)
M-{   (Sh-Tab)  Unindent the current line (or marked lines)

M-3             Comment/uncomment the current line (or marked lines)
^]              Try and complete the current word

M-:             Start/stop recording a macro
M-;             Run the last recorded macro

^Q              Search backward for a string or a regular expression

^S              Save file without prompting

M-X             Help mode enable/disable
M-C             Constant cursor position display enable/disable
M-O             Use of one more line for editing enable/disable
M-S             Smooth scrolling enable/disable
M-$             Soft wrapping of overlong lines enable/disable
M-#             Line numbering enable/disable
M-P             Whitespace display enable/disable
M-Y             Color syntax highlighting enable/disable

M-H             Smart home key enable/disable
M-I             Auto indent enable/disable
M-K             Cut to end enable/disable
M-L             Hard wrapping of overlong lines enable/disable
M-Q             Conversion of typed tabs to spaces enable/disable

M-B             Backup files enable/disable
M-F             Reading file into separate buffer enable/disable
M-M             Mouse support enable/disable
M-N             No conversion from DOS/Mac format enable/disable
M-Z             Suspension enable/disable

```