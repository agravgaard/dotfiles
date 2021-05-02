" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
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

"------------------------------------------------------------
set nowrap
set noswapfile

" Allow project specific .vimrc files
set exrc
set secure

"------------------------------------------------------------
" Must have options {{{1
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

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


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
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

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

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------
" Vundle and plugins

set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Code completion and navigation:
Plugin 'Valloric/YouCompleteMe'
" Directory tree:
Plugin 'scrooloose/nerdtree'
" Git status next to files in nerdtree:
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Compatibility plugin for nerdtree with vim tabs:
Plugin 'jistr/vim-nerdtree-tabs'
" Other language tools, useful for latex in particular:
Plugin 'vim-syntastic/syntastic'
Plugin 'rhysd/vim-grammarous'
" +/-/~ on the left of line-number:
Plugin 'airblade/vim-gitgutter'
" Show trailing whitespace + :StripWhitespace
Plugin 'ntpeters/vim-better-whitespace'
" C++ tagbar for easier overview:
Plugin 'preservim/tagbar'
" Aligning, useful for quick formatting, e.g. of latex equations:
Plugin 'junegunn/vim-easy-align'
" Display function names, loop, if condition etc. at top
Plugin 'wellle/context.vim'
" For C++ in-code documentation:
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Better CMake syntax highlighting
Plugin 'pboettch/vim-cmake-syntax'
" Code formatting for most languages
Plugin 'sbdchd/neoformat'
" Better OpenCL syntax highlighting (may clash with OCaml in vim defaults)
Plugin 'vim-scripts/opencl.vim'
" Better Ruby-on-Rails syntax highlighting
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
" Code-completion for a variety of languages as well as paths/files
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" Make vim look absolutely amazing:
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'TroyFletcher/vim-colors-synthwave'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDtree related config
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinSize=28

" Syntax highlighting
syntax on
try
    colorscheme synthwave
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
    " colorscheme some_default
endtry

let g:airline_theme = 'kolor'
let g:airline_powerline_fonts = 1

nmap <F8> :TagbarToggle<CR>

let g:deoplete#enable_at_startup = 1

" Doxygen settings
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_templateParamTag_pre="\\tparam "
let g:DoxygenToolkit_returnTag_pre="\\returns "

let g:tex_flavor = "latex"
autocmd FileType tex setlocal spell spelllang=en_gb | setlocal textwidth=70

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers = ['lacheck']

let g:grammarous#languagetool_cmd = '/home/andreasga/Scripts/detex-languagetool'

" Mappings                                               | Description                                          |
" ------------------------------------------------------ |:---------------------------------------------------- |
nmap <leader>mi <Plug>(grammarous-move-to-info-window)    " Move the cursor to the info window                   |
nmap <leader>oi <Plug>(grammarous-open-info-window)       " Open the info window for the error under the cursor  |
nmap <leader>R  <Plug>(grammarous-reset)                  " Reset the current check                              |
nmap <leader>fi <Plug>(grammarous-fixit)                  " Fix the error under the cursor automatically         |
nmap <leader>fa <Plug>(grammarous-fixall)                 " Fix all the errors in a current buffer automatically |
nmap <leader>ci <Plug>(grammarous-close-info-window)      " Close the information window from checked buffer     |
nmap <leader>re <Plug>(grammarous-remove-error)           " Remove the error under the cursor                    |
nmap <leader>dr <Plug>(grammarous-disable-rule)           " Disable the grammar rule under the cursor            |
nmap <leader>ne <Plug>(grammarous-move-to-next-error)     " Move cursor to the next error                        |
nmap <leader>pe <Plug>(grammarous-move-to-previous-error) " Move cursor to the previous error                    |

" :Neoformat on write + put changes into undo
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" A command to go through files given to vim.
" Eg. conflicted git files: `vim $(git ls-files -u | awk '{print $4}' | sort -u)
function! s:ThankYouNext() abort
  update
  argdelete %
  bdelete
  if !empty(argv())
    argument
  endif
endfunction

command! ThankYouNext call <sid>ThankYouNext()
