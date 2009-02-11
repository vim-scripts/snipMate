if !exists('loaded_snips')
	fini
en

" New Block
exe "Snip =b =begin rdoc\n\t${1}\n=end"
exe "Snip y :yields: ${1:arguments}"
exe "Snip rb #!/usr/bin/env ruby -wKU\n"
exe 'Snip req require "${1}"${2}'
exe 'Snip # # =>'
exe 'Snip end __END__'
exe "Snip case case ${1:object}\nwhen ${2:condition}\n\t${3}\nend"
exe "Snip when when ${1:condition}\n\t${2}"
exe "Snip def ${1:method_name}\n\t${2}\nend"
exe "Snip deft def test_${1:case_name}\n\t${2}\nend"
exe "Snip if if ${1:condition}\n\t${2}\nend"
exe "Snip ife if ${1:condition}\n\t${2}\nelse\n\t${3}\nend"
exe "Snip elsif elsif ${1:condition}\n\t${2}"
exe "Snip unless unless ${1:condition}\n\t${2}\nend"
exe "Snip while while ${1:condition}\n\t${2}\nend"
exe "Snip until until ${1:condition}\n\t${2}\nend"
exe "Snip! cla \"class .. end\" class ${1:`substitute(Filename(), '^.', '\\u&', '')`}\n\t${2}\nend"
exe "Snip! cla \"class .. initialize .. end\" class ${1:`substitute(Filename(), '^.', '\\u&', '')`}\n\tdef initialize(${2:args})\n\t\t${3}\n\tend\n\n\nend"
exe "Snip! cla \"class .. < ParentClass .. initialize .. end\" class ${1:`substitute(Filename(), '^.', '\\u&', '')`} < ${2:ParentClass}\n\tdef initialize(${3:args})\n\t\t${4}\n\tend\n\n\nend"
exe "Snip! cla \"ClassName = Struct .. do .. end\" ${1:`substitute(Filename(), '^.', '\\u&', '')`} = Struct.new(:${2:attr_names}) do\n\tdef ${3:method_name}\n\t\t${4}\n\tend\n\n\nend"
exe "Snip! cla \"class BlankSlate .. initialize .. end\" class ${1:BlankSlate}\n\tinstance_methods.each { |meth| undef_method(meth) unless meth =~ /\A__/ }"
\ ."\n\n\tdef initialize(${2:args})\n\t\t@${3:delegate} = ${4:$3_object}\n\n\t\t${5}\n\tend\n\n\tdef method_missing(meth, *args, &block)\n\t\t@$3.send(meth, *args, &block)\n\tend\n\n\nend"
exe "Snip! cla \"class << self .. end\" class << ${1:self}\n\t${2}\nend"
" class .. < DelegateClass .. initialize .. end
exe "Snip cla- class ${1:`substitute(Filename(), '^.', '\\u&', '')`} < DelegateClass(${2:ParentClass})\n\tdef initialize(${3:args})\n\t\tsuper(${4:del_obj})\n\n\t\t${5}\n\tend\n\n\nend"
exe "Snip! mod \"module .. end\" module ${1:`substitute(Filename(), '^.', '\\u&', '')`}\n\t${2}\nend"
exe "Snip! mod \"module .. module_function .. end\" module ${1:`substitute(Filename(), '^.', '\\u&', '')`}\n\tmodule_function\n\n\t${2}\nend"
exe "Snip! mod \"module .. ClassMethods .. end\" module ${1:`substitute(Filename(), '^.', '\\u&', '')`}\n\tmodule ClassMethods\n\t\t${2}\n\tend\n\n\t"
\."module InstanceMethods\n\n\tend\n\n\tdef self.included(receiver)\n\t\treceiver.extend         ClassMethods\n\t\treseiver.send :include, InstanceMethods\n\tend\nend"
" attr_reader
exe 'Snip r attr_reader :${1:attr_names}'
" attr_writer
exe 'Snip w attr_writer :${1:attr_names}'
" attr_accessor
exe 'Snip rw attr_accessor :${1:attr_names}'
" include Enumerable
exe "Snip Enum include Enumerable\n\ndef each(&block)\n\t${1}\nend"
" include Comparable
exe "Snip Comp include Comparable\n\ndef <=>(other)\n\t${1}\nend"
" extend Forwardable
exe 'Snip Forw- extend Forwardable'
" def self
exe "Snip defs def self.${1:class_method_name}\n\t${2}\nend"
" def method_missing
exe "Snip defmm def method_missing(meth, *args, &blk)\n\t${1}\nend"
exe 'Snip defd def_delegator :${1:@del_obj}, :${2:del_meth}, :${3:new_name}'
exe 'Snip defds def_delegators :${1:@del_obj}, :${2:del_methods}'
exe 'Snip am alias_method :${1:new_name}, :${2:old_name}'
exe "Snip app if __FILE__ == $PROGRAM_NAME\n\t${1}\nend"
" usage_if()
exe "Snip usai if ARGV.${1}\n\tabort \"Usage: #{$PROGRAM_NAME} ${2:ARGS_GO_HERE}\"${3}\nend"
" usage_unless()
exe "Snip usau unless ARGV.${1}\n\tabort \"Usage: #{$PROGRAM_NAME} ${2:ARGS_GO_HERE}\"${3}\nend"
exe 'Snip array Array.new(${1:10}) { |${2:i}| ${3} }'
exe 'Snip hash Hash.new { |${1:hash}, ${2:key}| $1[$2] = ${3} }'
exe 'Snip! file "File.foreach() { |line| .. }" File.foreach(${1:"path/to/file"}) { |${2:line}| ${3} }'
exe 'Snip! file "File.read()" File.read(${1:"path/to/file"})${2}'
exe 'Snip! Dir "Dir.global() { |file| .. }" Dir.glob(${1:"dir/glob/*"}) { |${2:file}| ${3} }'
exe 'Snip! Dir "Dir[''..'']" Dir[${1:"glob/**/*.rb"}]${2}'
exe 'Snip dir Filename.dirname(__FILE__)'
exe 'Snip deli delete_if { |${1:e}| ${2} }'
exe 'Snip fil fill(${1:range}) { |${2:i}| ${3} }'
" flatten_once()
exe 'Snip flao inject(Array.new) { |${1:arr}, ${2:a}| $1.push(*$2)}${3}'
exe 'Snip zip zip(${1:enums}) { |${2:row}| ${3} }'
" downto(0) { |n| .. }
exe 'Snip dow downto(${1:0}) { |${2:n}| ${3} }'
exe 'Snip ste step(${1:2}) { |${2:n}| ${3} }'
exe 'Snip tim times { |${1:n}| ${2} }'
exe 'Snip upt upto(${1:1.0/0.0}) { |${2:n}| ${3} }'
exe 'Snip loo loop { ${1} }'
exe 'Snip ea each { |${1:e}| ${2} }'
exe 'Snip eab each_byte { |${1:byte}| ${2} }'
exe 'Snip! eac- "each_char { |chr| .. }" each_char { |${1:chr}| ${2} }'
exe 'Snip! eac- "each_cons(..) { |group| .. }" each_cons(${1:2}) { |${2:group}| ${3} }'
exe 'Snip eai each_index { |${1:i}| ${2} }'
exe 'Snip eak each_key { |${1:key}| ${2} }'
exe 'Snip eal each_line { |${1:line}| ${2} }'
exe 'Snip eap each_pair { |${1:name}, ${2:val}| ${3} }'
exe 'Snip eas- each_slice(${1:2}) { |${2:group}| ${3} }'
exe 'Snip eav each_value { |${1:val}| ${2} }'
exe 'Snip eawi each_with_index { |${1:e}, ${2:i}| ${3} }'
exe 'Snip reve reverse_each { |${1:e}| ${2} }'
exe 'Snip inj inject(${1:init}) { |${2:mem}, ${3:var}| ${4} }'
exe 'Snip map map { |${1:e}| ${2} }'
exe 'Snip mapwi- enum_with_index.map { |${1:e}, ${2:i}| ${3} }'
exe 'Snip sor sort { |a, b| ${1} }'
exe 'Snip sorb sort_by { |${1:e}| ${2} }'
exe 'Snip ran sort_by { rand }'
exe 'Snip all all? { |${1:e}| ${2} }'
exe 'Snip any any? { |${1:e}| ${2} }'
exe 'Snip cl classify { |${1:e}| ${2} }'
exe 'Snip col collect { |${1:e}| ${2} }'
exe 'Snip det detect { |${1:e}| ${2} }'
exe 'Snip fet fetch(${1:name}) { |${2:key}| ${3} }'
exe 'Snip fin find { |${1:e}| ${2} }'
exe 'Snip fina find_all { |${1:e}| ${2} }'
exe 'Snip gre grep(${1:/pattern/}) { |${2:match}| ${3} }'
exe 'Snip sub ${1:g}sub(${2:/pattern/}) { |${3:match}| ${4} }'
exe 'Snip sca scan(${1:/pattern/}) { |${2:match}| ${3} }'
exe 'Snip max max { |a, b|, ${1} }'
exe 'Snip min min { |a, b|, ${1} }'
exe 'Snip par partition { |${1:e}|, ${2} }'
exe 'Snip rej reject { |${1:e}|, ${2} }'
exe 'Snip sel select { |${1:e}|, ${2} }'
exe 'Snip lam lambda { |${1:args}| ${2} }'
exe "Snip do do |${1:variable}|\n\t${2}\nend"
exe 'Snip : :${1:key} => ${2:"value"}${3}'
exe 'Snip ope open(${1:"path/or/url/or/pipe"}, "${2:w}") { |${3:io}| ${4} }'
" path_from_here()
exe 'Snip patfh File.join(File.dirname(__FILE__), *%2[${1:rel path here}])${2}'
" unix_filter {}
exe "Snip unif ARGF.each_line${1} do |${2:line}|\n\t${3}\nend"
" option_parse {}
exe "Snip optp require \"optparse\"\n\noptions = {${1:default => \"args\"}}\n\nARGV.options do |opts|\n\topts.banner = \"Usage: #{File.basename($PROGRAM_NAME)}"
\."[OPTIONS] ${2:OTHER_ARGS}\"\n\n\topts.separator \"\"\n\topts.separator \"Specific Options:\"\n\n\t${3}\n\n\topts.separator \"Common Options:\"\n\n\t"
\."opts.on( \"-h\", \"--help\",\n           \"Show this message.\" ) do\n\t\tputs opts\n\t\texit\n\tend\n\n\tbegin\n\t\topts.parse!\n\trescue\n\t\tputs opts\n\t\texit\n\tend\nend"
exe "Snip opt opts.on( \"-${1:o}\", \"--${2:long-option-name}\", ${3:String},\n         \"${4:Option description.}\") do |${5:opt}|\n\t${6}\nend"
exe "Snip tc require \"test/unit\"\n\nrequire \"${1:library_file_name}\"\n\nclass Test${2:$1} < Test::Unit::TestCase\n\tdef test_${3:case_name}\n\t\t${4}\n\tend\nend"
exe "Snip ts require \"test/unit\"\n\nrequire \"tc_${1:test_case_file}\"\nrequire \"tc_${2:test_case_file}\"${3}"
exe 'Snip as assert(${1:test}, \"${2:Failure message.}\")${3}'
exe 'Snip ase assert_equal(${1:expected}, ${2:actual})${3}'
exe 'Snip asne assert_not_equal(${1:unexpected}, ${2:actual})${3}'
exe 'Snip asid assert_in_delta(${1:expected_float}, ${2:actual_float}, ${3:2 ** -20})${4}'
exe 'Snip asio assert_instance_of(${1:ExpectedClass}, ${2:actual_instance})${3}'
exe 'Snip asko assert_kind_of(${1:ExpectedKind}, ${2:actual_instance})${3}'
exe 'Snip asn assert_nil(${1:instance})${2}'
exe 'Snip asnn assert_not_nil(${1:instance})${2}'
exe 'Snip asm assert_match(/${1:expected_pattern}/, ${2:actual_string})${3}'
exe 'Snip asnm assert_no_match(/${1:unexpected_pattern}/, ${2:actual_string})${3}'
exe 'Snip aso assert_operator(${1:left}, :${2:operator}, ${3:right})${4}'
exe 'Snip asr assert_raise(${1:Exception}) { ${2} }'
exe 'Snip asnr assert_nothing_raised(${1:Exception}) { ${2} }'
exe 'Snip asrt assert_respond_to(${1:object}, :${2:method})${3}'
exe 'Snip! ass "assert_same(..)" assert_same(${1:expected}, ${2:actual})${3}'
exe 'Snip! ass "assert_send(..)" assert_send([${1:object}, :${2:message}, ${3:args}])${4}'
exe 'Snip asns assert_not_same(${1:unexpected}, ${2:actual})${3}'
exe 'Snip ast assert_throws(:${1:expected}) { ${2} }'
exe 'Snip asnt assert_nothing_thrown { ${1} }'
exe 'Snip fl flunk("${1:Failure message.}")${2}'
" Benchmark.bmbm do .. end
exe "Snip bm- TESTS = ${1:10_000}\nBenchmark.bmbm do |results|\n\t${2}\nend"
exe 'Snip rep results.report("${1:name}:") { TESTS.times { ${2} }}'
" Marshal.dump(.., file)
exe 'Snip Md File.open(${1:"path/to/file.dump"}, "wb") { |${2:file}| Marshal.dump(${3:obj}, $2) }${4}'
" Mashal.load(obj)
exe 'Snip Ml File.open(${1:"path/to/file.dump"}, "rb") { |${2:file}| Marshal.load($2) }${3}'
" deep_copy(..)
exe 'Snip deec Marshal.load(Marshal.dump(${1:obj_to_copy}))${2}'
exe 'Snip Pn- PStore.new(${1:"file_name.pstore"})${2}'
exe 'Snip tra transaction(${1:true}) { ${2} }'
" xmlread(..)
exe 'Snip xml- REXML::Document.new(File.read(${1:"path/to/file"}))${2}'
" xpath(..) { .. }
exe "Snip xpa elements.each(${1:\"//Xpath\"}) do |${2:node}|\n\t${3}\nend"
" class_from_name()
exe 'Snip clafn split("::").inject(Object) { |par, const| par.const_get(const) }'
" singleton_class()
exe 'Snip sinc class << self; self end'
exe "Snip nam namespace :${1:`Filename()`} do\n\t${2}\nend"
exe "Snip tas desc \"${1:Task description\}\"\ntask :${2:task_name => [:dependent, :tasks]} do\n\t${3}\nend"
