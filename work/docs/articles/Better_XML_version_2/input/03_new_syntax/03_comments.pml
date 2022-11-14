[ch Comments

    An XML comment looks like this:
    [code
        <!-- text of comment -->
    code]

    We can simplify by using [c \[-] to start a comment, and [c -\]] to stop it. Here is the pXML version:
    [code
        [- text of comment -]
    code]

    There is no ambiguity with [c \[-] being the start of an element with name [c -] because, according to the [xref node_id=name_rules text=rules], an element name cannot start with a hyphen ([c -]).

    [i Nested] comments are often useful in practice. For example, it's common to comment a block of code that contains already a comment. Therefore pXML supports nested comments (unlike XML). Here is an example:
    [code
        [- text of outer comment
            [- text of inner comment -]
        -]
    code]

    [note
        Applications that convert pXML to XML code must be careful to not convert inner comments, because XML doesn't support nested comments. The above comment cannot be converted to:
        [code
            <!-- text of outer comment
                <!-- text of inner comment -->
            -->
        code]
        It should be converted to:
        [code
            <!-- text of outer comment
                [- text of inner comment -]
            -->
        code]
    ]
]
