function! s:setProjections()
  let l:dict = {
\    "lib/*.ex": {
\      "type":      "src",
\      "alternate": "test/{}_test.exs"
\    },
\    "test/*_test.exs": {
\      "type":      "test",
\      "alternate": "lib/{}.ex"
\    }
\  }
  call projectionist#append(getcwd(), l:dict)
endfunction

augroup elixir
  autocmd!
  autocmd User ProjectionistDetect :call s:setProjections()
augroup end


map <leader><space> :w<CR>:VimuxRunCommand("clear; mix compile")<CR>
map <leader>r :w<CR>:VimuxRunCommand("clear; iex -S mix")<CR>

let g:mix_format_on_save = 1
