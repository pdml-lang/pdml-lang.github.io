[ch (id=databases) [title Databases]

    A database is a set of tables.

    Here's a database containing tables [c customers], [c suppliers], and [c products]:
    [code
        """
        [mini_ERP_database
            [customers
                [customer ...]
                [customer ...]
                [customer ...]
            ]
            [suppliers
                [supplier ...]
                [supplier ...]
            ]
            [products
                [product ...]
                [product ...]
                [product ...]
                [product ...]
            ]
        ]
        """
    ]

    [note
        PDML is [i not] a replacement for "real" databases like MySQL, SQL Server, and PostgreSQL.
    ]
]
