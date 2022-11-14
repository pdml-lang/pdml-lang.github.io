[ch [title Creating Text And Data]

    Script nodes can be used to auto-generate text and/or data that would be cumbersome to create manually.

    Suppose we want to display compound interest tables like the following one in a [u:get PML_link] document.
    [div (html_style="margin-left:3em;")
        [u:ins_file path=../[u:get examples_dir]interest_table/example.pml]
    ]

    The above table could be created with the following PML code:
    [insert_code file=[u:get examples_dir]interest_table/example.pml]

    Writing code like this manually quickly becomes boring and error-prone, especially if there are many such tables with different interest rates and many years to display.

    The solution is to write a function to automagically [i generate the PML code].
    As seen already, functions are defined within a [c s:def] node.
    Let's also store this function in an external file, so that it doesn't distract in the PML document, can be reused in other documents, and shared with other people.
    The file looks like this:
    [caption File interestUtils.def]
    [insert_code file=[u:get examples_dir]interest_table/interestUtils.def]

    We're not going to delve into the details of this code.
    It should be self-explanatory for Javascript programmers.

    The above table can now be inserted in a PML document with the following code:
    [code
        [u:ins_file path=interestUtils.def]

        [s:exp interestTable ( 100, 1.5, 5 )]
    code]

    If we want to insert more tables with different parameters, we just need to insert more [c s:exp] nodes.
    For example, the following code will generate an additional table for an initial amount of 10,000, an interest rate of 0.9%, and a period of 20 years:
    [code
        [s:exp interestTable ( 10000, 0.9, 20 )]
    code]
]
