[ch (id=escape_sequences) [title Character Escape Sequences]

    The [link (url=[u:get core_pdml_spec]#escape_rules ) Core PDML Specification] specifies:
    [list
        [el The following characters must always be escaped: [c \[ \] \\].]
        [el A backslash ([c \\]) is used as escape character.]
    ]

    For example, to insert the text [c \[, \], and \\ must be escaped], we need to write:
    [code
        ~~~
        \[, \], and \\ must be escaped
        ^^  ^^      ^^
        ~~~
    ]

    Extended PDML supports two more categories of character escape sequences:
    [list
        [el
            Invisible whitespace characters:
            [sim_table
                ~~~
                Escape Sequence | ISO Name | Unicode
                -
                \t | Character Tabulation (HT, TAB) | U+0009
                \n | End of Line (EOL, LF, NL) | U+000A
                \r | Carriage Return> (CR) | U+000D
                ~~~
            ]
        ]

        [el
            Unicode escape sequences:
            [sim_table
                ~~~
                Escape Sequence | Description | Example
                -
                \uhhhh | 16 bits Unicode character, hexadecimal encoding | \u0041 (=A)
                \Uhhhhhhhh | 32 bits Unicode character, hexadecimal encoding | \U0001F600 (=😀)
                ~~~
            ]

            A 16 bits Unicode escape sequence starts with [c \\u], followed by four hexadecimal digits (denoted by [c hhhh] in the above table).

            A hexadecimal digit can be any of the following characters: [c 0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F]. The regular expression for a hexadecimal digit is [c \[0-9a-fA-F\]]

            A 32 bits Unicode escape sequence starts with [c \\U], followed by eight hexadecimal digits.
        ]
    ]

    The following table summarizes the character escape sequences supported in [i Core PDML] and [i Extended PDML]:

    [u:set no="[tc (html_style=\"text-align:center\") [span (html_style=\"font-size: 1.7em; color:red\") \u2A2F]]"]
    [u:set yes="[tc (html_style=\"text-align:center\") [span (html_style=\"font-size: 1.4em; color:green\") \u2714]]"]

    [table
        [theader
            [tr [tc Escape Sequence][tc Core PDML][tc Extended PDML]]
        ]

        [tr [tc (html_style="text-align:center") \\\[][u:get yes][u:get yes]]
        [tr [tc (html_style="text-align:center") \\\]][u:get yes][u:get yes]]
        [tr [tc (html_style="text-align:center") \\\\][u:get yes][u:get yes]]

        [tr [tc (html_style="text-align:center") \\t][u:get no][u:get yes]]
        [tr [tc (html_style="text-align:center") \\n][u:get no][u:get yes]]
        [tr [tc (html_style="text-align:center") \\r][u:get no][u:get yes]]

        [tr [tc (html_style="text-align:center") \\uhhhh][u:get no][u:get yes]]
        [tr [tc (html_style="text-align:center") \\Uhhhhhhhh][u:get no][u:get yes]]
    ]
]
