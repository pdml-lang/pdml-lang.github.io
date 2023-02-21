[ch (id=executing_OS_scripts) [title Executing OS Scripts]

    Besides executing OS [i programs], you can also execute OS [i scripts], by simply providing the OS's script code.
    This works on Linux and Windows, but you need of course to provide the correct OS-dependent code.

    Here is a simple example of inserting the result of a Windows [c dir] command into a [u:get PML_link] [c monospace] node:
    [insert_code file=[u:get examples_dir]directory_listing/dir_example.pml]

    The (truncated) result looks like this:
    [code
        ~~~
        Volume in drive C is DriveC
        Volume Serial Number is A504-9999

        Directory of C:\temp

        19/01/2022  10:32    <DIR>          .
        11/10/2021  13:57                24 example.txt
        08/05/2021  11:13                49 c.txt
        ...
                    19 File(s)        220.111 bytes
                    3 Dir(s)  630.814.339.072 bytes free
        ~~~
    ]

    The above code could also be written as a one-liner (NOT recommended):
    [insert_code file=[u:get examples_dir]directory_listing/dir_example_one_liner.pml]
]
