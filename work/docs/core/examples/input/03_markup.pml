[ch (id=markup) [title Markup]

    Suppose we want to render the following wonderful quote by Albert Einstein:

    "Everything should be [b as simple as possible], but [b [i not simpler]]."

    In HTML we would write:
    [code
        """
        <p>"Everything should be <b>as simple as possible</b>, but <b><i>not simpler</i></b>."</p>
        """
    ]

    In PDML the code looks like this:
    [code
        """
        [p "Everything should be [b as simple as possible], but [b [i not simpler]]."]
        """
    ]

    [note
        The above example demonstrates the syntax actually used in the [link (url="https://pml-lang.dev/") Practical Programming Language] (PML), a lightweight markup language that uses PDML under the hood.

        For a more complete markup example you may have a look at the [link (url="^[get github_repo_url]/work/docs/core/examples") PML source code] of this document.
        However, be aware that some PDML extensions as well as PML-specific features are used in that code.
    ]
]
