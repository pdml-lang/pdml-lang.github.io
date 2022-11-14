
[ch (id=doc) [title Object [c doc]]
    [p [verbatim Functions to work with the currently parsed PDML document.]]

    [ch (id=doc-insert) [title Function [c insert]]
        [p [verbatim Insert a string into the document, at the current position.]]
        [p Input:]
        [list
            [el [c string String]: [verbatim The string to be inserted. The string can be PDML code or text that is escaped already.]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an IO error occurs.]]
        ]
    ]

    [ch (id=doc-insertText) [title Function [c insertText]]
        [p [verbatim Insert text into the document, at the current position.

 Note: Use function 'insert' to insert PDML code, or text that is escaped already.]]
        [p Input:]
        [list
            [el [c text String]: [verbatim The text to be inserted.

 The text is escaped automatically by this function.
 Hence, the text should not be escaped already, to avoid double-escaping.]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an IO error occurs.]]
        ]
    ]

    [ch (id=doc-insertLine) [title Function [c insertLine]]
        [p [verbatim Insert a string, followed by an OS-dependant new line, into the document, at the current position.]]
        [p Input:]
        [list
            [el [c string String]: [verbatim The string to be inserted. The string can be PDML code or text that is escaped already.]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an IO error occurs.]]
        ]
    ]

    [ch (id=doc-insertTextLine) [title Function [c insertTextLine]]
        [p [verbatim Insert text, followed by an OS-dependant new line, into the document, at the current position.

 Note: Use function 'insertLine' to insert PDML code, or text that is escaped already.]]
        [p Input:]
        [list
            [el [c text String]: [verbatim The text to be inserted.

 The text is escaped automatically by this function.
 Hence, the text should not be escaped already, to avoid double-escaping.]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an IO error occurs.]]
        ]
    ]

    [ch (id=doc-insertNewLine) [title Function [c insertNewLine]]
        [p [verbatim Insert an OS-dependant new line (LF on Linux; CRLF on Windows) into the document, at the current position.]]
        [p Input: none]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an IO error occurs.]]
        ]
    ]

    [ch (id=doc-escapeText) [title Function [c escapeText]]
        [p [verbatim Escape text.]]
        [p Input:]
        [list
            [el [c text String]: [verbatim The text to be escaped.]]
        ]
        [p Output:]
        [list
            [el [c String]: [verbatim Escaped text.]]
        ]
    ]

    [ch (id=doc-insertOSCommandOutput) [title Function [c insertOSCommandOutput]]
        [p [verbatim Execute an OS command, and insert the command's output (written to stdout) into the document, at the current position.]]
        [p Input:]
        [list
            [el [c OSCommandTokens String\[\]]: [verbatim An array of command tokens.
 The first token is the program name.
 Remaining tokens are command line arguments.
 Example: "program_name" "--arg1" "value1" "--arg2" "value2"]]
            [el [c input String or null]: [verbatim The input string that will be fed into the command's standard input device (stdin).
 Use 'null' if no input is needed by the command.]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an IO error occurs.]]
            [el [c InterruptedException]: [verbatim Thrown if the command is interrupted.]]
        ]
    ]
]
