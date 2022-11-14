[ch (id=extensions) [title Extensions]

    As seen already, PDML's basic syntax is very simple and succinct - easy to read and write for humans and machines. Despite its simplicity, basic PDML can be used to store small/big data/markup code.

    However, this utmost simplicity can cause inconveniences, especially when big documents are read and written by humans. Therefore a PDML implementation can optionally provide pluggable [i extensions] to make it more practical.
    
[- TODO
    The documentation's [link url=[u:get pdml_docs_url]index.html#extensions text=Extensions] section provides more information about extensions that are part of PDML's specification.
-]

    The following chapters provide a non-exhaustive, brief overview of some useful extensions. It's a subset of extensions that are implemented already in the reference implementation written in Java.

    [ch [title Comments]
        A comment starts with [c \[-] and ends with [c -\]]. Comments can be inserted anywhere. They can be nested to any level. Text within comments is ignored.

        Example:
        [code
            This is [- good -] awesome.
            [- TODO: explain why -]
            
            [- another comment
                [- nested comment -]
            -]
        code]
    ]

    [ch [title Attributes]
            
        PDML attributes are conceptually similar to XML attributes. They are typically used to add metadata to nodes.
        
        For example, the following HTML code uses attributes to identify and style node [c div]:
        [code
            <div id="my_div" class="my_class">content</div>
        code]
        In PDML this would be written as follows:
        [code
            [div (id=my_div class=my_class) content]
        code]
    ]

    [ch [title Character Escape Sequences]
            
        Besides the [link url=[u:get pdml_docs_url]basic-specification/index.html#escape_rules text=mandatory] character escape sequences ([c \\\[], [c \\\]], and [c \\\\]), the following whitespace and Unicode escape sequences can be used:
        [table_data
            Code, Description
            -
            \t, TAB character
            \r, carriage return
            \r, line feed
            \uhhhh, Unicode escape (4 hex digits / 16 bits)
            \Uhhhhhhhh, Unicode escape (8 hex digits / 32 bits)
        table_data]

        For example, this text:
        [code
            line 1\nline 2 \u0041 \U0001F600
        code]
        ... is parsed as:
        [code
            line 1
            line 2 A 😃
        code]
    ]

    [ch [title Parameters]
            
        Parameters are used to define recurring text snippets and data structures. This helps to eliminate code duplication and makes PDML documents more maintainable.

        A parameter is declared once with a [c !set] node, and its value can then be inserted any number of times with a [c !get] node.

        Here is an example of PML markup code that stores the company's website URL into parameter [c company_URL], and then inserts the URL in subsequent text:
        [code
            [doc [title Company Overwiew]
                [u:set company_URL=https://www.my_company.org]
                ...
                Our website: [u:get company_URL]
                ...
                Click [link url=[u:get company_URL]/contacts/index.html text=here] to see a list of contacts.
            ]
        code]

        [note
            Note the [c !] character that precedes the name in nodes [c set] and [c get]. The [c !] is used to denote a so-called [i extension node], and provides a distinction from normal data nodes. A PDML implementation can provide any number of extension nodes, and support pluggable, customized extensions to cover specific needs.
        ]
    ]


    [ch [title Document Splitting]

        When a PDML document exceeds a certain size, it often makes sense to split it up into different files. For example:
        [list
            [el each table in a database document is stored in a separate file]
            [el each chapter in a long article or book is stored in a separate file]
        ]

        Document splitting is done with the [c !ins-file] extension node. Here is an example of markup code that uses a different file for each chapter in an article:

        [caption File main.pml]
        [code
            [doc [title Long Article]
                [u:ins_file path=chapters/introduction.pml]
                [u:ins_file path=chapters/body.pml]
                [u:ins_file path=chapters/conclusion.pml]
            ]
        code]

        [caption File chapters/introduction.pml]
        [code
            [ch [title Introduction]
                text text text
            ]
        code]

        [caption File chapters/body.pml]
        [code
            [ch [title Body]
                text text text
            ]
        code]

        [caption File chapters/conclusion.pml]
        [code
            [ch [title Conclusion]
                text text text
            ]
        code]

        Sub-documents can themselves also be splitted to any level.

        [c !ins-file] nodes are also useful if different documents share common parts, such as a common header/footer used in all articles of a blog.
    ]


    [ch [title Types (work in progress)]

        Types are used to validate the content of nodes, and to define how a node is parsed.

        For example, node [c birthdate] could be configured to be of type [c date], which means that the content of node [c birthdate] must be text that represents a valid date in the past, such as:
        [code
            [birthdate 1879-03-14]
        code]

        Let's look at a real-world use-case of a PDML type in [link url=https://www.pml-lang.dev/ text=PML]. Some PML nodes are designed to contain small or large pieces of raw text. For instance, PML has a node named [c code] to display highlighted source code. Suppose we want to show the following source code in a PML document:
        [code
            repeat 3 times
                write_line ( "[Hello]" )
            .
        code]

        If we used only basic PDML syntax, and a [c code] node that is itself indented (because it's contained in a parent node), we would need to write:
        [code
            ===
                [code repeat 3 times
                write_line ( "\[Hello\]" )
            .]
            ===
        ]

        This is not very readable. Moreover the characters [c \[] and [c \]] in the source code must be escaped ([c "\\\[Hello\\\]"]).

        A dedicated PDML type associated with node [c code] removes these inconveniences and allows us to write:

        [code
            ===
                [code
                    """
                    repeat 3 times
                        write_line ( "[Hello]" )
                    .
                    """
                ]
            ===
        ]

        Note that:
        [list
            [el The text content of node [c code] is defined between the two [c """] lines]
            [el The indent of the first [c """] defines the indent to be removed in the subsequent source code lines.]
            [el Characters [c \[] and [c \]] in the source code don't need to be escaped anymore.]
        ]

        If a PML highlighter is used, we can use attribute [c lang] to specify the programming language:
        [code
            ===
                [code (lang=Java)
                    """
                    for (int i=1; i <= 3; i++) {
                        System.out.println ( "[Hello]" );
                    }
                    """
                ]
            ===
        ]

        A PDML implementation can provide a standard set of frequently used types (string, number, boolean, date, time, etc.). To maximize flexibility and customization for different domains, additional types can be added programmatically or by configuration data that can be included in the PDML document, or provided in an external (possibly shared) PDML document.
    ]
]
