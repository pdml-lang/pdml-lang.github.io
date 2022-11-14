[ch [title From pXML to XML And Back Again]

    To honor the 'p' in pXML ('p' stands for practical), we obviously need to be able to convert pXML to XML, and XML to pXML. This chapter shows examples of how to do this.

    [ch [title Hello World]

        [b From PXML to XML]

        The code below illustrates the simplest possible pXML document - an empty root element with name [c hello]:

        [insert_code file="[!get local_examples_dir]/input/hello.pxml"]

        To convert pXML to XML, there is a utility class [c PXMLToXMLConverter] in package [c dev.pxml.core.utilities]. This class contains method [c pXMLFileToXMLFile] with the following signature:
        [code
            public static void pXMLFileToXMLFile ( @NotNull File pXMLFile, @NotNull File XMLFile ) throws Exception
        code]

        The method is overloaded. The input parameters can be of type [c File] (as shown above), [c Path] or [c String].
        
        Suppose the above pXML [c \[hello\]] code is stored in file [c hello.pxml]. The following instruction converts [c hello.pxml] to [c hello.xml] :
        [code
            pXMLFileToXMLFile ( "hello.pxml", "hello.xml" );
        code]

        As expected, the resulting file [c hello.xml] contains the following code:

        [code
            <?xml version="1.0" encoding="UTF-8"?>
            <hello />
        code]

        A complete test suite with all source code examples used in this article is available in a [link url=[!get Github_example_repo] text="Github repo"]. That repo uses the Gradle build tool.

        The parser's Java API documentation is available on [link url=https://pxml-lang.github.io/docs/api/javadoc text="pXML's website"].

        If you want to try out the above example in your own environment, you can proceed as follows:
        [list
            [el
                If not done already, install Java version 11 or later.
            ]
            
            [el
                Create a Java application with the tool of your choice (e.g. Gradle, IntellijIdea, Eclipse), or just with raw Java.
            ]

            [el
                Visit pXML's [link url="https://pxml-lang.github.io/downloads" text=downloads] page, download the latest [c .jar] file, and add it as a dependency to your Java project.
            ]

            [el
                Adapt the main class so that it contains the following code:
                [code
                    package tests.pxml.hello;

                    import static dev.pxml.core.utilities.PXMLToXMLConverter.*;

                    public static void main ( String[] args ) {
                        
                        try {
                            pXMLFileToXMLFile ( "input/hello.pxml", "output/hello.xml" );
                        } catch ( Exception e ) {
                            e.printStackTrace();
                        }
                    }
                code]

                [note Adapt [c tests.pxml.hello], as well as the paths of the two files if necessary. Absolute and relative file paths are accepted. Relative file paths are relative to your working directory.]
            ]

            [el
                Create file [c input/hello.pxml] with [c \[hello\]] as content.
            ]

            [el
                Create directory [c output].
            ]

            [el
                Execute the application. 
            ]

            [el
                Open the resulting file [c output/hello.xml] in your editor to verify its content. 
            ]
        ]

        [b From XML to PXML]

        To convert from XML to pXML is easy too. It's done with method [c XMLFileToPXMLFile] in class [c dev.pxml.core.utilities.XMLToPXMLConverter]. Hence, the following two Java statements are required to convert an XML file into a pXML file:
        [code
            import static dev.pxml.core.utilities.XMLToPXMLConverter.*;

            XMLFileToPXMLFile ( "input/hello.xml", "output/hello.pxml" );
        code]
        Executing this code converts file [c input/hello.xml] with this content:
        [code
            <?xml version="1.0" encoding="UTF-8"?>
            <hello />
        code]
        ... into [c output/hello.pxml] with the following pXML code:
        [code
            [hello]
        code]

        [b Any Reader/Writer]

        As we have seen, methods [c pXMLFileToXMLFile] and [c XMLFileToPXMLFile] accept file paths as input/output arguments. If we want to read/write XML/pXML documents from/to other sources like URLs, strings, etc., we can:
        [list
            [el
                Use [c PXMLToXMLConverter.pipePXMLReaderToXMLWriter] to read [i any] pXML source ([c URL], [c File], [c String], etc.) and write to [i any] XML destination ([c URL], [c File], [c String], etc.). For example we could read pXML code from a URL and store the resulting XML code as a string.

                This is possible because [c pipePXMLReaderToXMLWriter] takes a standard [c java.io.Reader] to read pXML, and a [c java.io.Writer] to write XML.
            ]
            [el
                Analogously, [c XMLToPXMLConverter.pipeXMLReaderToPXMLWriter] can be used to read [i any] XML source and write the result to [i any] pXML destination.
            ]
        ]
    ]

    [ch [title Login Form]

        Let's create a more useful example showing some commonly used XML features.

        We will convert pXML code to XML, and then convert the resulting XML back to pXML. If everything works fine, the final pXML code must be the same as the initial one.

        [b From PXML to XML]

        Here is a pXML document using nested elements, attributes, comments, and name spaces:
        [insert_code file="[!get local_examples_dir]/input/login_form.pxml"]
        [caption File input/login_form.pxml]

        As seen before, we can convert this file to [c output/login_form.xml] with:
        [code
            pXMLFileToXMLFile ( "input/login_form.pxml", "output/login_form.xml" );
        code]

        After executing the above statement, the content of [c output/login_form.xml] is:
        [insert_code file="[!get local_examples_dir]/output/login_form.xml"]
        [caption File output/login_form.xml]

        The following syntax differences can be observed:
        [list
            [el
                [code
                    pXML: [title Login]
                    XML:  <title>Login</title>
                code]
                This illustrates the most important difference between pXML and XML, as explained in [link url=https://pxml-lang.github.io/docs/articles/suggestion-for-better-xml-html/index.html text="Suggestion For a Better XML/HTML Syntax"]
            ]

            [el
                [code
                    pXML: [note Characters \[, \], < and > are not allowed]
                    XML:  <note>Characters [, ], &lt; and &gt; are not allowed</note>
                code]
                Here we can see how the escape rules of both dialects are applied during the conversion. pXML uses [c \\ ] as escape character (like most programming languages), while XML uses entities.
            ]

            [el
                [code
                    pXML: [- Two text fields: user and password -]
                    XML:  <!-- Two text fields: user and password -->
                code]
                Example of converting a comment.
            ]

            [el
                [code
                    pXML: [text_entry (id=user) User]
                    XML:  <text_entry id="user">User</text_entry>
                code]
                Example of converting an attribute.

                Note the space after [c )] in the pXML code, which does not appear in the resulting XML. The pXML parser allows an optional space after [c )] which is ignored. This allows to write:
                [code
                    [text_entry (id=user) User]
                code]
                .. instead of:
                [code
                    [text_entry (id=user)User]
                code]
                ... which is a bit less readable (but still valid pXML code).

                Writing:
                [code
                    [text_entry(id=user)User]
                code]
                ... would also be parsed correctly.
            ]

            [el
                [code
                    pXML: [ch:checks (xmlns:ch="http://www.example.com")
                              [ch:check user.size >= 2]
                    
                    XML:  <ch:checks xmlns:ch="http://www.example.com">
                              <ch:check>user.size &gt;= 2</ch:check>
                code]
                XML namespaces are supported in the pXML parser.
            ]

        ]

        [b From XML to PXML]

        After copying the result file [c output/login_form.xml] to [c input/login_form.xml] we can convert back from XML to pXML with:
        [code
            XMLFileToPXMLFile ( "input/login_form.xml", "output/login_form.pxml" );
        code]
        Here is the content of [c output/login_form.pxml]:
        [insert_code file="[!get local_examples_dir]/output/login_form.pxml"]
        [caption File output/login_form.pxml]

        As we can see, the content is the same as the content of our initial file [c input/login_form.pxml].
        
        However, there is one small [i syntax] difference - a difference that does not change the [i data] stored in both files. In the new file, quotes are always used to surround attribute values, even if they could be omitted (e.g. [c id="user"] instead of [c id=user]). The reason is that, by default, the pXML writer used in this example always encloses attribute values with quotes. It does not check if the value is allowed to be written without quotes, as that would reduce performance. In a future version of the writer, a parameter could be added to tell the writer to omit quotes if possible.
    ]

[-
    [ch Real-Life Test

        A useful test would be to take a big, real-life HTML file, convert it to pXML, then convert it back to XML/HTML. If the conversion is successful, then the original content should be displayed when we open the final result file in a browser.

        I tried this with the HTML code of the original version of this article.
    ]
-]
]
