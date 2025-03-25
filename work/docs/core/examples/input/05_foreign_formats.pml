[ch (id=foreign_formats) [title Embedding Foreign Data/Markup Encodings]

    Since a PDML node can contain [i any] text (except Unicode control characters listed in [link (url="^[get core_spec_url]#invalid_characters") Invalid Characters]), you can embed data and markup encoded in foreign formats such as XML, JSON, and HTML:
    [code
        """
        [foreign_formats_examples
            [XML <rating>5/5</rating>]
            [JSON { "rating": "5/5" }]
            [HTML <p>Have a <i>great</i> day</p>]
        ]
        """
    ]

    Here, nodes [c XML], [c JSON], and [c HTML] are [i text] nodes containing data and markup encoded in foreign formats.
    For instance, node [c XML] contains the XML code [c <rating>5/5</rating>] embedded as PDML text.
    After parsing the PDML document, this XML code may be parsed by an XML parser.

    [note
        A more sophisticated and more efficient parsing technique (not elaborated here) would be to switch parsers at parse-time.
        In our example, a PDML parser would first be invoked, then the application would switch to an XML parser to parse [c <rating>5/5</rating>], then switch back to the PDML parser, then switch to a JSON parser to parse the JSON code, and so forth.
    ]

    You can also embed PDML code [i as text] in a PDML document, but then you must escape characters [c \[], [c \]], otherwise they would be parsed as node start and end symbol.
    For example, to store the markup [c \[p Have a \[i great\] day.\]] [i as text] in node [c markup_text], you must write:
    [code
        """
        [markup_text \[p Have a \[i great\] day.\]]
        """
    ]

    [note
        Frequent use of escape sequences increases error-proneness while reducing readability and writability.

        To address this issue, the [link (url="^[get extensions_url]#string_literals") String Literals] PDML extension (not part of Core PDML) provides alternative ways to encode text, eliminating the need for excessive escape sequences.
        For example, a quoted string literal allows you to rewrite the above code as follows:
        [code
            """
            [markup_text ^"[p Have a [i great] day.]"]
            """
        ]
    ]
]
