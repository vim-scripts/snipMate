if !exists('g:loaded_snips')
	fini
en

" Hash Pointer
exe 'Snip .  =>'
" Function
exe "Snip sub sub ${1:function_name} {\n\t${2:#body ...}\n}"
" Conditional
exe "Snip if if (${1}) {\n\t${2:# body...}\n}"
" Conditional if..else
exe "Snip ife if (${1}) {\n\t${2:# body...}\n} else {\n\t${3:# else...}\n}"
" Conditional if..elsif..else
exe "Snip ifee if (${1}) {\n\t${2:# body...}\n} elsif (${3}) {\n\t${4:# elsif...}\n} else {\n\t${5:# else...}\n}"
" Conditional One-line
exe 'Snip xif ${1:expression} if ${2:condition};${3}'
" Unless conditional
exe "Snip unless unless (${1}) {\n\t${2:# body...}\n}"
" Unless conditional One-line
exe 'Snip xunless ${1:expression} unless ${2:condition};${3}'
" Try/Except
exe "Snip eval eval {\n\t${1:# do something risky...}\n};\nif ($@) {\n\t${2:# handle failure...}\n}"
" While Loop
exe "Snip wh while (${1}) {\n\t${2:# body...}\n}"
" While Loop One-line
exe "Snip xwh ${1:expression} while ${2:condition};${3}"
" For Loop
exe "Snip for for (my $${2:var} = 0; $$2 < ${1:count}; $$2${3:++}) {\n\t${4:# body...}\n}"
" Foreach Loop
exe "Snip fore foreach my $${1:x} (@${2:array}) {\n\t${3:# body...}\n}"
" Foreach Loop One-line
exe 'Snip xfore ${1:expression} foreach @${2:array};${3}'
" Package
exe "Snip cl package ${1:ClassName};\n\nuse base qw(${2:ParentClass});\n\nsub new {\n\tmy $class = shift;\n\t$class = ref $class if ref $class;\n\tmy $self = bless {}, $class;\n\t$self;\n}\n\n1;${3}"
" Read File
exe "Snip slurp my $${1:var};\n{ local $/ = undef; local *FILE; open FILE, \"<${2:file}\"; $$1 = <FILE>; close FILE }${2}"
