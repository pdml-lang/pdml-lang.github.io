[ch [title Writer]

    Besides a reader, the core library also includes a writer that implements interface [link url=[!get Github_parser_repo_main]/writer/IPXMLWriter.java text=IPXMLWriter]. A writer is created by passing a standard Java [c java.io.Writer] to the constructor of class [link url=[!get Github_parser_repo_main]/writer/PXMLWriter.java text=PXMLWriter]. Then methods like [c writeEmptyNode], [c writeTextNode], [c writeComment], etc. can be used to write pXML to any destination (file, string, URL, etc.). The writer takes care of using escape sequences when needed.

    Indenting must be done manually. A future version might include a [i pretty printing] mode.
]
