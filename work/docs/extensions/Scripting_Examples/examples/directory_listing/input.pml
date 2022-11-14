[doc [title Directory Listing]


    Simplest possible:

    [s:script
        ~~~
        var result = WinCmdUtils.getInstructionsOutput ( "dir", null, null );
        // stdout.writeLine ( result );
        doc.insertText ( result );
        ~~~
    ]

    Echo off

    [s:script
        ~~~
        const cmd = `@echo off
        dir`
        var result = WinCmdUtils.getInstructionsOutput ( cmd, null, null );
        doc.insertText ( result );
        ~~~
    ]

    Monospace:
    
    [u:ins_file path=dir_example.pml]

    [u:ins_file path=dir_example_one_liner.pml]

[- TODO
    Linux/Windows:

    [s:script
        ~~~
        var result;
        if ( OS.isWindows ) {
            result = WinCmdUtils.getInstructionsOutput ( "@echo off && dir ..\\config /b", null, null );
        } else {
            result = LinuxSh.getInstructionsOutput ( "ls ../config", null, null );
        }

        const escapedResult = doc.escapeText ( result )

        doc.insert ( `[monospace ${escapedResult} ]` );
        ~~~
    ]
-]

]
