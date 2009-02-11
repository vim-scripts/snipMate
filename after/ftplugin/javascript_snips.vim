if !exists('loaded_snips')
	fini
en

" Prototype
exe "Snip proto ${1:class_name}.prototype.${2:method_name} =\nfunction(${3:first_argument}) {\n\t${4:// body...}\n};"
" Function
exe "Snip fun function ${1:function_name} (${2:argument}) {\n\t${3:// body...}\n}"
" Anonymous Function
exe 'Snip f function(${1}) {${2}};'
" if
exe 'Snip if if (${1:true}) {${2}};'
" if ... else
exe "Snip ife if (${1:true}) {${2}}\nelse{${3}};"
" tertiary conditional
exe 'Snip t ${1:/* condition */} ? ${2:a} : ${3:b}'
" switch
exe "Snip switch switch(${1:expression}) {\n\tcase '${3:case}':\n\t\t${4:// code}\n\t\tbreak;\n\t${5}\n\tdefault:\n\t\t${2:// code}\n}"
" case
exe "Snip case case '${1:case}':\n\t${2:// code}\n\tbreak;\n${3}"
" for (...) {...}
exe "Snip for for (var ${2:i} = 0; $2 < ${1:Things}.length; $2${3:++}) {\n\t${4:$1[$2]}\n};"
" for (...) {...} (Improved Native For-Loop)
exe "Snip forr for (var ${2:i} = ${1:Things}.length - 1; $2 >= 0; $2${3:--}) {\n\t${4:$1[$2]}\n};"
" while (...) {...}
exe "Snip wh while (${1:/* condition */}) {\n\t${2:/* code */}\n}"
" do...while
exe "Snip do do {\n\t${2:/* code */}\n} while (${1:/* condition */});"
" Object Method
exe "Snip :f ${1:method_name}: function(${2:attribute}) {\n\t${4}\n}${3:,}"
" setTimeout function
exe 'Snip timeout setTimeout(function() {${3}}${2}, ${1:10};'
" Get Elements
exe "Snip get getElementsBy${1:TagName}('${2}')${3}"
" Get Element
exe "Snip gett getElementBy${1:Id}('${2}')${3}"
