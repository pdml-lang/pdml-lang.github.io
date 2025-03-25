[ch (id=maps) [title Maps]

    Let's start with a simple, homogenous map (aka dictionary, associative array) that maps some digits to words:
    [code
        """
        [map
            [1 one]
            [2 two]
            [3 three]
        ]
        """
    ]

    Map values can be of any type.
    To provide the words in English, Italian, and Thai, we can use values that are maps:
    [code
        """
        [map
            [1
                [words
                    [en one]
                    [it uno]
                    [th หนึ่ง]
                ]
            ]
            [2
                [words
                    [en two]
                    [it due]
                    [th สอง]
                ]
            ]
            [3
                [words
                    [en three]
                    [it tre]
                    [th สาม]
                ]
            ]
        ]
        """
    ]

    In the above code we are using indents (i.e. insignificant whitespace) copiously to increase readability.
    However, you are free to use insignificant whitespace in whatever way best suits your needs.
    For example, you can write the above code in a more succinct way:
    [code
        """
        [map
            [1 [words [en one][it uno][th หนึ่ง]]]
            [2 [words [en two][it due][th สอง]]]
            [3 [words [en three][it tre][th สาม]]]
        ]
        """
    ]

    [note
        A PDML parser does not generate an error or warning if a map contains duplicate keys (see [link (url="^[get core_spec_url]#duplicate_tags") Duplicate Tags] for more information).
        Thus, no error/warning is generated when the following code is parsed — the error is (typically) reported later when the parsed AST is converted into a native map.
        [scode
            """
            \[map
                [b \[1 one\]]
                [b \[1 one\]]
                \[2 two\]
                \[3 three\]
            \]
            """
        ]
    ]

    Besides values, keys can also be of any type.
    However, if the keys aren't scalar values (they are records, lists, etc.) then the structure becomes a bit more complex, as you'll see in the next example.

    Moreover, a single map can contain keys of different types, as well as values of different types.
    Thus, maps can be heterogeneous.

    Below is a contrived example of a complex map with four entries:
    [list
        [el entry 1: a digit mapped to a word (as in the first example of this section)]
        [el entry 2: a record mapped to a list]
        [el entry 3: a list mapped to a map]
        [el entry 4: null mapped to null]
    ]
    [code
        """
        [crazy_map
            [entry
                [key 1]
                [value one]
            ]
            [entry
                [key
                    [record
                        [field_1 value_1]
                        [field_2 value_2]
                    ]
                ]
                [value
                    [names
                        [_ Tim]
                        [_ Tom]
                        [_ Tam]
                    ]
                ]
            ]
            [entry
                [key
                    [names
                        [_ Tim]
                        [_ Tom]
                        [_ Tam]
                    ]
                ]
                [value
                    [map
                        [1 one]
                        [2 two]
                        [3 three]
                    ]
                ]
            ]
            [entry
                [key]
                [value]
            ]
        ]
        """
    ]

    [note
        The above code shows the recommended way to encode maps containing non-scalar keys: each entry is represented by a node tagged [c entry] and containing child-nodes [c key] and [c value].
        However, nothing prevents you from structuring your map differently if you wish.
    ]

    An empty map is encoded like an empty list:
    [code
        """
        [map]
        """
    ]
]
