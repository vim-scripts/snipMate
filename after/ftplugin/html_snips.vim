if !exists('g:loaded_snips')
	fini
en
let c = &ft == 'xhtml' ? ' /' : ''

" Some useful Unicode entities
" Non-Breaking Space
exe 'Snip nbs &nbsp;'
" ←
exe 'Snip left &#x2190;'
" →
exe 'Snip right &#x2192;'
" ↑
exe 'Snip up &#x2191;'
" ↓
exe 'Snip down &#x2193;'
" ↩
exe 'Snip return &#x21A9;'
" ⇤
exe 'Snip backtab &#x21E4;'
" ⇥
exe 'Snip tab &#x21E5;'
" ⇧
exe 'Snip shift &#x21E7;'
" ⌃
exe 'Snip control &#x2303;'
" ⌅
exe 'Snip enter &#x2305;'
" ⌘
exe 'Snip command &#x2318;'
" ⌥
exe 'Snip option &#x2325;'
" ⌦
exe 'Snip delete &#x2326;'
" ⌫
exe 'Snip backspace &#x232B;'
" ⎋
exe 'Snip escape &#x238B;'
" Generic Doctype
exe 'Snip! doctype "HTML 4.01 Strict" <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\"\n\"http://www.w3.org/TR/html4/strict.dtd\">'
exe 'Snip! doctype "HTML 4.01 Transitional" <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\"\n\"http://www.w3.org/TR/html4/loose.dtd\">'
exe 'Snip! doctype "XHTML 1.0 Frameset" <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">'
exe 'Snip! doctype "XHTML 1.0 Strict" <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">'
exe 'Snip! doctype "XHTML 1.0 Transitional" <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">'
exe 'Snip! doctype "XHTML 1.1" <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\n\"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">'
" HTML Doctype 4.01 Strict
exe "Snip docts <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\"\n\"http://www.w3.org/TR/html4/strict.dtd\">"
" HTML Doctype 4.01 Transitional
exe "Snip doct <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\"\n\"http://www.w3.org/TR/html4/loose.dtd\">"
" XHTML Doctype 1.0 Frameset
exe "Snip docxf <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">"
" XHTML Doctype 1.0 Strict
exe "Snip docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">"
" XHTML Doctype 1.0 Transitional
exe "Snip docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"
" XHTML Doctype 1.1
exe "Snip docx <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\n\"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">"
exe "Snip xhtml <html xmlns=\"http://www.w3.org/1999/xhtml\">\n${1}\n</html>"
exe "Snip body <body>\n\t${1}\n</body>"
exe "Snip head <head>\n\t<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"".c.">\n\t"
\. "<title>${1:`substitute(Filename('', 'Page Title'), '^.', '\\u&', '')`}</title>\n\t${2}\n</head>"
exe 'Snip title <title>${1:`substitute(Filename("", "Page Title"), "^.", "\\u&", "")`}</title>${2}'
exe "Snip script <script type=\"text/javascript\" charset=\"utf-8\">\n\t${1}\n</script>${2}"
exe "Snip scriptsrc <script src=\"${1}.js\" type=\"text/javascript\" charset=\"utf-8\"></script>${2}"
exe "Snip style <style type=\"text/css\" media=\"${1:screen}\">\n\t${2}\n</style>${3}"
exe 'Snip base <base href="${1}" target="${2}"'.c.'>'
exe 'Snip r <br'.c[1:].'>'
exe "Snip div <div id=\"${1:name}\">\n\t${2}\n</div>"
" Embed QT Movie
exe "Snip movie <object width=\"$2\" height=\"$3\" classid=\"clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\""
\ ." codebase=\"http://www.apple.com/qtactivex/qtplugin.cab\">\n\t<param name=\"src\" value=\"$1\"".c.">\n\t<param name=\"controller\" value=\"$4\"".c
\ .">\n\t<param name=\"autoplay\" value=\"$5\"".c.">\n\t<embed src=\"${1:movie.mov}\"\n\t\twidth=\"${2:320}\" height=\"${3:240}\"\n\t\t"
\ ."controller=\"${4:true}\" autoplay=\"${5:true}\"\n\t\tscale=\"tofit\" cache=\"true\"\n\t\tpluginspage=\"http://www.apple.com/quicktime/download/\"\n\t".c[1:].">\n</object>${6}"
exe "Snip fieldset <fieldset id=\"$1\">\n\t<legend>${1:name}</legend>\n\n\t${3}\n</fieldset>"
exe "Snip form <form action=\"${1:`Filename('$1_submit')`}\" method=\"${2:get}\" accept-charset=\"utf-8\">\n\t${3}\n\n\t"
\."<p><input type=\"submit\" value=\"Continue &rarr;\"".c."></p>\n</form>"
exe 'Snip h1 <h1 id="${1:heading}">${2:$1}</h1>'
exe 'Snip input <input type="${1:text/submit/hidden/button}" name="${2:some_name}" value="${3}"'.c.'>${4}'
exe 'Snip label <label for="${2:$1}">${1:name}</label><input type="${3:text/submit/hidden/button}" name="${4:$2}" value="${5}" id="${6:$2}"'.c.'>${7}'
exe 'Snip link <link rel="${1:stylesheet}" href="${2:/css/master.css}" type="text/css" media="${3:screen}" charset="utf-8"'.c.'>${4}'
exe 'Snip mailto <a href="mailto:${1:joe@example.com}?subject=${2:feedback}">${3:email me}</a>'
exe 'Snip meta <meta name="${1:name}" content="${2:content}"'.c.'>${3}'
exe 'Snip opt <option value="${1:option}">${2:$1}</option>${3}'
exe 'Snip optt <option>${1:option}</option>${2}'
exe "Snip select <select name=\"${1:some_name}\" id=\"${2:$1}\">\n\t<option value=\"${3:option}\">${4:$3}</option>\n</select>${5}"
exe "Snip table <table border=\"${1:0}\">\n\t<tr><th>${2:Header}</th></tr>\n\t<tr><th>${3:Data}</th></tr>\n</table>${4}"
exe 'Snip textarea <textarea name="${1:Name}" rows="${2:8}" cols="${3:40}">${4}</textarea>${5}'
