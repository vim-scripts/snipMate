if !exists('g:loaded_snips')
	fini
en

" #import <...>
exe 'Snip imp #import <${1:Cocoa/Cocoa.h}>${2}'
" #import "..."
exe 'Snip Imp #import "${1:`Filename()`.h}"${2}'
" @selector(...)
exe 'Snip sel @selector(${1:method}:)${3}'
" NSLog(...)
exe 'Snip log NSLog(@"${1}"${2});${3}'
" Class
exe "Snip objc @interface ${1:`Filename('', 'object')`} : ${2:NSObject}\n{\n}\n@end\n\n@implementation $1\n- (id) init\n{\n\tif (self = [super init])"
\."\n\t{${3}\n\t}\n\treturn self\n}\n@end"
" Class Interface
exe "Snip cli @interface ${1:ClassName} : ${2:NSObject}\n{${3}\n}\n${4}\n@end"
" Category
exe "Snip cat @interface ${1:NSObject} (${2:Category})\n@end\n\n@implementation $1 ($2)\n${3}\n@end"
" Category Interface
exe "Snip cati @interface ${1:NSObject} (${2:Category})\n${3}\n@end"
" NSArray
exe 'Snip array NSMutableArray *${1:array} = [NSMutable array];${2}'
" NSDictionary
exe 'Snip dict NSMutableDictionary *${1:dict} = [NSMutableDictionary dictionary];${2}'
" NSBezierPath
exe 'Snip bez NSBezierPath *${1:path} = [NSBezierPath bezierPath];${2}'
" Class Method
exe "Snip M + (${1:id}) ${2:method}\n{${3}\n\treturn nil;\n}"
" Sub-method (Call super)
exe "Snip sm - (${1:id}) ${2:method}:(${3:id})${4:anArgument}\n{\n\t$1 res = [super $2:$4];${5}\n\treturn res;\n}"
" Method: Initialize
exe "Snip I + (void) initialize\n{\n\t[[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWIthObjectsAndKeys:\n\t\t${1}@\"value\", @\"key\",\n\t\tnil]];\n}"
" Accessor Methods For:
" Object
exe "Snip objacc - (${1:id})${2:thing}\n{\n\treturn $2;\n}\n\n- (void) set$2:($1)\n{\n\t$1 old$2 = $2;\n\t$2 = [aValue retain];\n\t[old$2 release];\n}"
exe "Snip forarray unsigned int\t${1:object}Count = [${2:array} count];\n\nfor (unsigned int index = 0; index < $1Count; index++)\n{\n\t${3:id}\t$1 = [$2 $1AtIndex:index];\n\t${4}\n}"
" [[ alloc] init]
exe 'Snip alloc [[${1:foo} alloc] init]${2};${3}'
