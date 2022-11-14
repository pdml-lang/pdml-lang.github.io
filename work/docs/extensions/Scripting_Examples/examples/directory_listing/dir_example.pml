[s:script
    ~~~
    const cmd = `@echo off
    dir C:\\temp`

    const dirResult = WinCmdUtils.getInstructionsOutput ( cmd, null, null );
    const escapedText = doc.escapeText ( dirResult )
    doc.insert ( `[monospace ${escapedText} ]` );
    ~~~
]
