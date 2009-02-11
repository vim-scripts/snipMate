if !exists('loaded_snips')
	fini
en

exe "Snip php <?php\n${1}\n?>"
exe 'Snip ec echo "${1:string}"${2};'
exe "Snip inc include '${1:file}';${2}"
exe "Snip inc1 include_once '${1:file}';${2}"
exe "Snip req require '${1:file}';${2}"
exe "Snip req1 require_once '${1:file}';${2}"
" $GLOBALS['...']
exe "Snip globals $GLOBALS['${1:variable}']${2: = }${3:something}${4:;}${5}"
exe "Snip! $_ \"COOKIE['...']\" $_COOKIE['${1:variable}']${2}"
exe "Snip! $_ \"ENV['...']\" $_ENV['${1:variable}']${2}"
exe "Snip! $_ \"FILES['...']\" $_FILES['${1:variable}']${2}"
exe "Snip! $_ \"Get['...']\" $_GET['${1:variable}']${2}"
exe "Snip! $_ \"POST['...']\" $_POST['${1:variable}']${2}"
exe "Snip! $_ \"REQUEST['...']\" $_REQUEST['${1:variable}']${2}"
exe "Snip! $_ \"SERVER['...']\" $_SERVER['${1:variable}']${2}"
exe "Snip! $_ \"SESSION['...']\" $_SESSION['${1:variable}']${2}"
" Start Docblock
exe "Snip /* /**\n * ${1}\n **/"
" Class - post doc
exe "Snip doc_cp /**\n * ${1:undocumented class}\n *\n * @package ${2:default}\n * @author ${3:`g:snips_author`}\n**/${4}"
" Class Variable - post doc
exe "Snip doc_vp /**\n * ${1:undocumented class variable}\n *\n * @var ${2:string}\n **/${3}"
" Class Variable
exe "Snip doc_v /**\n * ${3:undocumented class variable}\n *\n * @var ${4:string}\n **/\n${1:var} $${2};${5}"
" Class
exe "Snip doc_c /**\n * ${3:undocumented class}\n *\n * @packaged ${4:default}\n * @author ${5:`g:snips_author`}\n **/\n${1:}class ${2:}\n{${6}\n} // END $1class $2"
" Constant Definition - post doc
exe "Snip doc_dp /**\n * ${1:undocumented constant}\n **/${2}"
" Constant Definition
exe "Snip doc_d /**\n * ${3:undocumented constant}\n **/\ndefine(${1}, ${2});${4}"
" Function - post doc
exe "Snip doc_fp /**\n * ${1:undocumented function}\n *\n * @return ${2:void}\n * @author ${3:`g:snips_author`}\n **/${4}"
" Function signature
exe "Snip doc_s /**\n * ${4:undocumented function}\n *\n * @return ${5:void}\n * @author ${6:`g:snips_author`}\n **/\n${1}function ${2}(${3});${7}"
" Function
exe "Snip doc_f /**\n * ${4:undocumented function}\n *\n * @return ${5:void}\n * @author ${6:`g:snips_author`}\n **/\n${1}function ${2}(${3})\n{${7}\n}"
" Header
exe "Snip doc_h /**\n * ${1}\n *\n * @author ${2:`g:snips_author`}\n * @version ${3:$Id$}\n * @copyright ${4:$2}, `strftime('%d %B, %Y')`\n * @package ${5:default}\n **/\n\n/**\n * Define DocBlock\n *//"
" Interface
exe "Snip doc_i /**\n * ${2:undocumented class}\n *\n * @package ${3:default}\n * @author ${4:`g:snips_author`}\n **/\ninterface ${1:}\n{${5}\n} // END interface $1"
" class ...
exe "Snip class /**\n * ${1}\n **/\nclass ${2:ClassName}\n{\n\t${3}\n\tfunction ${4:__construct}(${5:argument})\n\t{\n\t\t${6:// code...}\n\t}\n}"
" define(...)
exe "Snip def define('${1}'${2});${3}"
" defined(...)
exe "Snip def? ${1}defined('${2}')${3}"
exe "Snip wh while (${1:/* condition */}) {\n\t${2:// code...}\n}"
" do ... while
exe "Snip do do {\n\t${2:// code... }\n} while (${1:/* condition */});"
exe "Snip if if (${1:/* condition */}) {\n\t${2:// code...}\n}"
exe "Snip ife if (${1:/* condition */}) {\n\t${2:// code...}\n} else {\n\t${3:// code...}\n}\n${4}"
exe "Snip else else {\n\t${1:// code...}\n}"
exe "Snip elseif elseif (${1:/* condition */}) {\n\t${2:// code...}\n}"
" Tertiary conditional
exe "Snip t $${1:retVal} = (${2:condition}) ? ${3:a} : ${4:b};${5}"
exe "Snip switch switch ($${1:variable}) {\n\tcase '${2:value}':\n\t\t${3:// code...}\n\t\tbreak;\n\t${5}\n\tdefault:\n\t\t${4:// code...}\n\t\tbreak;\n}"
exe "Snip case case '${1:value}':\n\t${2:// code...}\n\tbreak;${3}"
exe "Snip for for ($${2:i} = 0; $$2 < ${1:count}; $$2${3:++}) {\n\t${4: // code...}\n}"
exe "Snip foreach foreach ($${1:variable} as $${2:key}) {\n\t${3:// code...}\n}"
exe "Snip fun ${1:public }function ${2:FunctionName}(${3})\n{\n\t${4:// code...}\n}"
" $... = array (...)
exe "Snip array $${1:arrayName} = array('${2}' => ${3});${4}"
