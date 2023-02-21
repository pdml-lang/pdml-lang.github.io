[doc [- TODO (TOC_position=top) -] [title PDML Overview - FAQ]

    Author: Christian Neumanns

    Published: 2021-11-16

    [u:set pdml_website_url=https://pdml-lang.dev/]
    [u:set pdml_docs_url=[u:get pdml_website_url]docs/]

    [-
        [link (url=[u:get pdml_website_url]) back to website]
    -]

    [ch (id=what) [title What is PDML?]

        The [i Practical Data and Markup Language (PDML)] is a specification of a text format to store data and markup code.

        PDML is conceptually similar to XML, but PDML's syntax is less verbose, and there are other differences.

        A free, open-source reference implementation of a parser written in Java is available.
    ]

    [ch (id=why) [title Why PDML?]

        PDML's design goals are:
        [list
            [el human-friendly (simple, succinct syntax, easy to read and write for people)]
            [el suitable for data [i and] markup code]
            [el suitable for small [i and] big documents]
            [el unique, powerful extensions to make PDML more practical]
        ]
    ]

    [ch (id=comparison) [title How does PDML compare to other, popular formats?]

        In a nutshell:
        [list
            [el PDML is [i less verbose] than XML and JSON, and slightly more verbose than YAML.]
            
            [el Unlike JSON and YAML, PDML is suitable for [i markup code].]
            
            [el Unlike YAML, PDML is suitable for [i big, complex] data structures.]

            [el PDML has a number of unique, practical [i extensions] not found in XML, JSON, or YAML.]
            
            [el Core PDML (without extensions) is [i easier to parse] than XML, JSON, or YAML.]
        ]
        
        For a demonstration of these claims please read [link (url=[u:get pdml_docs_url]suggestion-for-better-xml-html/index.html) Suggestion For a Better XML/HTML Syntax].
    ]

    [ch (id=how) [title How does it work?]

        Here is a simple example of an XML document:
        [code
            ~~~
            <?xml version="1.0" encoding="UTF-8"?>
            <person>
                <name>
                    <first>Albert</first>
                    <last>Einstein</last>
                </name>
                <city>Bern</city>
                <country>Switzerland</country>
            </person>
            ~~~
        ]

        The same data structure looks like this in PDML:
        [code
            ~~~
            [person
                [name
                    [first Albert]
                    [last Einstein]
                ]
                [city Bern]
                [country Switzerland]
            ]
            ~~~
        ]

        More examples can be found in the article [link (url=[u:get pdml_docs_url]examples/index.html) PDML Examples].
    ]

    [ch (id=what_for) [title What can I do with PDML?]

        PDML can be used to store any kind of structured and unstructured data, including markup code. Data is stored in a human-readable text format (not binary format).
        
        For example, PDML can be used to store:
        [list
            [el maps (key/value pairs)]
            [el simple or complex configuration data]
            [el markup code (styled text, like HTML)]
            [el tables and databases]
            [el unstructured, heterogenous, or polymorphic data]
        ]
        Simple examples of each category are shown in the article [link (url=[u:get pdml_docs_url]examples/index.html) PDML Examples].

        PDML can be converted to XML, and XML to PDML. Hence, XML technology can be used with PDML documents. For example, you could programmatically validate, query, modify, or transform a document.

        The article [link (url=[u:get pdml_docs_url]open-source-parser-for-practical-xml/index.html) Open-Source Parser For PracticalXML (pXML)] shows how to do this.
    ]

    [ch (id=parser) [title Is there a parser available for PDML?]

        Yes. There is a free, open-source reference implementation written in Java. The source code is available on [link (url=https://github.com/pdml-lang/full-java-impl) Github].

        [-
            For more information please read: [link (url=[u:get pdml_docs_url]open-source-parser-for-practical-xml/index.html) Open-Source Parser For PracticalXML (pXML)].
        -]

        Parsers in other programming languages are welcomed to be published on this site.
    ]

    [ch (id=ide) [title Are there editor/IDE plugins for PDML?]

        The following plugins are available:
        [list
            [el
                [link (url=https://packagecontrol.io/packages/PDML) Sublime PDML] for the [link (url=https://www.sublimetext.com) Sublime Text] editor, created by [link (url=https://github.com/tajmone/) Tristano Ajmone] (work inprogress).
            ]
            [el
                [link (url=https://marketplace.visualstudio.com/items?itemName=shelby-landen.pdml) PDML Language Support] for the [link (url=https://code.visualstudio.com/) VS Code] editor, created by [link (url=https://github.com/slanden) Shelby Landen] (work inprogress).
            ]
        ]

        Other editor/IDE plugins are welcomed to be published on this site.
    ]


[-
    [ch [title How mature is PDML]

        The reference implementation is a work in progress, not ready yet for enterprise applications.
    ]
-]

    [ch (id=price) [title Do I have to pay to use PDML?]

        No. PDML is free of charge for everyone - no strings attached.
    ]

    [ch (id=license) [title Which license is used?]

        The [i PDML specification] is licensed under [link (url=https://creativecommons.org/licenses/by-nd/4.0/) CC BY-ND 4.0].

        The [i reference implementation] written in Java is licensed under [link (url=https://opensource.org/licenses/GPL-2.0) GPL 2.0].
    ]

    [ch (id=creator) [title Who created PDML?]
        
        [image source=images/christian_150_150.jpg]
        
        Hello. My name is Christian Neumanns, born in Luxembourg (Europe).
        I care about creating reliable and maintainable software that is useful and easy to use.
        
        Besides PDML, I created:
        [list
            [el the [link (url=https://www.pml-lang.dev) Practical Markup Language (PML)]: a markup language designed to create web articles and books. PML uses the PDML syntax. A free, open-source [i PML-to-HTML-Converter] converts PML to HTML.]
            [el the [link (url=https://www.ppl-lang.dev) Practical Programming Language (PPL)]: a programming language designed to create reliable and maintainable code. The [i PML-to-HTML-Converter] is written in PPL. PPL is not ready yet for enterprise applications.]
        ]

        You can have a look at my [link (url=https://www.ppl-lang.dev/blog/index.html) blog] or contact me at chris {at} pml-lang {dot} dev.
    ]
]
