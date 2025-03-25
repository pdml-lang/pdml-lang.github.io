[ch (id=scalars) [title Scalar Values]
    
    You can encode any scalar value (number, boolean, enum, date, etc.) by inserting it's string representation in the PDML document:
    [code
        """
        [scalar_values
            [string This is some arbitrary string]
            [number 123.45]
            [boolean true]
            [quality_enum excellent]
            [date 2025-01-14]
            [URL http://www.pdml-lang.dev]
            [file_path path/to/file.txt]
        ]
        """
    ]
    JSON version:
    [code
        """
        {
            scalar_values: {
                "string": "This is some arbitrary string",
                "number": 123.45,
                "boolean": true,
                "quality_enum": "excellent",
                "date": "2025-01-14",
                "URL": "http://www.pdml-lang.dev",
                "file_path": "path/to/file.txt"
            }
        }
        """
    ]

    [note
        Unlike JSON and like XML, Core PDML does not specify a special syntax for numbers and booleans.
        That's a deliberate choice for reasons not explained here.
        All scalar values are encoded as plain text, using their string representation.
        
        Support for converting scalar values encoded as strings into native types (e.g. [c int32]) may be provided in a PDML implementation.
        For example, the [link (url="https://github.com/pdml-lang/full-pdml-impl") PDML reference implementation] provides convenience methods for converting PDML AST nodes into commonly used native types.
    ]
]
