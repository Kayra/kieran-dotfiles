
function! AddTranslation()
  let l:newtranslation = input('Enter translation string: ')
  let l:pathto = "~/git/hwr-public-apis/hwr_public_apis/i18n/"
  for lang in ['ja', 'en', 'ko']
    silent exe "!jq '." . l:newtranslation . " = \"TODO\"' " . l:pathto . 'api-' . lang . '.json > /tmp/api-' . lang . '.json && mv /tmp/api-' . lang . '.json ' . l:pathto . 'api-' . lang . '.json'
  endfor
  exe "normal! a" . l:newtranslation . "\<Esc>"
endfunction

nnoremap <A-a> :call AddTranslation()<CR>
nnoremap <A-b> :Dispatch git diff \| grep '{{' \| sed -n -e "s/.*{{\(.*\)}}.*/\1/p" \| sort \| uniq<CR>
