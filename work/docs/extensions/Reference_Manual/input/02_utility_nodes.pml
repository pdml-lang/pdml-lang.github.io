[ch (id=utility_nodes) [title Utility Nodes]

    This chapter describes utility nodes.

    Utility nodes are all part of the namespace prefix [c u].

    [ch (id=set_node) [title [c u:set]]

        A [c u:set] node assigns a value to one or more parameters.

        After defining a parameter, its value can be inserted in the document with a [xref (ref_id=get_node)] node.

        The syntax for assigning a value to a parameter is:
        [code
            ~~~
            name = "value"
            ~~~
        ]

        Hence, the following code assigns the value [c light green] to parameter [c color]:
        [code
            ~~~
            [u:set color = "light green"]
            ~~~
        ]

        The syntax rules for parameters are the same as those for [link (url=[u:get pdml_docs_extensions_url]user_manual/index.html#attributes) attributes] (quoted/unquoted values, whitespace, character escapes, and lenient parsing):

        For example, several parameters can be assigned in a single [c u:set] node, whitespace between attributes is ignored, and some values can be unquoted:
        [code
            ~~~
            [u:set
                width=200
                height=100
            ]
            ~~~
        ]

        The rules for a parameter's [i name] are the same as those for a [link (url=[u:get pdml_docs_url]core/specification/index.html#node_name) node name].

        After assigning a value to a parameter, its value cannot be changed later in the document.
        Parameters are like constants in programming languages.
    ]

    [ch (id=get_node) [title [c u:get]]

        A [c u:get] node gets a parameter and inserts the parameter's value in the document. The parameter must have been defined with a [xref (ref_id=set_node)] node before it can be used in a [c u:get] node.

        The name of the parameter to be retrieved is defined by the node's text content.
        Hence, the following code inserts the value of parameter [c color] into the document:
        [code
            ~~~
            [u:get color]
            ~~~
        ]
    ]

    [ch (id=ins_file_node) [title [c u:ins_file]]

        A [c u:ins_file] node reads a text file and inserts the text into the PDML document.

        The file's path is specified by attribute [c path].
        
        For example, the following code inserts the text stored in file [c foo.txt] into the document:
        [code
            ~~~
            [u:ins_file path=foo.txt]
            ~~~
        ]

        The [c path] can be absolute or relative.
        If it's relative, it is relative to the directory of the PDML file in which [c u:ins_file] is used.
        If [c u:ins_file] is not used in a file, then the current working directory is used as root.
    ]
]
