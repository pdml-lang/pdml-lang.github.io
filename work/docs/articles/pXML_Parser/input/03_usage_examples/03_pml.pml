[ch [title Using XML technology with PML]

    Chapter [link url=https://pxml-lang.github.io/docs/articles/suggestion-for-better-xml-html/index.html#ch__21 text="pXML Predecessor"] in a previous article explains that the pXML syntax originated from the [link url=https://www.pml-lang.dev/ text="Practical Markup Language (PML)"]. PML is a markup language designed to create web articles and books.
    
    Now we can say that PML uses the pXML syntax. It also supports [link url=https://pxml-lang.github.io/docs/articles/suggestion-for-better-xml-html/index.html#lenient_PML text="lenient parsing"], but internally the AST is stored in pXML format. In the future, the pXML parser described in this article will be used in PML. Hence, all XML technology illustrated in the previous chapter can then be used with PML documents.
    
    For example, one could:
    [list
        [el use XQuery to extract all links in a PML document]
        [el use an XML transformer to save all links in a CSV file that can be read by a tool (written in any language) to check for broken links.]
        [el create filters that consume the AST created by the PML parser, and then transform the AST (add/remove/change nodes) before letting PML produce the HTML output.]
    ]

    One can easily imagine all kinds of useful PML extensions users will be able create and share.
]
