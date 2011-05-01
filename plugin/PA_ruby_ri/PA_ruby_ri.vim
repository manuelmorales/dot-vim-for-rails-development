" Vim plugin for rapid getting RUBY `RI` documentation while working with your ruby code
" Last Change:	2009 July 06
" Maintainer:	Pukalskyy Andrij <andrijpu@gmail.com>

" ensure that plugin is loaded just one time
if exists("g:PA_ruby_ri_version")
    finish
endif
let g:PA_ruby_ri_version = "0.0.1"

" check for Vim version 700 or greater
if v:version < 700
  echo "PA_ruby_ri".g:PA_translator_version." has been tested only on Vim 7.0 and greater."
endif

" save previous `cpo` value. it is necessary for `compatible` mode
let s:save_cpo = &cpo
set cpo&vim

" constants
let s:more_than_one_matching = "More than one"

function! PA_ri(ruby_entity)
    let s:ri_result = system('ri ' . a:ruby_entity)

    if match(s:ri_result, s:more_than_one_matching) != -1
        let s:header_and_result = split(s:ri_result, '\n\n')
        let s:result_as_list = split(substitute(substitute(s:header_and_result[1], '\n', '', 'g'), ' ', '', 'g'), ',')

        echo s:header_and_result[0]
        echo '---------------------------------------------------------'

        let s:index = 0
        for item in s:result_as_list
            echo '' . s:index . '  -  ' . item
            let s:index += 1
        endfor

        echo '---------------------------------------------------------'
        let s:user_selection = input('Please, specify your choise, by number? ')

        :redraw
        :call PA_ri(s:result_as_list[str2nr(s:user_selection)])
    else
        echo s:ri_result
    endif
endfunction


let mapleader = ","
if !hasmapto("<Esc>:call<Space>PA_ri(expand('<cword>'))<CR>")
    nnoremap <silent> <unique> <Leader>ri <Esc>:call<Space>PA_ri(expand('<cword>'))<CR>|                " it gets `ri` for undercursor word in NORMAL mode
endif
if !hasmapto("Y<Esc>:call<Space>PA_ri(substitute(@0, '\n', '', 'g'))<CR>")
    vnoremap <silent> <unique> <Leader>ri Y<Esc>:call<Space>PA_ri(substitute(@0, '\n', '', 'g'))<CR>|   " it gets `ri` for selected words in VISUAL mode
endif

" restore `cpo` value for other modules
let &cpo = s:save_cpo
