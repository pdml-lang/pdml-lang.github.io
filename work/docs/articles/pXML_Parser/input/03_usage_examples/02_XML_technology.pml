[ch [title XML Technology Used With pXML]

    The most powerful feature of the pXML parser is its ability to read a pXML document into a standard [c org.w3c.dom.Document] Java object.

    Since we have a Java [c Document] object in memory we can use the whole set of XML extensions supported natively in Java or provided by third party libraries and frameworks. For example, we can:

    [list
        [el validate a document with XML Schema (W3C), RELAX NG, or Schematron]
        [el programmatically traverse the document and extract data]
        [el insert, modify, and delete elements and attributes, and save the result as a new XML or pXML document]
        [el query the document (search for values, compute aggregates, etc.) with XQuery/XPath]
        [el convert the document using an XSL transformer (e.g. create a differently structured XML or pXML document, create a plain text document, etc.)]
    ]

    We cannot cover everything in a single article, so let's just have a look at [i some] examples to see how it works.

    [ch [title Loading/Saving a 'Document']

        The key to using XML technology with pXML is method [c pXMLToXMLDocument] in class [c PXMLToXMLConverter]. This method reads a pXML document from any source (file, URL, string, etc.), and loads it into a standard Java [c org.w3c.dom.Document] object. The method's signature is:
        [code
            public static Document pXMLToXMLDocument (
                @NotNull Reader pXMLReader, Object pXMLResource ) throws Exception
        code]

        As shown, this method uses a Java [c Reader] to read pXML code, and returns a [c Document] object. Input argument [c pXMLResource] is just an optional argument used to include the resource's name in error messages (e.g. "Error in file foo/bar.pxml").

        If anything goes wrong, an exception is thrown.

        Once the data is loaded, we can do everything we could do with an XML document: validate, query, modify, transform, etc.

        The counterpart to method [c pXMLToXMLDocument] is [c XMLDocumentToPXML] in class [c XMLToPXMLConverter]. The method is defined as:
        [code
            public static void XMLDocumentToPXML (
                @NotNull Document XMLDocument, @NotNull Writer pXMLWriter ) throws Exception
        code]
        
        The method reads a standard Java [c Document] object and writes the pXML data to any Java [c Writer] (e.g. [c FileWriter], [c StringWriter], etc.).
    ]

    [ch [title Validation]

        A common way to validate XML data is to use an [link url=https://www.w3schools.com/xml/schema_intro.asp text="XML Schema"]. An XML schema is itself an XML document containing rules that must be respected by the XML data document.

        Here is a simple example of an XML document defining a list of books:
        [insert_code file=[!get local_examples_dir]/input/books.xml]
        [caption File input/books.xml]

        The same data, defined with pXML looks like this:
        [insert_code file=[!get local_examples_dir]/input/books.pxml]
        [caption File input/books.pxml]

        The above XML can be validated with this XML schema:
        [insert_code file=[!get local_examples_dir]/input/books.xsd]
        [caption File input/books.xsd]

        Because an XML Schema is itself a standard XML document, we can define the schema with pXML too, like this:
        [insert_code file=[!get local_examples_dir]/input/books.pxsd]
        [caption File input/books.pxsd]

        Hence, there are four possible combinations to validate data:
        [table_data
            Data Format	Schema Format
            -
            XML	XML
            XML	pXML
            pXML	XML
            pXML	pXML
        table_data]

        An example of each combination is included in the [link url=[!get Github_example_repo_main]/validator/XMLSchemaValidatorExamples.java text="examples repo"].

        Class [c dev.pxml.core.utilities.XMLSchemaValidator] provides static methods to validate data. For example, validating pXML data with a pXML schema document (e.g. validate [c books.pxml] with [c books.pxsd]) can be done with the following one-liner:
        [code
            XMLSchemaValidator.validatePXMLFileWithPXMLSchemaFile (
                new File ( "input/books.pxml" ),
                new File ( "input/books.pxsd" ) );
        code]

        An exception is thrown if the data is invalid. For example, if a book using tag [c ibn] instead of [c isbn], the following error is reported:
        [output
            Invalid content was found starting with element 'ibn'. One of '{isbn}' is expected.
        output]
    ]

    [ch [title Transformation]
        [link url=https://en.wikipedia.org/wiki/XML_transformation_language text="XML transformation"] is another very useful XML feature. It is used to transform an XML document to another document. The output document can be another XML document, an HTML document, or any other plain text document. The transformation process is described with a [i transformation language]. The most popular transformation language is [link url=https://en.wikipedia.org/wiki/XSLT text=XSLT], which is defined as an XML document.

        For example, let's re-use the books data from the previous 'validation' example.
        [insert_code file=[!get local_examples_dir]/input/books.pxml]
        [caption File input/books.pxml]

        Now we want to create an HTML document that displays the books in a table. We could use the following XSLT document, written in XML:
        [insert_code file=[!get local_examples_dir]/input/books.html.xslt]
        [caption File input/books.html.xslt]

        Because an XSLT document is itself an XML document, we can define it in pXML too:
        [insert_code file=[!get local_examples_dir]/input/books.html.pxslt]
        [caption File input/books.html.pxslt]

        Class [c dev.pxml.core.utilities.XSLTTransformer] provides static methods to transform data. For example, we can transform the above pXML books data with the above pXML XSLT document like this:
        [code
            XSLTTransformer.transformPXMLFileWithPXMLXSLTFile (
                new File ( "input/books.pxml" ),
                new File ( "input/books.pxslt" ),
                new File ( "output/books.html" ) );
        code]

        Executing the above statement creates file [c output/books.html] with this content:
        [insert_code file=[!get local_examples_dir]/output/books.html]

        The result in a web browser looks like this:
        [image source=images/book_table_in_browser.png width=600 border=yes html_alt="Book table in browser"]
    ]
]
