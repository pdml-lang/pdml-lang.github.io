[ch [title Basic Examples]

    This chapter shows some basic, simple examples to get an idea of what can be done with PDML.

    
    [ch [title Text Node]
    
        Suppose a config file in which parameter [c color] has the value [c green].

        In JSON we would use the following syntax:
        [code
            ~~~
            "color" = "green"
            ~~~
        ]

        In XML we could use an attribute:
        [code
            ~~~
            color = "green"
            ~~~
        ]
        ... or an element:
        [code
            ~~~
            <color>green</color>
            ~~~
        ]
        
        In PDML the syntax is:
        [code
            ~~~
            [color green]
            ~~~
        ]
        
        The above code is called a [i node] in PDML.

        As can be seen, a node is delimited by [c \[\]] - a pair of square brackets. A node starts with [c \[], and ends with [c \]].

        A node has a [i name] and an optional [i value]. In our example, the name is [c color] and the value is the text [c green].

        A space character is used to separate the name from the value.

        Text values can contain spaces, new lines and Unicode characters:
        [code
            ~~~
            [names
                Tim
                Tom
                Tam
                😃
            ]
            ~~~
        ]
    ]


    [ch [title Child Node]
    
        Besides text, a node's value can also be another node:
        [code
            ~~~
            [config [color green]]
            ~~~
        ]
        
        The value of node [c config] is another node with name [c color] and value [c green].
        
        For better readability we can also write:
        [code
            ~~~
            [config
                [color green]
            ]
            ~~~
        ]
    ]


    [ch [title Tree]
    
        The node's content can be a [i list] of nodes, and each child node can itself have any number of child nodes:
        [code
            ~~~
            [config
                [color green]
                [size
                    [width 200]
                    [height 100]
                ]
            ]
            ~~~
        ]

        Hence, PDML can be used to store simple or complex tree data that can be structured or unstructured.
    ]


    [ch [title Mixed Child Nodes]
    
        A node's content can be a [i mixture] of any number of text and child notes. This makes PDML convenient to store markup code.

        Suppose we want to render:
        [html
            ~~~
            <p>Life is <i>better</i> if we are <b>kind</b>.</p>
            ~~~
        ]
        
        In HTML we would write:
        [code
            ~~~
            <div>Life is <i>better</i> if we are <b>kind</b>.</div>
            ~~~
        ]

        In PDML this is written as:
        [code
            ~~~
            [div Life is [i better] if we are [b kind].]
            ~~~
        ]
    ]


    [ch [title Empty Node]
    
        A node can be empty. It has a name, but no content:
        [code
            ~~~
            [color]
            ~~~
        ]
        
        In JSON this would be written as:
        [code
            ~~~
            "color" = null
            ~~~
        ]
        
        In XML:
        [code
            ~~~
            <color></color>
            ~~~
        ]
        
        or simply:
        [code
            ~~~
            <color />
            ~~~
        ]
    ]

    There is not much more to say about PDML's core syntax.

    For a formal and complete definition please refer to the [link (url=[u:get pdml_docs_url]basic-specification/index.html) PDML Specification].
]