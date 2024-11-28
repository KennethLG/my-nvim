
" Keywords
syntax keyword gmlKeyword var if else while for break continue return function
syntax keyword gmlKeyword true false undefined

" Functions
syntax keyword gmlFunction draw_self draw_sprite instance_create instance_destroy
syntax keyword gmlFunction instance_exists room_goto alarm_set globalvar global

" Operators
syntax match gmlOperator /[-+*/%=<>!&|]/

" Numbers
syntax match gmlNumber /\<\d\+\.\d*\>/
syntax match gmlNumber /\<\d*\.\d\+\>/
syntax match gmlNumber /\<\d\+\>/

" Strings
syntax match gmlString /"[^"]*"/
syntax match gmlString /'[^']*'/

" Comments
syntax match gmlCommentStart /\/\*/
syntax match gmlCommentEnd /\*\//
syntax match gmlComment /\/\/.*/

" Highlighting groups
hi link gmlKeyword Keyword
hi link gmlFunction Function
hi link gmlOperator Operator
hi link gmlNumber Number
hi link gmlString String
hi link gmlComment Comment
