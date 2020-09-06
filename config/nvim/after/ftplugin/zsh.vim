setlocal ts=2 sw=2 et sts=2 ai si

" 1: Create a map, ask for confirmation
nmap <leader>s  :s:\(\s\{1,}\)\(-\+\): \\\r  \2:g<CR>  | noh | retab
nmap <leader>sq :s:\(\s\{1,}\)\(-\+\): \\\r  \2:cg<CR> | noh | retab

" 2: Create a User Command
command! -nargs=0 Split  s:\(\s\{1,}\)\(-\+\): \\\r\t\t\2:g  | noh | retab
command! -nargs=0 Splitq s:\(\s\{1,}\)\(-\+\): \\\r\t\t\2:cg | noh | retab

" 3: VimScript - hurt yourself
" Fails with: ls -l -a
" EXPECT:
" ls\
"   -l\
"   -a
"
" GOT    : ls\
 -l\
 -a

command! -nargs=0 Test call SplitCommandLine()

func! SplitCommandLine()
  let pat    = '\(\s\{1,}\)\(-\+\)'
  let sub    = '\\\r \2'
  let flags  = 'g'
  let line   = getline('.')
  call setline('.', substitute(line, pat, sub, flags))
endf


