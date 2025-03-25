[ch (id=records) [title Records]

    The following example shows a record tagged [c config] with fields [c color], [c width], [c height], and [c remark]:
    [caption File config.pdml]
    [code
        """
        [config
            [color green]
            [width 162]
            [height 100]
            [remark]
        ]
        """
    ]
    
    Records can be nested to any level.
    In other words, a record field can itself be a record (or any other type of data).
    For example, you can group fields [c width] and [c height] into a nested record tagged [c dimensions]:
    [scode
        """
        \[config
            \[color green\]
            [b \[dimensions
                \[width 162\]
                \[height 100\]
            \]]
            \[remark\]
        \]
        """
    ]

    The indentation in the above example (as well as in all other examples shown in this document) is optional.
    You could also encode [c config] using the so-called compact form:
    [code
        """
        [config [color green][dimensions [width 162][height 100]][remark]]
        """
    ]
    For more information about indentation and other forms of insignificant whitespace you may read [link (url="^[get core_spec_url]#whitespace_tips") How to Handle Whitespace].
]
