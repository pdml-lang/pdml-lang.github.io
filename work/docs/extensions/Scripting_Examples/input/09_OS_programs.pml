[ch (id=executing_OS_programs) [title Executing OS Programs]

    The most powerful feature of script nodes is the ability to run external programs and OS scripts.
    A dedicated API makes it very easy to:
    [list
        [el run any installed program written in [i any] programming language]
        [el optionally provide command line arguments to the program]
        [el optionally provide a string that is the application's input, read from its standard input device (stdin)]
        [el optionally retrieve the application's output written to stdout (or to a file), and insert it into the PDML document, or do whatever else needs to be done with the application's output]
    ]

    Here are a few examples of what can be achieved, just to wet your appetite:
    [list
        [el Use your preferred programming language, or an existing tool, to fetch data from an Excel sheet, a server, a local/remote database, or a webservice, then transform the data to a summary table and insert the result into the PDML document.]
        [el Use Python to execute a deep learning algorithm and explore the result in the PDML document.]
        [el Use a media creator application to create image, audio, and video files, and insert links to them in the PDML document. For example: use [link (url=https://plantuml.com/) PlantUML] to insert diagrams, or [link (url=https://abcnotation.com/) abc notation] to insert music notes, or a text-to-speech application to insert audio files.]
        [el Use a source code highlighter that reads source code (or source code snippets) from a source code repository, and insert a highlighted version of the source code into the PDML document.]
        [el Execute a VB or OS script to send an email and add a log entry each time a new version of a document is published.]
    ]

    To illustrate how it works, let's use [link (url=https://plantuml.com/) PlantUML] to dynamically create diagrams and insert links to them into a [u:get PML_link] markup document.

    PlantUML is an open-source tool you can use to create many different kinds of diagrams from plain text languages.
    For example, this plain text:
    [u:set plantUML_example_dir=[u:get examples_dir]plantUML/]
    [insert_code file=[u:get plantUML_example_dir]resources/images/alice_bob.txt]
    ... generates the following sequence diagram:
    [image source=images/alice_bob.png]

    To create this image we could proceed as follows:
    [list
        [el
            Create file [c alice_bob.txt] with the following content:
            [caption File [c alice_bob.txt]]
            [insert_code file=[u:get plantUML_example_dir]resources/images/alice_bob.txt]
        ]

        [el
            Execute the following command in a terminal:
            [input
                ~~~
                java -jar plantuml.jar -i alice_bob.txt
                ~~~
            ]
            [note
                The above command requires Java to be installed on your system.
                Moreover file [link (url=https://sourceforge.net/projects/plantuml/files/plantuml.jar/download) plantuml.jar] must be in your working directory.
                
                PlantUML is not the easiest one to install, but it's worth the effort because of its versatility.

                For more information see [link (url=https://plantuml.com/command-line) Command line].
            ]
        ]

        [el
            File [c alice_bob.png] is created in your working directory:
            [image source=images/alice_bob.png]
        ]
    ]

    Now that we know the basics of PlantUML, let's see how we can use this in PML to dynamically generate many kinds of diagrams by just providing the appropriate text input.

    In PML we would use the following markup code to insert an image in a document:
    [code
        ~~~
        [image source=images/alice_bob.png]
        ~~~
    ]

    By default PML uses directory [c resources] to look for images. As we use path [c images/alice_bob.png] in the above markup code, the image file must be stored as [c resources/images/alice_bob.png].

    Hence, we need to create a script that:
    [list
        [el creates file [c resources/images/alice_bob.txt] with content provided in the document]
        [el executes PlantUML to create file [c resources/images/alice_bob.png]]
    ]

    Here is the code to achieve this:
    [insert_code file=[u:get plantUML_example_dir]config/scripting/alice_bob.def]
    As can be seen, we first create the input file with [link (url=[u:get PDML_ext_ref_manual_url]#fileUtils-writeText) fileUtils.writeText], and then we use [link (url=[u:get PDML_ext_ref_manual_url]#OSCommand-runAndWait) OSCommand.runAndWait] to execute PlantUML.

    The above script creates file [c resources/images/alice_bob.png], which can then be used like an ordinary image file with:
    [code
        ~~~
        [image source=images/alice_bob.png]
        ~~~
    ]

    A much better approach, useful if we need to create [i several] images, is to create a reusable [i function] that creates the image and insert it in the document with a call to [c doc.insert]:
    [insert_code file=[u:get plantUML_example_dir]config/scripting/PlantUMLUtils.def]

    Because this function might be useful in other documents, we can store it in a separate file named [c PlantUMLUtils.def].

    Then we can import the function with an [c u:ins_file] node and use it as follows:
    [code
        ~~~
        [u:ins_file path = config/scripting/PlantUMLUtils.def]
        
        [s:script insertPlantUMLImage ( "alice_bob_2", `@startuml
            Alice -> Bob: Hello
            Bob -> Alice: Hi
            @enduml` ); ]
        ~~~
    ]

    Besides state diagrams, PlantUML supports many other kinds of diagrams, such as mathematic formulas and mindmaps.

    [note
        To use AsciiMath you need to download some files, as explained in chapter "How is this working?" on [link (url=https://plantuml.com/ascii-math) this page].
    ]

    Here is a fully functioning example of a PML document, to give you a glimpse of what can be achieved:
    [caption File PlantUML_Demo.pml]
    [insert_code file=[u:get examples_dir]plantUML_2/PlantUML_Demo.pml]

    If [u:get PML_link] is installed on your system, you can execute the following command to create a HTML file in directory [c output]:
    [input
        ~~~
        pmlc PlantUML_Demo.pml
        ~~~
    ]

    Here is the result displayed in a browser:
    [image source = images/PlantUML_Demo.png width=500]

[-
    Executing PlantUML each time when a PML document is parsed takes time and can considerably slow down the PML converter.
    We could improve performance by writing directly to STDIN, instead of creating a text input file for PlantUML.
    In practice, images need only to be created once, and then again when we want to change them (by just modifying the PlantUML code in the document).
    Hence, we can provide a paramter to create the images only when needed.
    There are many ways to do this.
    One way would be to simply ask the user if the images should be created.
    This can be done by changing our [c s:def] node as follows:
    [insert_code file=[u:get examples_dir]plantUML/config/scripting/PlantUMLUtils_2.def]

    Now, ech time the PML converter is launched, the user is asked if the images should be created:
    [image]


    Another approach would be to 
-]
]
