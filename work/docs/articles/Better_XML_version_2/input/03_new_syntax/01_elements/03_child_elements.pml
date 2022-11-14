[ch Child Elements

    An XML element can optionally contain one or more child elements. They are embedded within the opening and closing tags. Here is an example:
    [code
        <table>
            <tr><td>Cell 1.1</td><td>Cell 1.2</td></tr>
            <tr><td>Cell 2.1</td><td>Cell 2.2</td></tr>
        </table>
    code]

    There is no reason to change this in pXML. The above example is written like this:
    [code
        [table
            [tr [td Cell 1.1][td Cell 1.2]]
            [tr [td Cell 2.1][td Cell 2.2]]
        ]
    code]
]
