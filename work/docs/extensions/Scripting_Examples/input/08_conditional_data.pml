[ch [title Conditional Text Blocks]

    Sometimes it is necessary to produce different editions of the same document, depending on the target audience, or other factors.

    For example, an exam paper printed for students contains only questions, while the teachers' edition also contains the answers.

    Here is a simple [u:get PML_link] example to illustrate how this can be achieved.
    [insert_code file=[u:get examples_dir]conditional_text/input.pml]

    When [c forTeachers] is set to [c true] (as in the code above), the document's content will be:
    [output
        ~~~
        Question: What is the answer?

        Answer: The answer is 42.    
        ~~~
    ]

    When [c forTeachers] is [c false] the answer will not be printed:
    [output
        ~~~
        Question: What is the answer?
        ~~~
    ]

    [note
        In a real-world scenario, the value of [c forTeachers] would probably not be hard-coded in the document, but it would be retrieved from an external resource.
        Examples of how to do that are shown in chapter [xref (ref_id=retrieve_data)].
    ]
]
