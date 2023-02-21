[ch (id=fundamental_examples) [title Fundamental Examples]


    [ch (id=hello) [title Hello]
    
        [code
            ~~~
            [hello]
            ~~~
        ]
        
        The above code illustrates the simplest possible PDML document.
        
        It's a root node with name [c hello] and no content (no child nodes). [c hello] is an empty root node.
    ]


    [ch (id=text_node) [title Text node]

        [code
            ~~~
            [teachers Bob]
            ~~~
        ]
        The node with name [c teachers] contains the text [c Bob]. The node's name and text are separated by a space character.

        A node's text can contain spaces:
        [code
            ~~~
            [teachers Bob and Alice]
            ~~~
        ]
        Now node [c teachers] contains the text [c Bob and Alice]

        New lines and Unicode characters can also be used in a node's text:
        
        [code
            ~~~
            [info He said:
                "She said: 'All is well!'" 😃]
            ~~~
        ]

        In the above example node [c info] contains the text:
        [code
            ~~~
            He said:
                "She said: 'All is well!'" 😃
            ~~~
        ]
    ]



    [ch (id=child_node) [title Node with one child node]

        [code
            ~~~
            [config [color orange]]
            ~~~
        ]
        Node [c config] has one child node with name [c color] and text [c orange].
    ]


    [ch (id=tree) [title Tree]

        [code
            ~~~
            [config[color orange][size[width 1618][height 1000]]]
            ~~~
        ]
        
        Node [c config] has two child nodes: [c color] and [c size]. Node [c size] has two child nodes too: [c width] and [c height].

        Readability and writeabilty are considerably improved when indents are used to visualize the structure:

        [code
            ~~~
            [config
                [color orange]
                [size
                    [width 1618]
                    [height 1000]
                ]
            ]
            ~~~
        ]
        Now the AST has additional text nodes containing whitespace, but whitespace nodes like this are typically ignored by applications reading config data.
    ]


    [ch (id=simple_markup_code) [title Markup code]

        Suppose we want to render the following text in a browser:

        We can write text in [i italic], [b bold], or [i [b italic and bold]].

        In HTML we would write:
        [code
            ~~~
            <div>We can write text in <i>italic</i>, <b>bold</b>, or <i><b>italic and bold</b></i>.</div>
            ~~~
        ]
        
        In PDML the code becomes:
        [code
            ~~~
            [div We can write text in [i italic], [b bold], or [i [b italic and bold]].]
            ~~~
        ]
    ]

    [ch (id=escape_chars) [title Escape characters in text]
    
        If node [c p] contains the text:
        
        [sp][sp][sp][sp]foo\\bar\[12\]

        ... then \[, \], and \\ must be escaped:
        [code
            ~~~
            [p foo\\bar\[12\]]
            ~~~
        ]
    ]
]
