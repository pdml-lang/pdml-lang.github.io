[ch (id=trees) [title Trees]

    Consider the following arithmetic expression:
    
    [c () (1 + 2) * (3 + 4 + 5)]
    
    We can represent this expression using an abstract syntax tree (AST):
    [image source=images/AST_example.png]

    You can encode this tree as follows:
    [code
        """
        [expression
            [op *
                [op +
                    [num 1]
                    [num 2]
                ]
                [op +
                    [num 3]
                    [num 4]
                    [num 5]
                ]
            ]
        ]
        """
    ]

    Here's the compact, less readable version:
    [code
        """
        [expression [op *[op +[num 1][num 2]][op +[num 3][num 4][num 5]]]]
        """
    ]
]
