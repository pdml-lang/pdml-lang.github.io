[ch (id=libraries) [title Libraries]

    [- In this chapter we'll see how to work with libraries that provide reusable functions. -]

    [ch [title Standard Javascript Library]

        Instead of having the evaluation of the price expanded to [c 2675.19183945] we now want to round the price to 2 decimals.
        We can do this with the [i standard Javascript function] [link url=https://www.w3schools.com/jsref/jsref_tofixed.asp text=toFixed]:
        [s:exp priceExampleSnippet ( "toFixed" )]
        Now the node expands to [c \[price 2675.19\]].
    ]

    [ch [title Standard PDML Library]

        Suppose that instead of expanding to [c 2675.19], we would like to add a thousands separator, so that the price expands to  [c 2,675.19], which is more readable for humans.
        
        While there are some solutions to do that in Javascript, it is not trivial to do it in a reliable, portable way (as shown in this [link url=https://stackoverflow.com/questions/2901102/how-to-print-a-number-with-commas-as-thousands-separators-in-javascript text="Stackoverflow question"]).
        Instead of using a standard Javascript function we can use a [i standard PDML function] that allows us to provide a specific format, and also rounds to the number of decimal places specified in the format. We'll use function [link url=[u:get PDML_ext_ref_manual_url]#numberUtils-formatFloat text=formatFloat] defined in object [link url=[u:get PDML_ext_ref_manual_url]#numberUtils text=numberUtils]:
        [s:exp priceExampleSnippet ( "formatFloat" )]
        Result: [c \[price 2,675.19\]].
    ]

    [- TODO
        [ch [title Standard Java Library]
    -]

    [ch [title User-Defined Library]
        If we have several [c price] nodes in our document, it quickly becomes cumbersome and error-prone to write the above code.
        We can therefore [i define a function] in an [c s:def] node:
        [insert_code file=[u:get examples_dir]price/resources/libraries/myPriceLibrary.def]
        Now we can use function [c roundPrice] again and again in [c price] nodes. For example:
        [s:exp priceExampleSnippet ( "2prices" )]
        ... which expands to:
        [code
            [price 2,675.19]
            ...
            [price 39,483.00]
        code]
    ]

    [ch [title Shared Library]

        If we need the function in other documents too, we can save the above [c s:def] node in a file:
        [caption File resources/libraries/myPriceLibrary.def]
        [insert_code file=[u:get examples_dir]price/resources/libraries/myPriceLibrary.def]

        Then we can import the library at the beginning of the document with a [c u:ins_file] node (using a relative file path), and use the function as before:
        [s:exp priceExampleSnippet ( "final" )]

        [note
            A library file like the above one is not limited to one function.
            We could of course add other useful functions, and maybe also some commonly used constants.
            Then we could share the library in a public repository like Github, Gitlab, etc.
        ]
    ]

    For more information about libraries please refer to [link url=[u:get PDML_ext_user_manual_url]#javascript_support text="Javascript Support"].
]
