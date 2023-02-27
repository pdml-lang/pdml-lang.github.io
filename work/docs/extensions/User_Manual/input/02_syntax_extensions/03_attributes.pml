[ch (id=attributes) [title Attributes]

    [ch (id=attributes_overview) [title Overview]

        Attributes are used to assign a list of name/value pairs to a node.
        Each value is an arbitrary string.

        Here is an example:
        [code
            ~~~
            [image [@ width="200" height="100"] images/ball.png]
                      ^^^^^^^^^^^ ^^^^^^^^^^^^
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
            ~~~
        ]
        
        The above [c image] node has two attributes:
        [list
            [el A first attribute with name [c width] and value [c 200]]
            [el A second attribute with name [c height] and value [c 100]]
        ]

        The content of the node is the text [c images/ball.png].

        PDML attributes are conceptually similar to attributes in XML/HTML.
        The following code shows the same data expressed in PDML and XML:
        [code
            ~~~
            PDML: [image [@ width="200" height="100"] images/ball.png]
            
            XML:  <image width="200" height="100">images/ball.png</image>
            ~~~
        ]
    ]

    [ch (id=attributes_when) [title When to Use Attributes?]

        PDML does not specify when to use attributes.

        Attributes are typically used only to attach simple meta-data or additional information to nodes.
        Attribute values are mostly simple scalar values like strings, numbers, booleans, enumerateds, etc.
        This is similar to how attributes are used in HTML.

        However, because attributes can hold strings of any length and any content, noting prevents you to store structured data (of any complexity) in attributes, if you have a good reason to do so.

        Here is an example of a node that uses the PDML syntax in attribute [c dimensions], and a mini-DSL syntax in attribute [c border_color]:

        [code
            ~~~
            [image [@ dimensions="[width 200][height 100][units px]" border_color="rgb(0,0,255)"]]
            ~~~
        ]

        In all cases, the PDML parser just parses a string value for each attribute.
        You can then explicitly convert this string into a value of any type required in your application.
        For example, you [i could] store a JSON/PDML/XML document in an attribute.
        But then you need to parse the string value (returned by the PDML parser) into a typed value (e.g. an XML tree), using a dedicated parser in your application.

        In a nutshell:
        [list
            [el Attributes are typically used to store simple meta-data.]
            [el Nodes should preferably be used to store structured data.]
            [el For each attribute, the PDML parser just parses a string value.]
            [el In rare situations, attributes can be used to store structured data which must then be parsed into a typed value by the client application.]
        ]
    ]

    [ch (id=attributes_syntax) [title Syntax Rules]

        [ch (id=attributes_position) [title Position]

            Attributes must appear after the node name, and before the node content.
            [code
                ~~~
                [node_name [@ a1="v1"] node content]
                           ^^^^^^^^^^^
                ~~~
            ]
        ]

        [ch (id=attributes_start_end) [title Start/End]

            A list of attributes starts with [c \[@], and ends with [c \]]:
            [code
                ~~~
                [node_name [@ a1="v1"] node content]
                           ^^        ^
                ~~~
            ]
        ]

        [ch (id=attributes_name) [title Name]

            An attribute name has the same rules as a [link (url=[u:get core_pdml_spec]#node_name ) node name].
            It starts with a letter or an underscore ([c _]), optionally followed by any number of letters, digits, underscores ([c _]), hyphens ([c -]), or dots ([c .]).

            Here are some examples of valid attribute names:
            [code
                ~~~
                color
                HTML_file_path
                _ID_12.5-a
                ~~~
            ]

            Attribute names are case-sensitive.
            Hence the following names are different: [c color], [c COLOR], [c Color].

            Each attribute in a single node must have a unique name.
            The same attribute name can appear in different nodes.
        ]

        [ch (id=attributes_assignment_symbol) [title Assignment Symbol]

            Attribute names and values are separated by an equals sign ([c =]):
            [code
                ~~~
                color="orange"
                     ^
                ~~~
            ]
        ]

        [ch (id=attributes_value) [title Value]

            An attribute value is enclosed in a pair of quotes:
            [code
                ~~~
                color="orange"
                      ^      ^
                ~~~
            ]

            An attribute value can contain any Unicode characters, including spaces and new lines:
            [code
                ~~~
                colors="red
                light green
                blue 😀😀😀"
                ~~~
            ]

            [note
                Extension nodes (covered [xref (ref_id=extension_nodes) later]) are supported in attribute values.
            ]
        ]

        [ch (id=attributes_escape_rules) [title Character Escape Rules in Values]

            Quote characters ([c "]) and backslashes ([c \\]) within a value must be escaped.
            For example, the value [c "1\\2"] would be assigned as follows:
            [code
                ~~~
                code="\"1\\2\""
                      ^^ ^^ ^^
                ~~~
            ]

            Square brackets ([c \[\]]) don't need to be escaped, but for consistency with text nodes, they can be escaped if desired.
            For example, to assign the value [c \[1\]], the following two assignments are valid:
            [code
                ~~~
                index = "[1]"
                index = "\[1\]"
                ~~~
            ]

            If the parser supports [xref (ref_id=escape_sequences)] in text nodes, then the same escape sequences can also be used in attribute values:
            [code
                ~~~
                a1 = "line 1\nline\t2\r\nline \u0033 \U0001F600"
                            ^^    ^^ ^^^^     ^^^^^^ ^^^^^^^^^^
                ~~~
            ]

            The above attribute contains the value:
            [code
                ~~~
                line 1
                line    2
                line 3 😀
                ~~~
            ]
        ]

        [ch (id=attributes_whitespace) [title Whitespace Handling]

            While whitespace in text [i nodes] is preserved by a PDML parser, it is ignored in [i attributes].

            Whitespace characters (spaces, tabs, and/or new lines) before, between, or after attributes is ignored.
            Hence the following nodes are equivalent:
            [code
                ~~~
                [image [@ source="resources/images/flower.png" width="200" height="100"]]

                [image [@
                    source = "resources/images/flower.png"
                    width = "200"
                    height = "100"
                ]]

                [image
                    [@
                        source = "resources/images/flower.png"
                         width = "200"
                        height = "100"
                    ]]
                ~~~
            ]

            The first whitespace character after the list of attributes is ignored.
            Additional whitespace is part of a text node.
            Hence the following node (which contains [i two] spaces after the list of attributes) contains the text [c " foo"] (foo with [i one] leading space)
            [code
                ~~~
                [name [@ a1="v1"]  foo]
                                 ^^
                ~~~
            ]
        ]

        [ch (id=attributes_comments) [title Comments in Attributes]

            If the parser supports [xref (ref_id=comments) comments], then any number of comments is allowed before or after an attribute assignment. Example:
            [code
                ~~~
                [image [@
                    [- width in pixels -]
                    width = "200"

                    color = "0, 255, 0" [- RGB values -]
                ]]
                ~~~
            ]

            Comments are not allowed
                [list
                    [el Between the node name and the start of attributes ([c \[@]).]
                    [el Before or after the assignment symbol ([c =]).]
                ]
        ]
    ]

    [ch (id=attributes_syntax_simplifications) [title Syntax Simplifications]

        In this chapter we are going to look at some optional syntax simplifications for attributes.
        These simplifications aim to shorten the syntax and make it more convenient for humans to write PDML documents.

        However, the following simplifications can also lead to ambiguities and errors in rare edge cases.
        Hence, they should only be applied in projects where these edge cases (described below) cannot occur.
        When in doubt it is best to stick to the standard syntax described in the previous chapters.

        Moreover, besides making the parser more complex, the following syntax variations also make third-party tools (e.g. editor plugins) more challenging to develop.

        [ch (id=attributes_lenient_parsing) [title Lenient Parsing]

            To shorten the syntax for attributes, a parser can support the following lenient parsing rules:

            [list
                [el
                    Quotes around attribute values can be omitted if the value does not contain:
                    [list
                        [el Whitespace (spaces, tabs, carriage returns, and line feeds)]
                        [el The following characters: [c \[ \] ( ) " ']]
                        [el Escape sequences like [c \\n], [c \\u0041], etc.]
                    ]

                    Hence, instead of writing:
                    [code
                        ~~~
                        size="200" file="foo\\bar.txt"
                             ^   ^      ^            ^
                        ~~~
                    ]
                    ... we can write shorter code:
                    [code size=200 file=foo\\bar.txt]
                ]

                [el
                    If a node is specified to have only attributes (child nodes are not allowed) then the start/end symbols ([c \[@ \]]) around attributes can be omitted.

                    Consider an [c image] node that has attributes, but no child nodes.
                    Instead of writing:

                    [code
                        ~~~
                        [image [@ source="images/juicy apple.png" width="400"]]
                               ^^                                       ^   ^^
                        ~~~
                    ]
                    ... we can simply write:
                    [code
                        ~~~
                        [image source="images/juicy apple.png" width=400]
                        ~~~
                    ]

                    [header Warning]

                    Omitting the start/end symbols can lead to subtle bugs and invalid documents if the specification for a node changes.

                    Consider a node specified to have only attributes:
                    [code
                        ~~~
                        [foo a1 = "v1"]
                        ~~~
                    ]
                    Now suppose that the specification of the node changes later.
                    The node can now also contain text.
                    
                    Then [i the meaning of the above code silently changes]!
                    
                    The initial version was parsed as node [c foo] with attribute [c a1] set to [c v1]. 
                    But now the node is parsed as node [c foo] with text content [c a1 = "v1"].
                    To keep the initial semantics, the code must be changed to:
                    [code
                        ~~~
                        [foo [@ a1 = "v1"]]
                        ~~~
                    ]
                    This is error prone!

                    Hence, one should think twice before making the start/end symbols optional.
                    It is best to avoid this syntax simplification if the specification for nodes risks to change in future versions.
                ]
            ]
        ]

        [ch (id=attributes_alternative_start_end) [title Alternative Start/End Syntax]

            Instead of using the [c \[@ \]] symbols to embed attributes, a pair of parenthesis ([c ( )]) can alternatively be used.

            Using parenthesis makes the code a bit shorter and more visually appealing, as shown below:
            [code
                ~~~
                [name [@ a1="v1" a2="v2" ] ]     // standard syntax
                      ^^                 ^

                [name ( a1="v1" a2="v2" ) ]      // alternative syntax
                      ^                 ^
                ~~~
            ]

            However, using parenthesis is error-prone if the text in a node starts with [c \(].

            Suppose a node contains the text [c () (organic=better)], but no attributes.
            Then the following code is ambiguous:
            [code
                ~~~
                [i (organic=better)]
                ~~~
            ]
            If the parser does not support attributes (i.e. a parser that supports only [i Core PDML]), then a node with text [c \(organic=better)] is parsed.
            However, if attributes are supported, then a node with attribute [c organic] is parsed.

            There are two workarounds.

            [list
                [el
                    To make it clear that there are no attributes, we can write:
                    [code
                        ~~~
                        [i () (organic=better)]
                        ~~~
                    ]
                ]

                [el
                    If the parser supports an additional [c \\)] escape sequence, then we can escape the [c \(] to make it clear that the [c \(] is not the start of attributes:
                    [code
                        ~~~
                        [i \(organic=better)]
                        ~~~
                    ]
                ]
            ]

            However, the above workarounds are error-prone if the document is accidentally parsed with a parser that doesn't support attributes (e.g. a parser that supports only [i Core PDML]).

            In the first case the parser reads a node with text [c \() (organic=better)] (instead of [c \(organic=better)]).

            In the second case the parser generates an error because [c \\(] is not supported. That's better, because we get aware of the problem, instead of silently getting wrong data.

            Another rare edge case can arise if the specification of a node changes.
            
            For example, suppose a node specified to contain only attributes (no child nodes) changes to a node that contains only child nodes (no attributes). Then the following code silently changes from a node with attribute [c a1] to a node with text [c \(a1="v1")]:
            [code
                ~~~
                [foo (a1="v1")]
                ~~~
            ]

            All above edge cases don't exist when the standard syntax is used:
            [code
                ~~~
                [i [@ organic=better]]
                ~~~
            ]

            Moreover, if a document using attributes is accidentally read by a parser without support for attributes then an error is generated, because [c \[@] is parsed as the start of a node with an invalid name. Hence there is no risk of silently parsing wrong data.

            A PDML parser implementation that supports attributes should clearly specify which syntax it supports: only the standard syntax, only the alternative syntax, or both.

            [note
                By default the parser in the [link (url=https://github.com/pdml-lang/full-pdml-impl) full PDML reference implementation] only supports the standard syntax. But there are two configuration flags to explicitly activate/deactivate the standard and alternative syntaxes.

                Lenient parsing is also switched off by default. There are configuration flags to explicitly enable lenient parsing.
            ]
        ]
    ]
]
