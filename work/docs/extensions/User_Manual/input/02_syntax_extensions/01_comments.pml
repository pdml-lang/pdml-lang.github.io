[ch (id=comments) [title Comments]

    [ch (id=comments_overview) [title Overview]
        A comment consists of a text segment that is not part of the data/markup code stored in a PDML document.

        Comments are typically used to add information that is useful for human readers, but ignored by machines that read the PDML document.
        For example, a comment can provide a general description of the data stored in a document.

        Comments are also useful to temporarily disable a segment of a document without deleting it.

        Here is an example of a PDML document with various comments:
        [code
            ~~~
            [config
                [- This configuration file is used to ... -]        <
                
                [power 220V]

                [- values are in degrees Celcius -]                 <
                [min_temp -20]
                [max_temp 50]

                [-                                                  <
                    temporarily disabled to used default values     <
                    [security_level 5]                              <
                    [log_level debug]                               <
                -]
            ]
            ~~~
        ]
    ]

    [ch (id=comments_syntax) [title Syntax Rules]

        [ch (id=comments_start_end_symbols) [title Start/End Symbols]

            A comment starts with [c \[-] and ends with [c -\]]:
            [code
                ~~~
                [- text of comment -]
                ^^                 ^^
                ~~~
            ]
        ]

        [ch (id=comments_start_end_positions) [title Start/End Positions]

            A comment can start at any position in a line. It can end at any subsequent position in the same line or at any position in a subsequent line.

            Examples:
            [code
                ~~~
                text [- comment -] text

                [- single line comment -]

                [-
                    multiple
                    lines
                    comment
                -]

                text [- this text is
                commented out -] text
                ~~~
            ]
        ]

        [ch (id=comments_location) [title Location]

            Comments can be inserted anywhere in a PDML document, even before or after the root node:

            [code
                ~~~
                [- comment -]
                
                [root
                    [- comment -]
                    text [- comment -] text
                ]
                [- comment -]
                ~~~
            ]
        ]

        [ch (id=comments_nested) [title Nested Comments]

            Comments can be nested. That is, a comment can contain another comment:
            [code
                ~~~
                [- comment [- nested comment -] comment -]
                           ^^^^^^^^^^^^^^^^^^^^
                ~~~
            ]

            Comments can be nested to any level:
            [code
                ~~~
                [- level 1 (not nested)
                    [- level 2
                        [- level 3 -]
                    -]
                -]
                ~~~
            ]
        ]
    ]
]
