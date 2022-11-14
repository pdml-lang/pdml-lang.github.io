[ch Summary And Conclusion

    As demonstrated, it [i is] possible to simplify the XML syntax and make it more accessible for humans.

    The pXML syntax introduced in this article essentially suggests three changes:
    [list
        [el
            Replace the XML syntax:
            [code
                <name>value</name>
            code]
            ... with:
            [code
                [name value]
            code]
        
            [image source=images/n_v.png width=400 html_alt=From XML to pXML]
        ]
        [el
            Embed attributes between parenthesis and allow unquoted values if possible.
            
            The XML code:
            [code
                name1="value" name2="value with spaces"
            code]
            ... becomes:
            [code
                (name1=value name2="value with spaces")
            code]
        ]
        [el
            Support for nested comments (not supported in XML)
        ]
    ]

    Although the pXML syntax is less verbose and different from XML, all great additions that are part of the XML ecosystem can still be used. Once a pXML document is parsed into an XML tree, documents can be validated, queried, modified, and transformed.
    
    Well-designed syntax increases productivity, reduces errors, eases maintenance, and improves space and time efficiency.

    Syntax matters!
]
