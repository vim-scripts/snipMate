if !exists('loaded_snips')
	fini
en

exe "Snip if if [[ ${1:condition} ]]; then\n\t${2:#statements}\nfi"
exe "Snip elif elif [[ ${1:condition} ]]; then\n\t${2:#statements}"
exe "Snip for for (( ${2:i} = 0; $2 < ${1:count}; $2++ )); do\n\t${3:#statements}\ndone"
exe "Snip wh while [[ ${1:condition} ]]; do\n\t${2:#statements}\ndone"
exe "Snip until [[ ${1:condition} ]]; do\n\t${2:#statements}\ndone"
exe "Snip case case ${1:word} in\n\t${2:pattern})\n\t\t${3};;\nesac"
