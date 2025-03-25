[ch (id=lists) [title Lists]

    You can encode a simple list of names as follows:
    [code
        """
        [names
            [name Tim]
            [name Tom]
            [name Tam]
        ]
        """
    ]

    Instead of tagging each element with [c name], you can also use tag [c _], which, by convention, is used whenever the tag is irrelevant (see [link (url=^[get core_spec_url]#anonymous_nodes) Anonymous Nodes]):
    [code
        """
        [names
            [_ Tim]
            [_ Tom]
            [_ Tam]
        ]
        """
    ]

    [note
        ^// TODO provide more specific link
        ^// [link (url=^[get extensions_url]) PDML extensions] provide other ways to encode simple lists (e.g. [c \[names Tim, Tom, Tam\]]), but they are not covered in this document.

        If each element in a list is a scalar value then you can also encode the list as a text node with elements separated by commas:
        [code
            """
            [names Tim, Tom, Tam]
            """
        ]
        However, if the elements themselves contain spaces, commas, and/or other special characters, then it might be required to use [link (url=^[get extensions_url]#string_literals) String Literals] (a PDML extension not covered here), e.g.:
        [code
            """
            [friends "Tim and Tom", "Tam, Tum"]
            """
        ]
        The idiomatic way to encode lists (using only Core PDML) is to use a separate node for each element, as shown in this section.
    ]

    You can also encode heterogenous lists (i.e. lists with elements of different types):
    [code
        """
        [list
            [string Lorem ipsum ...]
            [record
                [field_1 value_1]
                [field_2 value_2]
            ]
            [nested_list
                [_ Tim]
                [_ Tom]
                [_ Tam]
            ]
            [remark]
        ]
        """
    ]

    To encode an empty list (i.e. a list that doesn't contain elements) you use a [link (url="^[get core_spec_url]#tagged_leaf_node") tagged leaf node]:
    [code
        """
        [list]
        """
    ]
]
