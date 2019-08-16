" Vim syntax file
" Language:	SystemVerilog
" Maintainer:	Richard Herveille <richard.herveille@roalogic.com>
" Last Update:  Wed Jun 28 2017

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" A bunch of useful Verilog keywords

syn keyword verilogStatement   always always_comb always_ff and assert assign automatic
syn keyword verilogStatement   bit buf bufif0 bufif1 byte
syn keyword verilogStatement   cell class clocking cmos config const
syn keyword verilogStatement   deassign defparam design disable do
syn keyword verilogStatement   edge endclass endconfig endclocking endfunction endgenerate endinterface
syn keyword verilogStatement   endmodule endpackage endprimitive endprogram endspecify endtable
syn keyword verilogStatement   endtask enum event extends extern
syn keyword verilogStatement   force foreach function
syn keyword verilogStatement   generate genvar
syn keyword verilogStatement   highz0 highz1
syn keyword verilogStatement   ifnone import incdir include initial inout input interface
syn keyword verilogStatement   instance int integer
syn keyword verilogStatement   large liblist library localparam logic
syn keyword verilogStatement   macromodule medium module modport
syn keyword verilogStatement   nand negedge new nmos nor
syn keyword verilogStatement   noshowcancelled not notif0 notif1
syn keyword verilogStatement   or output
syn keyword verilogStatement   package packed parameter pmos posedge primitive
syn keyword verilogStatement   priority program
syn keyword verilogStatement   pull0 pull1 pulldown pullup
syn keyword verilogStatement   pulsestyle_onevent pulsestyle_ondetect
syn keyword verilogStatement   pure
syn keyword verilogStatement   rcmos real realtime ref reg release return
syn keyword verilogStatement   rnmos rpmos rtran rtranif0 rtranif1
syn keyword verilogStatement   scalared showcancelled signed small specify
syn keyword verilogStatement   specparam strong0 strong1 supply0 supply1
syn keyword verilogStatement   string struct super
syn keyword verilogStatement   table task this time timeunit timeprecision
syn keyword verilogStatement   tran tanif0 tranif1
syn keyword verilogStatement   tri tri0 tri1 triand trior trireg type typedef
syn keyword verilogStatement   union unique unsigned use
syn keyword verilogStatement   vectored virtual void 
syn keyword verilogStatement   wait wand weak0 weak1 wire wor
syn keyword verilogStatement   xnor xor
syn keyword verilogLabel       begin end fork join join_all join_any join_none
syn keyword verilogConditional if else case casex casez default endcase
syn keyword verilogRepeat      forever repeat while for

syn keyword verilogTodo contained TODO

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,@Spell
syn match   verilogComment "//.*" contains=verilogTodo,@Spell

"syn match   verilogGlobal "`[a-zA-Z0-9_]\+\>"
syn match   verilogGlobal "`celldefine"
syn match   verilogGlobal "`default_nettype"
syn match   verilogGlobal "`define"
syn match   verilogGlobal "`else"
syn match   verilogGlobal "`elsif"
syn match   verilogGlobal "`endcelldefine"
syn match   verilogGlobal "`endif"
syn match   verilogGlobal "`ifdef"
syn match   verilogGlobal "`ifndef"
syn match   verilogGlobal "`include"
syn match   verilogGlobal "`line"
syn match   verilogGlobal "`nounconnected_drive"
syn match   verilogGlobal "`resetall"
syn match   verilogGlobal "`timescale"
syn match   verilogGlobal "`unconnected_drive"
syn match   verilogGlobal "`undef"
syn match   verilogGlobal "$[a-zA-Z0-9_]\+\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[sS]\?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  verilogString start=+"+ skip=+\\"+ end=+"+ contains=verilogEscape,@Spell
syn match   verilogEscape +\\[nt"\\]+ contained
syn match   verilogEscape "\\\o\o\=\o\=" contained

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_verilog_syn_inits")
   if version < 508
      let did_verilog_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink verilogCharacter       Character
   HiLink verilogConditional     Conditional
   HiLink verilogRepeat		 Repeat
   HiLink verilogString		 String
   HiLink verilogTodo		 Todo
   HiLink verilogComment	 Comment
   HiLink verilogConstant	 Constant
   HiLink verilogLabel		 Label
   HiLink verilogNumber		 Number
   HiLink verilogOperator	 Special
   HiLink verilogStatement	 Statement
   HiLink verilogGlobal		 Define
   HiLink verilogDirective	 SpecialComment
   HiLink verilogEscape		 Special

   delcommand HiLink
endif

let b:current_syntax = "systemverilog"

" vim: ts=8
