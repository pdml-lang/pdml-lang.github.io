[ch Escape Rules id=node_escape_rules

    pXML uses the backslash ([c \\ ]) as escape character.

    Three characters must always be escaped in text:
    [table_data
        Character	Escape Token
        -
        [	\[
        ]	\]
        \	\\
    table_data]

    The following code shows how the text [c Watch out for <, >, ", ', &, \[, \], and \\ characters] must be escaped in XML and pXML:

    [code
        XML:  <note>Watch out for &lt;, &gt;, &quot;, &apos;, &amp;, [, ], and \ characters</note>
        
        pXML: [note Watch out for <, >, ", ', &, \[, \], and \\ characters]
    code]

    Any Unicode character can be inserted by using the [c \uhhhh] syntax commonly used in programming languages. For example the text:
    [code
        Hell\u006f
    code]
    is parsed as:
    [code
        Hello
    code]

    XML entities are currently not supported in pXML.

    In XML, [c "a &lt; 1"] is parsed as [c a < 1]. In pXML it is parsed as [c "a &lt; 1"]

    However, if a pXML document is converted to an XML document (or XML to pXML), the conversion automatically applies the correct escape rules. For example, the following pXML text:
    [code
        \[ <
    code]
    ... will be converted to the following XML text:
    [code
        [ &lt;
    code]
    ... and vice versa.
]
