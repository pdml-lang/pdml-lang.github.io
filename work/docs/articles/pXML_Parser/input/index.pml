[doc [title Open-Source Parser For Practical XML (pXML)]

    Author: Christian Neumanns
    
    Published: 2021-04-29

    [admon (label="IMPORTANT!")
        [i[b This article is outdated]].
        
        The ideas presented in this article are still valid in PDML (the successor of pXML). But many links and source code examples need to be updated to reflect the last changes.
    ]

    [- TOC_position = top -]

    [- written in PML (https://www.pml-lang.dev) -]

    [image source=images/n_v.png width=400 align=center html_alt="From XML to pXML"]

    [!set pxml_root_dir = ../../]
    [!set local_examples_dir = [!get pxml_root_dir]/dev/pXMLExamples]
    [!set local_src_dir = [!get pxml_root_dir]/dev/refImp/src/main/java/dev/pxml/core]

    [!set Github_parser_repo  = https://github.com/pxml-lang/java_parser]
    [!set Github_parser_repo_main  = [!get Github_parser_repo]/tree/main/src/main/java/dev/pxml/core]

    [!set Github_example_repo = https://github.com/pxml-lang/java_examples]
    [!set Github_example_repo_main = [!get Github_example_repo]/tree/main/src/main/java/dev/pxml/examples]

    [!set Java_API_doc_url = https://pxml-lang.github.io/docs/api/javadoc]
    [!set Java_API_doc_src_url = [!get Java_API_doc_url]/dev/pxml/core]

    [!ins-file path=01_introduction.pml]
    [!ins-file path=02_pXML_syntax_refresh.pml]
    [!ins-file path=03_usage_examples/00_main.pml]
    [!ins-file path=04_parser/00_main.pml]
    [!ins-file path=05_writer.pml]
    [!ins-file path=06_summary.pml]
]
