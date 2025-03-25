[ch (id=data_and_markup) [title Data and Markup]

    Data and markup can be mixed in a single PDML document.

    The following code shows a record tagged [c product].
    Look at field [c description].
    It contains PML markup embedded in a PDML data document:
    
    ^// The code rendered in bold is markup that uses the PML syntax:

    [code
        """
        [product
            [id 123]
            [name PML]
            [category software]
            [description
                PML is a powerful markup language using
                [link (url="https://pdml-lang.dev/") PDML] under the hood.
                For example it allows you to:
                [list
                    [el Render text in [i italic], [b bold], [strike strikethrough], and other styles.]
                    [el Insert [i lists], [i tables], [i quotes], [i footnotes], etc.]
                    [el Embed [i images], [i audios], and [i videos].]
                ]
                [note For more information visit the [link (url="https://pml-lang.dev") PML website].]
            ]
            [price free for everyone]
            [remark]
        ]
        """
    ]

    The markup in field [c description] would be rendered as follows:
    [div (html_style="background-color: #e3f6f5; border: 1px dotted grey; border-radius: 1em; padding: 1em; ")
        PML is a powerful markup language using [link (url="https://pdml-lang.dev/") PDML] under the hood.
        For example it allows you to
        [list
            [el Render text in [i italic], [b bold], [strike strikethrough], and other styles.]
            [el Insert [i lists], [i tables], [i quotes], [i footnotes], etc.]
            [el Embed [i images], [i audios], and [i videos].]
        ]
        [note For more information visit the [link (url="https://pml-lang.dev") PML website].]
    ]

    Now let's look at a more complex example illustrating API documentation that contains a mixture of scalar values, lists, records, and markup:
    [code
        """
        [API_doc
            [functions
                [function
                    [name foo]
                    [description
                        PML markup ...
                    ]
                    [input
                        [parameter
                            [name p1]
                            [type string]
                            [description
                                PML markup ...
                            ]
                        ]
                        [parameter
                            [name p2]
                            [type integer]
                            [description
                                PML markup ...
                            ]
                        ]
                    ]
                    [output
                        [type integer]
                        [description
                            PML markup ...
                        ]
                    ]
                ]
                [function
                    [name bar]
                    ...
                ]
            ]
        ]
        """
    ]
    
    Points of interest:
    [list
        [el
            Node [c functions] contains a list of [c function] elements.
            Node [c input] contains a list of [c parameter] elements.
        ]
        [el
            Node [c function] contains record data.
            Its (indirect) child-nodes [c parameter] and its (direct) child-node [c output] are records too.
        ]
        [el
            All nodes tagged [c description] contain PML markup embedded in the PDML document.
        ]
    ]
]
