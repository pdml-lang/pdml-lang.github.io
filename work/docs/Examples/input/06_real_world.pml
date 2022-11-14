[ch (id=real_world_examples) [title Real World Examples]

    [ch (id=config_file) [title Config File]

        Consider the following JSON config file used to define a database connection:
        [caption File config.json]
        [code
            {
                "DB_config": {
                    "provider": "MySQL",
                    "host": "localhost",
                    "port": "3306",
                    "database_name": "bookstore",
                    "credentials": {
                        "user": "Bob",
                        "password": null
                    },
                    "cache": false
                }
            }
        code]

        In PDML the file looks like this:
        [caption File config.pdml]
        [code
            [DB_config
                [provider MySQL]
                [host localhost]
                [port 3306]
                [database_name bookstore]
                [credentials
                    [user Bob]
                    [password]
                ]
                [cache false]
            ]
        code]
    ]

    [ch (id=table_data) [title Table Data]

        Say we have the following XML document to store a list of books:
        [code
            <?xml version="1.0" encoding="UTF-8"?>
            <books>
                <book>
                    <isbn>978-0135957059</isbn>
                    <title>The Pragmatic Programmer: Your Journey to Mastery</title>
                    <price>41.41</price>
                </book>
                <book>
                    <isbn>978-0735619678</isbn>
                    <title>Code Complete: A Practical Handbook of Software Construction</title>
                    <price>45.32</price>
                </book>
                <book>
                    <isbn>978-0134685991</isbn>
                    <title>Effective Java</title>
                    <price>44.10</price>
                </book>
            </books>
        code]

        Here are the same data stored in PDML:
        [code
            [books
                [book
                    [isbn 978-0135957059]
                    [title The Pragmatic Programmer: Your Journey to Mastery]
                    [price 41.41]
                ]
                [book
                    [isbn 978-0735619678]
                    [title Code Complete: A Practical Handbook of Software Construction]
                    [price 45.32]
                ]
                [book
                    [isbn 978-0134685991]
                    [title Effective Java]
                    [price 44.10]
                ]
            ]
        code]
    ]

    [ch (id=database) [title Database]

        Sometimes it makes sense to use text files (instead of a powerful database engine) to store simple, small databases. Each table could be stored in a separate file, or a single file could be used to store all tables. Text files are also useful to export data.
        
        The following code illustrates a small database stored in PDML format:

        [code
            [mini_ERP_data
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
        code]
    ]

    [ch (id=markup_code) [title Markup Code]

        [link url=https://www.pml-lang.dev/ text=PML] is a markup language that uses PDML's basic syntax and extensions.

        This document is written in PML. You can have a look at its [link url=https://github.com/pdml-lang/examples-article text="PML markup code"].

        Here is an excerpt showing the markup code for this chapter:

        [code
            ===
            [ch [title Markup Code]

                [link url=https://www.pml-lang.dev/ text=PML] is a markup language that uses PDML's basic syntax and extensions.

                This document is written in PML. You can have a look at its [link url=https://github.com/pdml-lang/examples-article text="PML markup code"].

                Here is an excerpt showing the markup code for this chapter:

                [code
                    ...
                ]
            ]
            ===
        ]
    ]

    [ch (id=ast) [title AST]

        Every PDML document is a tree of data. Hence all kinds of structured and unstructured data can be stored.

        An example would be an abstract syntax tree (AST). Suppose we want to represent the arithmetic expression
        
        [c() (1 + 2) * (3 + 4 + 5)]

        This can be done with the following PDML code:
        [code
            [exp
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
        code]

        If the code doesn't need to be read by humans, it can be written more succinctly, without indents:
        [code
            [exp[op *[op +[num 1][num 2]][op +[num 3][num 4][num 5]]]]
        code]
    ]
]
