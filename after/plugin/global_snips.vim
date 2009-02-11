if !exists('g:loaded_snips')
	fini
en

" (c) holds no legal value ;)
exe 'GlobalSnip c) '.(&enc[:2] == 'utf' ? '©' : '(c)').' Copyright `strftime("%Y")` ${1:`g:snips_author`}. All Rights Reserved.${2}'
exe 'GlobalSnip date `strftime("%Y-%m-%d")`'
