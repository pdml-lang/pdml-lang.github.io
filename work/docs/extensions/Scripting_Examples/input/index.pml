[doc [title PDML Scripting Examples]

    [div
        [table
[-
            [tr [tc [b PDML Version]][tc 1.0.0]]
-]
            [tr [tc [b First Published]][tc 2022-02-07]]
            [tr [tc [b Latest Update]][tc 2022-02-10]]
            [tr [tc [b License]][tc [link (url=https://creativecommons.org/licenses/by-nd/4.0/) CC BY-ND 4.0]]]
            [tr [tc [b Author]][tc Christian Neumanns]]
            [tr [tc [b Website]][tc [link (url=https://pdml-lang.dev/)]]]
            [tr [tc [b PML Markup Code]][tc [link (url=https://github.com/pdml-lang/extensions-scripting-examples) Github]]]
        ]
    ]

    [u:set PDML_website_url=https://pdml-lang.dev/]
    [u:set PDML_docs_url=[u:get PDML_website_url]docs/]
    [u:set PDML_ext_ref_manual_url=[u:get PDML_docs_url]extensions/reference_manual/index.html]
    [u:set PDML_ext_user_manual_url=[u:get PDML_docs_url]extensions/user_manual/index.html]
    
    [u:set PML_link="[link (url=https://pml-lang.dev/) PML]"]
    
    [u:set examples_dir=examples/]

    [u:ins_file path=config/scripting/snippets.def]

    [u:ins_file path=01_introduction.pml]
    [u:ins_file path=02_expressions.pml]
    [u:ins_file path=03_libraries.pml]
    [u:ins_file path=04_text_updates.pml]
    [u:ins_file path=05_retrieve_data.pml]
    [u:ins_file path=06_create_data.pml]
    [u:ins_file path=07_customized_nodes.pml]
    [u:ins_file path=08_conditional_data.pml]
    [u:ins_file path=09_OS_programs.pml]
    [u:ins_file path=10_OS_scripts.pml]

[- TODO?
    [u:ins_file path=11_user_interfaces.pml]  // show info, warning, error; ask string, yes_no, file, directory
    [u:ins_file path=12_debugging.pml] // stdout, stderr, GUIDialog.info, JS's console.log()
    [u:ins_file path=13_logging.pml]
-]
]
