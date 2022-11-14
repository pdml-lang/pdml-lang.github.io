[ch Implementation

    After using the PML syntax for some time to create real articles (not just tests), I was somewhat confident that the pXML syntax should work well for XML documents too. However, to eliminate doubts, I wanted a [i proof of concept] for pXML, before publishing this article. Therefore, I created a parser that reads the pXML syntax presented in this article. The parser is written in Java and has no dependencies. I will open-source it.
    
    The following features are currently implemented:

    [list
        [el Convert pXML into XML (pXML/XML escape rules are applied)]
        [el Convert XML into pXML (pXML/XML escape rules are applied)]
        [el
            Read a pXML document into an [c org.w3c.dom.Document] Java object.

            This is the most powerful feature. Since we have a Java [c Document] object we can use all of XML's [link url=https://en.wikipedia.org/wiki/XML#Related_specifications text=related specifications] with a pXML document. A few examples are:

            [list
                [el validate a document with XML Schema (W3C), RELAX NG, or Schematron]
                [el programmatically traverse the document]
                [el insert, modify, and delete elements and attributes, and save the result as a new XML or pXML document]
                [el query the document (search for values, compute aggregates, etc.) with XQuery/XPath]
                [el convert the document using an XSL transformer (e.g. create a differently structured XML document, create a plain text document, etc.)]
            ]
        ]
    ]

    Here is a "Hello World" example of a pXML to XML conversion:
    [list
        [el
            Suppose we created file [c hello.pxml] with this content (an empty root element with name [c hello]):
            [code
                [hello]
            code]
        ]
        [el
            The following Java code converts this pXML file into an XML file named [c hello.xml]:
            [input
                PXMLToXMLConverter.PXMLFileToXMLFile ( new File("hello.pxml"), new File("hello.xml") );
            input]
        ]
        [el
            The resulting [c hello.xml] file looks like this:
            [code
                <?xml version="1.0" encoding="UTF-8"?>
                <hello />            
            code]
        ]
    ]

    The opposite (i.e. converting an XML file to a pXML file) can be done with:
    [input
        XMLToPXMLConverter.XMLFileToPXMLFile ( new File("hello.xml"), new File("hello.pxml") );
    input]

    Once the pXML parser is ready to be open-sourced (planned for May 2021), I'll publish a dedicated article with more examples.

    I'm also working on a dedicated pXML website with a syntax specification and the grammar expressed in EBNF and railroad diagrams. Everybody is very welcome to participate in an open-source project.
]
