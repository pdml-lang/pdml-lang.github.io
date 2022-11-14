
[ch (id=fileUtils) [title Object [c fileUtils]]
    [p [verbatim Functions to work with files.
 Text files are supposed to be encoded in UTF8]]

    [ch (id=fileUtils-writeText) [title Function [c writeText]]
        [p [verbatim Write UTF8-encoded text into a file.

 If the file exists already, it is overwritten.
 If the file doesn't exist yet, it is created.]]
        [p Input:]
        [list
            [el [c path String]: [verbatim The absolute or relative-to-the-working-directory path of the file.]]
            [el [c text String]: [verbatim The text to be stored in the file.]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an error occurs while writing to the file.]]
        ]
    ]

    [ch (id=fileUtils-readText) [title Function [c readText]]
        [p [verbatim Read the text stored in a UTF8-encoded text file.]]
        [p Input:]
        [list
            [el [c path String]: [verbatim The absolute or relative-to-the-working-directory path of the file to read.]]
        ]
        [p Output:]
        [list
            [el [c String or null]: [verbatim The text stored in the file, or ,<code>,null,</code>, if the file is empty.]]
        ]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an error occurs while reading the file (e.g. file does not exist).]]
        ]
    ]

    [ch (id=fileUtils-readLines) [title Function [c readLines]]
        [p [verbatim Read the lines stored in a UTF8-encoded text file.]]
        [p Input:]
        [list
            [el [c path String]: [verbatim The absolute or relative-to-the-working-directory path of the file to read.]]
        ]
        [p Output:]
        [list
            [el [c List<String> or null]: [verbatim The list of lines stored in the text file, or ,<code>,null,</code>, if the file is empty.
 Empty lines are represented as empty strings in the list.]]
        ]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an error occurs while reading the file (e.g. file does not exist).]]
        ]
    ]

    [ch (id=fileUtils-exists) [title Function [c exists]]
        [p [verbatim Check if a file exists]]
        [p Input:]
        [list
            [el [c path String]: [verbatim The absolute or relative-to-the-working-directory path of the file to check.]]
        ]
        [p Output:]
        [list
            [el [c boolean]: [verbatim 'true' if the file exists, 'false' if the file does not exist.]]
        ]
        [p Throws:]
        [list
            [el [c IOException]: [verbatim Thrown if an error occurs while acessing the file.]]
        ]
    ]
]

[ch (id=GUIUtils) [title Object [c GUIUtils]]

    [ch (id=GUIUtils-showInfo) [title Function [c showInfo]]
        [p Input:]
        [list
            [el [c info String]]
        ]
        [p Output: none]
    ]

    [ch (id=GUIUtils-showInfoWithTitle) [title Function [c showInfoWithTitle]]
        [p Input:]
        [list
            [el [c info String]]
            [el [c title String or null]]
        ]
        [p Output: none]
    ]

    [ch (id=GUIUtils-showWarning) [title Function [c showWarning]]
        [p Input:]
        [list
            [el [c warning String]]
        ]
        [p Output: none]
    ]

    [ch (id=GUIUtils-showWarningWithTitle) [title Function [c showWarningWithTitle]]
        [p Input:]
        [list
            [el [c warning String]]
            [el [c title String or null]]
        ]
        [p Output: none]
    ]

    [ch (id=GUIUtils-showError) [title Function [c showError]]
        [p Input:]
        [list
            [el [c error String]]
        ]
        [p Output: none]
    ]

    [ch (id=GUIUtils-showErrorWithTitle) [title Function [c showErrorWithTitle]]
        [p Input:]
        [list
            [el [c error String]]
            [el [c title String or null]]
        ]
        [p Output: none]
    ]

    [ch (id=GUIUtils-askString) [title Function [c askString]]
        [p Input:]
        [list
            [el [c message String]]
        ]
        [p Output:]
        [list
            [el [c String or null]]
        ]
    ]

    [ch (id=GUIUtils-askStringWithTitle) [title Function [c askStringWithTitle]]
        [p Input:]
        [list
            [el [c message String]]
            [el [c title String or null]]
        ]
        [p Output:]
        [list
            [el [c String or null]]
        ]
    ]

    [ch (id=GUIUtils-askYesNo) [title Function [c askYesNo]]
        [p Input:]
        [list
            [el [c question String]]
        ]
        [p Output:]
        [list
            [el [c Boolean or null]]
        ]
    ]

    [ch (id=GUIUtils-askYesNoWithTitle) [title Function [c askYesNoWithTitle]]
        [p Input:]
        [list
            [el [c question String]]
            [el [c title String or null]]
        ]
        [p Output:]
        [list
            [el [c Boolean or null]]
        ]
    ]

    [ch (id=GUIUtils-openFile) [title Function [c openFile]]
        [p Input:]
        [list
            [el [c filePath String]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]]
        ]
    ]
]

[ch (id=numberUtils) [title Object [c numberUtils]]
    [p [verbatim Utility functions to work with numbers.]]

    [ch (id=numberUtils-formatFloat) [title Function [c formatFloat]]
        [p [verbatim Format and round a floating point number.]]
        [p Input:]
        [list
            [el [c number double]: [verbatim The floating point number to be formatted.]]
            [el [c format String]: [verbatim The format to apply.
 Please refer to https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/text/DecimalFormat.html for more information.]]
        ]
        [p Output:]
        [list
            [el [c String]: [verbatim A string representing the formatted and rounded floating point number.]]
        ]
    ]
]

[ch (id=OSCommand) [title Object [c OSCommand]]

    [ch (id=OSCommand-runAndWait) [title Function [c runAndWait]]
        [p Input:]
        [list
            [el [c OSCommandTokens String\[\]]]
        ]
        [p Output:]
        [list
            [el [c int]]
        ]
        [p Throws:]
        [list
            [el [c IOException]]
            [el [c InterruptedException]]
        ]
    ]

    [ch (id=OSCommand-startAndContinue) [title Function [c startAndContinue]]
        [p Input:]
        [list
            [el [c OSCommandTokens String\[\]]]
        ]
        [p Output: none]
        [p Throws:]
        [list
            [el [c IOException]]
        ]
    ]

    [ch (id=OSCommand-textPipe) [title Function [c textPipe]]
        [p Input:]
        [list
            [el [c OSCommandTokens String\[\]]]
            [el [c input String or null]]
        ]
        [p Output:]
        [list
            [el [c String]]
        ]
        [p Throws:]
        [list
            [el [c IOException]]
            [el [c InterruptedException]]
        ]
    ]
]

[ch (id=OSConfig) [title Object [c OSConfig]]

    [ch (id=OSConfig-OSName) [title Function [c OSName]]
        [p [verbatim Get the name of the current operating system.]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String]: [verbatim The name of the current operating system.]]
        ]
    ]

    [ch (id=OSConfig-isWindows) [title Function [c isWindows]]
        [p [verbatim Check if the current operating system is Windows.]]
        [p Input: none]
        [p Output:]
        [list
            [el [c boolean]: [verbatim 'true' if the current operating system is Windows, otherwise returns 'false '.]]
        ]
    ]

    [ch (id=OSConfig-newLine) [title Function [c newLine]]
        [p [verbatim Get the new line used on the current operating system.]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String]: [verbatim A string representing a new line (LF on Unix/Linux; CRLF on Windows).]]
        ]
    ]
]

[ch (id=OSConsole) [title Object [c OSConsole]]

    [ch (id=OSConsole-askString) [title Function [c askString]]
        [p Input:]
        [list
            [el [c message String]]
        ]
        [p Output:]
        [list
            [el [c String or null]]
        ]
    ]
]

[ch (id=OSEnvUtils) [title Object [c OSEnvUtils]]

    [ch (id=OSEnvUtils-getVarOrNull) [title Function [c getVarOrNull]]
        [p Input:]
        [list
            [el [c varName String]]
        ]
        [p Output:]
        [list
            [el [c String or null]]
        ]
    ]

    [ch (id=OSEnvUtils-getVarOrDefault) [title Function [c getVarOrDefault]]
        [p Input:]
        [list
            [el [c varName String]]
            [el [c defaultValue String]]
        ]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]

    [ch (id=OSEnvUtils-getVar) [title Function [c getVar]]
        [p Input:]
        [list
            [el [c varName String]]
        ]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]
]

[ch (id=stderr) [title Object [c stderr]]

    [ch (id=stderr-write) [title Function [c write]]
        [p Input:]
        [list
            [el [c string String]]
        ]
        [p Output: none]
    ]

    [ch (id=stderr-writeLine) [title Function [c writeLine]]
        [p Input:]
        [list
            [el [c string String]]
        ]
        [p Output: none]
    ]

    [ch (id=stderr-writeNewLine) [title Function [c writeNewLine]]
        [p Input: none]
        [p Output: none]
    ]
]

[ch (id=stdin) [title Object [c stdin]]

    [ch (id=stdin-readInt) [title Function [c readInt]]
        [p Input: none]
        [p Output:]
        [list
            [el [c int]]
        ]
        [p Throws:]
        [list
            [el [c IOException]]
        ]
    ]

    [ch (id=stdin-readLine) [title Function [c readLine]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String or null]]
        ]
        [p Throws:]
        [list
            [el [c IOException]]
        ]
    ]

    [ch (id=stdin-readRest) [title Function [c readRest]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String or null]]
        ]
    ]
]

[ch (id=stdout) [title Object [c stdout]]
    [p [verbatim Functions to write to the current process's standard output device (stdout).]]

    [ch (id=stdout-write) [title Function [c write]]
        [p [verbatim Write a string to stdout.]]
        [p Input:]
        [list
            [el [c string String]: [verbatim The string to be written]]
        ]
        [p Output: none]
    ]

    [ch (id=stdout-writeLine) [title Function [c writeLine]]
        [p [verbatim Write a string, followed by a new line, to stdout.

 The new line is OS dependant (LF on Linux, CRLF on Windows).]]
        [p Input:]
        [list
            [el [c string String]: [verbatim The string to be written]]
        ]
        [p Output: none]
    ]

    [ch (id=stdout-writeNewLine) [title Function [c writeNewLine]]
        [p [verbatim Write a new line to stdout.

 The new line is OS dependant (LF on Linux, CRLF on Windows).]]
        [p Input: none]
        [p Output: none]
    ]
]

[ch (id=timeUtils) [title Object [c timeUtils]]
    [p [verbatim Date/time utility functions
 line 2
 line 3]]

    [ch (id=timeUtils-formattedCurrentLocalDateTime) [title Function [c formattedCurrentLocalDateTime]]
        [p [verbatim Get the current local date and time
 line 2
 line 3]]
        [p Input:]
        [list
            [el [c format String]: [verbatim A string defining the format to use]]
        ]
        [p Output:]
        [list
            [el [c String]: [verbatim A string representing the current local date and time]]
        ]
    ]

    [ch (id=timeUtils-currentLocalDateTimeMinutes) [title Function [c currentLocalDateTimeMinutes]]
        [p [verbatim Get the current local date and time up to minutes]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String]: [verbatim A string representing the current local date and time]]
        ]
    ]

    [ch (id=timeUtils-currentLocalDateTimeSeconds) [title Function [c currentLocalDateTimeSeconds]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]

    [ch (id=timeUtils-formattedCurrentLocalDate) [title Function [c formattedCurrentLocalDate]]
        [p Input:]
        [list
            [el [c format String]]
        ]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]

    [ch (id=timeUtils-currentLocalDate) [title Function [c currentLocalDate]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]

    [ch (id=timeUtils-formattedCurrentLocalTime) [title Function [c formattedCurrentLocalTime]]
        [p Input:]
        [list
            [el [c format String]]
        ]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]

    [ch (id=timeUtils-currentLocalTimeMinutes) [title Function [c currentLocalTimeMinutes]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]

    [ch (id=timeUtils-currentLocalTimeSeconds) [title Function [c currentLocalTimeSeconds]]
        [p Input: none]
        [p Output:]
        [list
            [el [c String]]
        ]
    ]
]

[ch (id=URLUtils) [title Object [c URLUtils]]

    [ch (id=URLUtils-readText) [title Function [c readText]]
        [p Input:]
        [list
            [el [c URL String]]
        ]
        [p Output:]
        [list
            [el [c String or null]]
        ]
        [p Throws:]
        [list
            [el [c IOException]]
        ]
    ]
]

[ch (id=WinCmdUtils) [title Object [c WinCmdUtils]]

    [ch (id=WinCmdUtils-getInstructionsOutput) [title Function [c getInstructionsOutput]]
        [p Input:]
        [list
            [el [c instructions String]]
            [el [c arguments String\[\] or null]]
            [el [c input String or null]]
        ]
        [p Output:]
        [list
            [el [c String or null]]
        ]
        [p Throws:]
        [list
            [el [c IOException]]
            [el [c InterruptedException]]
        ]
    ]
]
