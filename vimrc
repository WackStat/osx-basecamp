"                         __          
" __  _  _______    ____ |  | ______  
" \ \/ \/ /\__  \ _/ ___\|  |/ /  _ \ 
"  \     /  / __ \\  \___|    <  <_> )
"   \/\_/  (____  /\___  >__|_ \____/ 
"               \/     \/     \/      
"  VIM Ressource File / OSX 
 
"------------------------------------------------------------
" General
"
" These are general config options.

" Set the default file encoding
set encoding=utf-8
set fileencoding=utf-8

" Shell settings when using :cmdline
set termencoding=utf-8
set history=1000

"------------------------------------------------------------
" Features 
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
 
"------------------------------------------------------------
" Must have options 
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class,*.Rdata,*DS_Store*
 
" Show partial commands in the last line of the screen and shoe the mode
set showcmd
set showmode
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below) and highlight as you type
set hlsearch
set incsearch
set smartcase 	" Instead of ignorecase

" Avoid the spreading of third party backup or swap files
set noswapfile
set nobackup
set nowb
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set smartindent
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Disable wrapping of text
" set nowrap
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height, might be useful to set to 2 lines, to avoid 
" many cases of having to "press <Enter> to continue"
set cmdheight=1
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Match parenthesis and jump to them when entering
set showmatch
set matchtime=2  

" Add some magic into regular expression"
set magic
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
  
"------------------------------------------------------------
" Vundle {{{1
"
" Plug-in manager for VIM. Brief help blow
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" check :h vundle for more details or wiki for FAQ

filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, 
Plugin 'VundleVim/Vundle.vim' " required

" Load the plug-ins

" Pimped out bar at the bottom of current buffer
Bundle 'bling/vim-airline.git'

" Awesome syntax highlighting and checking
Bundle 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee >/dev/null %
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
"------------------------------------------------------------