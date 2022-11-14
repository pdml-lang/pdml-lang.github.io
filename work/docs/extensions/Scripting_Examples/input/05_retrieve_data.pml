[ch (id=retrieve_data) [title Retrieving Text And Data]

    In this chapter we'll see how to retrieve text and data from external resources, and then insert them into the document.

    Consider a versioned software application project.
    The application's documentation is composed of several [u:get PML_link] documents (note: PML uses the PDML syntax).
    Ech document displays the application's version number at the beginning of the document, like this:
    [code
        Version: 7.4.0
    code]
    Hence, each time a new version of the application is published, the version number must be updated manually in all documents.
    This is cumbersome and error-prone, again. It's also a clear violation of the important [link url=https://en.wikipedia.org/wiki/Don%27t_repeat_yourself text="Don't repeat yourself (DRY)"] principle.
    That is, unless we use script nodes.

    Script nodes allow us to automatically retrieve the version number from a single resource and insert it in the documents at parse-time.

    In the following chapter we'll see how to retrieve the version number from a variety of different resources.

    [ch [title File]

        Suppose the version number is stored in a file:
        [caption File version.txt]
        [code
            7.4.0
        code]

        To retrieve a file's text content we can use function [link url=[u:get PDML_ext_ref_manual_url]#fileUtils-readText text=fileUtils.readText].
        So we have to replace:
        [code
            Version: 7.4.0
        code]
        ... with:
        [code
            Version: [s:exp fileUtils.readText ( "path/to/application/version.txt" )]
        code]

        [note
            The file's path can be absolute or relative.
            If it's relative, it's relative to the current working directory.
        ]
    ]
    
    [ch [title URL]

        To retrieve the version number from a URL, we can write:
        [code
            Version: [s:exp URLUtils.readText ( "http://www.example.com/version.txt" )]
        code]
    ]
    
    [ch [title OS Environment Variable]

        The version number could also be retrieved from an environment variable of the operating system:
        [code
            Version: [s:exp OSEnvUtils.getVar ( "MY_APP_VERSION" )]
        code]
    ]
    
    [ch [title User Input]

        If the running application has a console, the version number can be asked in the console:
        [code
            Version: [s:exp OSConsole.askString ( "Please enter version number: " )]
        code]

        After the user has typed the version number, the console looks like this:
        [input
            Please enter version number: 7.4.0
        input]

        Alternatively, the version number can be asked in a GUI:
        [code
            Version: [s:exp GUIUtils.askString ( "Please enter version number: " )]
        code]
        
        A GUI dialog like the following one will be displayed:
        [image source = images/Version_GUI.png]

        [note
            Displaying GUI dialogs works even if the application is run as a command line application.
        ]
    ]
    
    [ch [title JSON document]

        Suppose we have a JSON config file like this:
        [caption File config.json]
        [insert_code file=[u:get examples_dir]get_data/config.json]

        We can retrieve the [c version] field from the config file and insert it in the document with a [c s:script] node:
        [code
            [s:script
                ~~~
                const JSONString = fileUtils.readText ( "config.json" );
                const JSONData = JSON.parse ( JSONString );
                const version = JSONData.version;
                doc.insertText ( `Version: ${version}` );
                ~~~
            ]
        code]

        Alternatively, we could write more compact, but slightly less readable code by using an expression:
        [code
            Version: [s:exp JSON.parse ( fileUtils.readText ( "config.json" ) ).version]
        code]
    ]
    
    [ch [title PDML document]

        TODO
    ]
    
    [ch [title XML document]

        TODO
    ]
    
    [ch [title External Program]

        Suppose that the version number is stored in a resource that would be difficult or impossible to access with Javascript.
        For example, the version number could be stored in a field of a database table, or in some source code file that must be parsed to retrieve the version number.

        In such cases we can write an external program (written in [i any] programming language) that retrieves the version number, and writes it to STDOUT, or to a file.
        Then, in the PDML document we just need to execute that program, get the version number from STDOUT, and insert it into the document.
        We can call [link url=[u:get PDML_ext_ref_manual_url]#OSCommand-textPipe text=OSCommand.textPipe] in a simple expression node to achieve this:
        [code
            Version: [s:exp OSCommand.textPipe ( \[ "path/to/my_app.exe", "--arg1", "foo" \], null )]
        code]

        To test this out on Windows, you could create file [c my_app.bat] with the following content:
        [insert_code file=[u:get examples_dir]get_data/my_app.bat]
        You can then execute that batch file with:
        [code
            Version: [s:exp OSCommand.textPipe ( \[ "my_app.bat" \], null )]
        code]
        ... which will expand to:
        [code
            Version: 7.4.0
        code]

        [note
            Characters [c \[] and [c \]] must be escaped in the above Javascript code.
            We can use an alternative syntax to eliminate the need for escaping in source code:
            [code
                Version: [s:exp
                    ~~~
                    OSCommand.textPipe ( [ "my_app.bat" ], null )
                    ~~~
                ]
            code]
            Please refer to chapter [link url=[u:get PDML_ext_user_manual_url]#script_nodes_syntax text=Syntax] for more information.
        ]

        A real-life example to demonstrate the power of executing external programs will be shown later in chapter [xref node_id=executing_OS_programs].
    ]
    
    [ch [title OS Script]

        Besides executing an external [i program], we can also execute an OS [i script] to retrieve the version number.
        The following code illustrate how to do this on Windows:
        [code
            Version: [s:exp WinCmdUtils.getInstructionsOutput ( "@echo off && echo 7.4.0", null, null )]
        code]
        This expands to:
        [code
            Version: 7.4.0
        code]

        More examples about running OS scripts on Windows or Linux will be shown in [xref node_id=executing_OS_scripts].
    ]
    
    [ch [title Command Line Argument]

        TODO
    ]
]
