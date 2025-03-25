[ch (id=string) [title Strings]

    You can encode the string [c This is some arbitrary string] as follows:
    [caption File string_example.pdml]
    [code
        """
        [string This is some arbitrary string]
        """
    ]
    Here we define a node with [link (url="^[get core_spec_url]#tag_def") tag] [c string], containing the string [c This is some arbitrary string].
    The node starts with [c \[] (opening delimiter) and ends with  [c \]] (closing delimiter).
    The tag and content of the node are [link (url="^[get core_spec_url]#node_separator") separated] by a space.

    In JSON the code would look like this:
    [caption File string_example.json]
    [code
        """
        {"string": "This is some arbitrary string"}
        """
    ]

    You can use new lines and any other Unicode code points in strings, except control characters listed in [link (url="^[get core_spec_url]#invalid_characters") Invalid Characters].
    For example the text:
    [code
        """
        He said:
        "She said: 'All is well.'"
        😀
        """
    ]
    ... is encoded as follows:
    [code
        """
        [text He said:
        "She said: 'All is well.'"
        😀]
        """
    ]

    JSON version:
    [code
        """
        {"text": "He said:\n\"She said: 'All is well.'\"\n😀"}
        """
    ]
    [note
        If a JSON document is encoded in UTF-16 then you can't directly insert Unicode code points above [c U+FFFF].
        Instead, you must use [link (url="https://en.wikipedia.org/wiki/UTF-16#Code_points_from_U+010000_to_U+10FFFF") UTF-16 surrogate pairs].
        Hence, the smiley in the above example ([c U+1F600]) would need to be encoded as [c \\uD83D\\uDE00].
        
        PDML documents [i must] be [link (url=^[get core_spec_url]#encoding) encoded in UTF-8].
        Unicode surrogate pairs are therefore never used in PDML — they are a mechanism specific to UTF-16 encoding.
    ]

    Some characters [i must] be escaped, and some [i can] be escaped (see [link (url="^[get core_spec_url]#character_escape_sequences") Character Escape Sequences]).
    For example, the rule [c Characters \[, \], \^, and \\ must be escaped.] is encoded as follows:
    [code
        """
        [rule Characters \[, \], \^, and \\ must be escaped.]
        """
    ]
]
