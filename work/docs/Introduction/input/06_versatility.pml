[ch [title Versatility]

    Despite PDML's utmost simplicity, it can be used to store different kinds of data, such as:
    [list
        [el configuration files]
        [el database tables]
        [el markup code]
        [el unstructured, heterogenous, or polymorphic data]
    ]

    Examples are shown in the article [link url=[u:get pdml_docs_url]examples/index.html text="PDML Examples"].
    
    The PDML syntax is used in the [link url=https://www.pml-lang.dev/ text="Practical Markup Language (PML)"], the precursor of PDML (as explained later). For a real-world example of a PDML document you can have a look at the [link url=https://github.com/pdml-lang/basic-specification/ text="markup code"] of the PDML specification which is written in PML and uses the PDML syntax.

    PDML can be converted to XML, and XML to PDML. Hence, XML technology (which is well supported in many programming languages) can be used with PDML documents. For example you can read a PDML document into an XML DOM and:
    [list
        [el validate the document with [link url=https://www.w3schools.com/xml/schema_intro.asp text="XML Schema"]]
        [el query the document with [link url=https://www.w3schools.com/xml/xquery_intro.asp text="XML Query"]]
        [el change the document (add, remove, and modify nodes) and write a modified version back to XML or PDML]
        [el transform the document with [link url=https://www.w3schools.com/xml/xsl_intro.asp text="XSLT"]]
    ]

    Examples of how to do this in Java are shown in the article [link url=[u:get pdml_docs_url]open-source-parser-for-practical-xml/index.html text="Open-Source Parser For PracticalXML (pXML)"].
]