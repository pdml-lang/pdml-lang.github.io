[ch Attributes

[ch Overview

    Besides elements, XML also supports attributes. Here is an example of an XML element with attributes:

    [code
        <div id="unplug_warning" class="warning big-text">Unplug power cord before opening!</div>
    code]

    In pXML, the same code looks like this:

    [code
        [div ( id=unplug_warning class="warning big-text" ) Unplug power cord before opening!]
    code]

    As can be seen, the two syntaxes are similar. There are two obvious differences:
    [list
        [el
            In pXML, attributes are embedded in parentheses: [c (...)]. The syntax is like function argument assignments in some programming languages.
        ]
        
        [el
            In pXML, attribute values don't always need to be quoted (e.g. [c id=unplug_warning]).
        ]
    ]

[-
    If an element doesn't have attributes, it can be stated explicitly like this:
    [code
        [div() foo]
    code]

    ... which is semantically equivalent to:
    [code
        [div foo]
    code]

    In rare situations we [i need] to use empty parenthesis. Suppose that an element contains the text [c (organic = good)]. Then we can't write:
    [code
        [b (organic = good)]
    code]
    ... because the parser would interpret this as the value [c good] assigned to an attribute named [c organic].

    Hence we need to write:
    [code
        [b() (organic = good)]
    code]
    ... to make it clear there are no attributes.
-]
]

[ch Names

    In XML, attribute names are not quoted (unlike in JSON), and they must respect the same rules as we [xref node_id=name_rules text=previously] saw for element tag names.

    To stay compatible with XML, pXML applies the same rules. Attribute names:
    [list
        [el must start with a letter or underscore]
        [el can contain letters, digits, hyphens, underscores, and periods (no spaces)]
    ]
]

[ch Values

    In XML, attribute values must always be quoted with [c "]. Example: [c name = "Bob"].

    In pXML, values can be unquoted, double-quoted, or single-quoted.

    [b Unquoted value]

    Values are [i not required] to be quoted if they don't contain:
    [list
        [el whitespace: [c <space>, <tab>, <carriage return>, <line feed>]]
        [el square brackets: [c \[ and \]]]
        [el parenthesis: [c ( and )]]
        [el quotes: [c " and ']]
    ]

    Examples:
    [code
        name = Bob
        port = 8080
        path = C:\Users\Alice
    code]

    [b Double-quoted and single-quoted value]

    If a value contains any of the characters not allowed in unquoted values, then the value [i must] be surrounded by double-quotes ([c "]) or single-quotes ([c ']).

    Examples:
    [code
        food = "healthy orange"                 // contains space
        expression = "array[17]"                // contains square brackets
        conclusion = "It's ok."                 // contains '
        statement = 'He said: "All is well".'   // contains "
    code]
]

[ch Escape rules

    Escape sequences are not supported in unquoted attribute values. Therefore parsing unquoted values is a bit faster.

    Escaping is supported for double-quoted and single-quoted values. The following rules are applied:
    [list
        [el A backslash ([c \\ ]) is used to start an escape sequence.]

        [el
            Double quotes must be escaped in double-quoted values with [c \"]. Example:
            [code
                statement = "He said: \"All is well\"."    // He said: "All is well".
            code]
        ]
        
        [el
            Single quotes must be escaped in single-quoted values with [c \']. Example:
            [code
                conclusion = 'It\'s ok.'    // It's ok.
            code]
        ]
        
        [el A backslash must be escaped with [c \\\\ ]. Example:
            [code
                path = "C:\\Users\\Alice"    // C:\Users\Alice
            code]
        ]
        
        [el
            The following values can [i optionally] be escaped:

            [table_data
                Name	Syntax
                -
                square brackets	\[ \]
                tab	\t
                carriage return	\r
                line feed	\n
            table_data]
        ]
        
        [el
            Any Unicode character can be inserted by using the [c \uhhhh] syntax commonly used in programming languages. Example:
            [code
                word = "Hell\u006f"    // Hello
            code]
        ]
    ]
]

[ch New lines

    For better readability, attribute assignments can be written on separate lines, like this:
    [code
        [image (
            source = images/kid.png
            title  = "Kid is flabbergasted"
            width  = 800px
            height = 600px
        )]
    code]

    Whitespace between attribute assignments is ignored.

    Quoted values can contain new lines. Example:

    [code
        statement = 'He said:       // He said:
        "All is well!"'             // "All is well!" 
    code]

    If new lines are inserted literally in the code, as in the above example, then the actual new line character(s) parsed depend on the operating system, as well as the editor/program configuration used to create the code. By default:
    [list
        [el On Unix/Linux, a new line is a single <line feed> character]
        [el On Windows, a new line is composed of two characters: a <carriage return> and <line feed>]
    ]

    On both systems, this default behavior might be overridden. For example, a Windows editor can be configured to produce a single <line feed> character for new lines inserted in the code.

    To force a specific new line in pXML code, we can use an escape sequence in the code, e.g.:
    [code
        statement = 'He said:\r\n"All is well!"'    // Windows new line forced
        statement = 'He said:\n"All is well!"'      // Unix new line forced
    code]
]

[ch Differences between XML and pXML

    In pXML, writing:
    [code
        [e (a1=v1 a2=v2)]
    code]
    is semantically equivalent to:
    [code
        [e [a1 v1][a2 v2]]
    code]
    
    In both cases, node [c e] is a node with two child nodes: [c a1] and [c a2]. The API to access the content of [c e] is the same in both cases.
    
    pXML attributes just provide an alternative [i syntax] for child nodes.

    The alternative syntax is useful because it is better suited for sets of child nodes that contain only text.

    Here is a node not using attributes:
    [code
        [image [source ball.png][width 300px][height 200px]]
    code]
    The same node defined with attributes looks like this:
    [code
        [image (source=ball.png width=300px height=200px)]
    code]
    The second version (using attributes) is slightly shorter, easier to read and write, and more familiar to people used to the XML attributes syntax. However, both versions are parsed into the same tree structure.

    This contrasts with XML, where attributes and elements are different. In XML, the API used to access attributes is different from the API for child elements. Hence, a program that reads an XML structure must know if a value is an attribute or an element. Moreover, if a value that was initially defined as an attribute, is later defined as an element (or vice versa), then the program that reads the value must be updated. This is not necessary in pXML.
]

]
