[ch Simple Element

    Let's start with the following HTML snippet - a simple element that contains only text:
    [code
        <i>foo</i>
    code]
    
    The first thing we need to do is to get rid of the closing tag syntax ([c </i>]) - the biggest culprit of XML's verbosity. We can do this by just closing the element with [c >], like this:
    [code
        <i>foo>
    code]

    This creates an imbalance of [c <] and [c >] symbols. But that's easy to fix. We replace the [c >] in the opening tag with a space - the easiest character to read and write on any keyboard. The code becomes:
    [code
        <i foo>
    code]

    Let's think about the brackets. We could use [c <>], as in XML/HTML.
    But there are other options: [c \[\]], [c {}], and [c ()].
    We need to consider two points:
    [list
        [el
            How easy are they to type?
            
            [c \[\]] clearly wins, because on most keyboards (including Dvorak keyboards) all other brackets require the [c Shift] key to be hold down.
        ]
        [el
            How often do they occur in normal text?

            This is important because the brackets have to be escaped in normal text. I didn't find any reliable statistics, but my guess would be that [c ()] is used often, while the others are used rarely, maybe in this order: [c {}], [c \[\]], and [c <>].
        ]
    ]
    The best option is to use [c \[\]], because this pair is easy to write (no need for [c Shift] on most keyboards), and square brackets rarely occur in normal text. Moreover, it creates a clear distinction between the new pXML syntax ([c \[\]]), XML/HTML ([c <>]), and source code (which often uses [c {}]).

    Hence, the final pXML code becomes:
    [code
        [i foo]
    code]
    ... which is easier to read and write than:
    [code
        <i>foo</i>
    code]

    Another advantage of the new syntax is that bracket matching in text editors (available in most modern versions) becomes more useful. For XML/HTML, the [c <] of the opening tag matches only the [c >] of the [i opening] tag, which is of little use. In VSCode it looks like this:
    [image source=images/bracket_matching_XML.png border=yes align=left width=120 html_alt=XML bracket matching in VSCode]
    
    In pXML the [c \[] of the opening tag matches the [c \]] of the [i closing] tag, which is much more helpful, especially in case of elements with lots of nested content. VSCode example:
    [image source=images/bracket_matching_PXML.png border=yes align=left width=120 html_alt=pXML bracket matching in VSCode]
]
