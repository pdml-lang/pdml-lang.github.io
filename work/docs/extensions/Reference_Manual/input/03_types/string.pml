[ch (id=string) [title [c string]]

    A [c t:string] type denotes a node that can only contain text.

    Text within the node must be escaped, as in a standard node.

    For example, this code:
    [code
        ~~~
        [t:string line \[1\]
            line 2
        line 3
        ]
        ~~~
    ]
    ... expands to:
    [code
        ~~~
        line [1]
            line 2
        line 3
        ~~~
    ]

    See also: [xref (ref_id=raw_text)].
]
