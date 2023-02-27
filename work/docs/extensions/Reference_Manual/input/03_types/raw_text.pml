[ch (id=raw_text) [title [c raw_text]]

    A [c t:raw_text] type denotes a block of raw text.

    In this context, the term [i raw] means that the text is not interpreted by the parser.
    For example, the text [c \[foo\]] is not parsed as an empty node with name [c foo].
    It is pared as the text [c "\[foo\]"].

    There are two syntax variations supported, as shown in the following chapters:

    [ch (id=raw_text_delimiter_syntax) [title Delimited Text Syntax]

        Example:
        [code
            ~~~
            [t:raw_text
                ~~~
                first text line
                ...
                last text line
                ~~~
            ]
            ~~~
        ]

        The text is embedded between two delimiter lines (the [c ~~~] lines in the above example).
        
        A [i delimiter line] is a sequence of:
        [list
            [el an optional indent (spaces and tabs)]
            [el 3 or more identical delimiter characters]
            [el a new line]
        ]

        A [i delimiter character] must be a [c "], [c =], or [c ~].
        
        The opening delimiter line must contain at least 3 delimiter characters.
        The closing delimiter line must contain the same number of delimiter characters as the opening delimiter line.
        Examples of valid delimiter lines: [c """], [c ====], [c ~~~~~~~~~~].

        The indent within the node is handled as follows:
        [list
            [el The indent of the opening delimiter line is optional. It is composed of only spaces, or only tabs. Mixing spaces and tabs is not allowed.]
            [el The closing delimiter line must have exactly the same indent as the opening delimiter line. More indent is not allowed.]
            [el The text lines between delimiter lines must have at least the same indent as the opening delimiter line. Text lines [i can] have more indent.]
            [el The indent of the opening delimiter line is removed in all subsequent text lines. Additional indent in text lines is preserved.]
        ]
        Hence, the following node:
        [code
            ===
                [t:raw_text
                    ~~~
                    if ( list[index] == 0 ) {
                        write_line ( "The value is zero." )
                    }
                    ~~~
                ]
            ===
        ]
        ... expands to:
        [code
            ~~~
            if ( list[index] == 0 ) {
                write_line ( "The value is zero." )
            }
            ~~~
        ]
    ]
        
[-
    [ch (id=raw_text_block_syntax) [title Text Block Syntax]

        Example:
        [code
            ~~~
            [t:raw_text
                first text line
                ...
                last text line
            raw_text]
            ~~~
        ]

        When this syntax variation is used, the node is closed by repeating the node's name on a separate line, immediately followed by the node end symbol [c \]].
        
        The text must be written between the node opening and the node closing lines.

        The indent of the text line with the smallest indent is removed in all text lines. Hence, this code:
        [code
            ~~~
                [t:raw_text
                        line 1
                    line 2
                            line 3
                raw_text]
            ~~~
        ]
        ... expands to:
        [code
            ~~~
                line 1
            line 2
                    line 3
            ~~~
        ]

        All indents in the text lines must be composed of only spaces, or only tabs.
        Mixing spaces and tabs is not allowed.
    ]
-]    
        
    [ch (id=raw_text_standard_syntax) [title Standard Text Syntax]

        Example:
        [code
            ~~~
            [t:raw_text first text line
            ...
            last text line]
            ~~~
        ]

        When this syntax variation is used, the text must start on the same line as the node, just after the node's name.

        The node is handled like a standard text node, not as raw text.
        All indent is preserved.
        Text must be escaped, as in a normal text node.

        Hence, this code:
        [code
            ~~~
            [t:raw_text line \[1\]
                line 2
                    line 3
            ]
            ~~~
        ]
        ... expands to:
        [code
            ~~~
            line [1]
                line 2
                    line 3
                    
            ~~~
        ]

        This syntax variation is sometimes useful when PDML markup code needs to be parsed in a raw text node. Example:
        [code
            ~~~
            [t:raw_text first line
            [u:ins_file path=foo.txt]
            last line
            ]
            ~~~
        ]
    ]
]
