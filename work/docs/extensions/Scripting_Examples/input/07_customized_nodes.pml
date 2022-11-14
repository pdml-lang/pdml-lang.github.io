[ch (id=customizing_syntax) [title Customizing Syntax]

    Whenever you want to simplify or customize the syntax in PDML documents, you can consider using script nodes.

    Let's look at an example of syntax customization in [u:get PML_link].

    Suppose we need to insert many icons that all must have the same dimensions, and a border.
    Using standard PML, the code would look like this:
    [insert_code file=[u:get examples_dir]customizing_syntax/HTML_example.pml]

    Needless to say, nobody enjoys writing code like this again and again.
    The code is challenging to maintain, and clearly violates the important [link url=https://en.wikipedia.org/wiki/Don%27t_repeat_yourself text="Don't repeat yourself (DRY)"] principle.

    To eliminate the pain we can write a function that inserts the PML code for us:
    [insert_code file=[u:get examples_dir]customizing_syntax/icon_function.def]

    Now we can easily insert icons with the following code:
    [insert_code file=[u:get examples_dir]customizing_syntax/function_usage.pml]

    The code is now DRY and easy to maintain.

    It expands to:
    [insert_code file=[u:get examples_dir]customizing_syntax/HTML_example.pml]

    We could add more arguments to function [c icon] and do whatever we need to do with them, using the full power of a scripting language. For example, we could add argument [c borderColor] to auto-insert inline CSS that defines the color of the icon's border, and sets the width to 3 pixels:
    [insert_code file=[u:get examples_dir]customizing_syntax/icon_function_2.def]

    Now, this code:
    [insert_code file=[u:get examples_dir]customizing_syntax/function_2_usage.pml]
    ... would be rendered like this in the browser:
    [image source=images/icons_example.png width=64]
]
