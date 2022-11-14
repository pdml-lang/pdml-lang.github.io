[ch [title Basic Examples]

    This chapter shows some basic, simple examples to get an idea of what can be done with PDML.

    
    [ch [title Text Node]
    
        Suppose a config file in which parameter [c color] has the value [c green].

        In JSON we would use the following syntax:
        [code
            "color" = "green"
        code]

        In XML we could use an attribute:
        [code
            color = "green"
        code]
        ... or an element:
        [code
            <color>green</color>
        code]
        
        In PDML the syntax is:
        [code
            [color green]
        code]
        
        The above code is called a [i node] in PDML.

        As can be seen, a node is delimited by [c \[\]] - a pair of square brackets. A node starts with [c \[], and ends with [c \]].

        A node has a [i name] and an optional [i value]. In our example, the name is [c color] and the value is the text [c green].

        A space character is used to separate the name from the value.

        Text values can contain spaces, new lines and Unicode characters:
        [code
            [names
                Tim
                Tom
                Tam
                😃
            ]
        code]
    ]


    [ch [title Child Node]
    
        Besides text, a node's value can also be another node:
        [code
            [config [color green]]
        code]
        
        The value of node [c config] is another node with name [c color] and value [c green].
        
        For better readability we can also write:
        [code
            [config
                [color green]
            ]
        code]
    ]


    [ch [title Tree]
    
        The node's content can be a [i list] of nodes, and each child node can itself have any number of child nodes:
        [code
            [config
                [color green]
                [size
                    [width 200]
                    [height 100]
                ]
            ]
        code]

        Hence, PDML can be used to store simple or complex tree data that can be structured or unstructured.
    ]


    [ch [title Mixed Child Nodes]
    
        A node's content can be a [i mixture] of any number of text and child notes. This makes PDML convenient to store markup code.

        Suppose we want to render:
        [html
            <p>Life is <i>better</i> if we are <b>kind</b>.</p>
        html]
        
        In HTML we would write:
        [code
            <div>Life is <i>better</i> if we are <b>kind</b>.</div>
        code]

        In PDML this is written as:
        [code
            [div Life is [i better] if we are [b kind].]
        code]
    ]


    [ch [title Empty Node]
    
        A node can be empty. It has a name, but no content:
        [code
            [color]
        code]
        
        In JSON this would be written as:
        [code
            "color" = null
        code]
        
        In XML:
        [code
            <color></color>
        code]
        
        or simply:
        [code
            <color />
        code]
    ]

    There is not much more to say about PDML's basic syntax.

    For a formal and complete definition please refer to the [link url=[u:get pdml_docs_url]basic-specification/index.html text="PDML Specification"].
]