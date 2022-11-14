[ch YAML

    One way to minimize verbosity is to use indentation to define structure. [link url=https://yaml.org/ text=YAML] is probably the most popular language that uses this technique.

    Here is a reprint of a JSON example we saw previously:
    [code lang=JSON
        {
            "person": {
                "name": "Albert",
                "married": true,
                "address": {
                    "street": "Kramgasse",
                    "city": "Bern"
                },
                "phones": [ "123", "456"]
            }
        }    
    code]

    In YAML, this becomes:
    [code lang=YAML
        person:
            name: Albert
            married: true
            address:
                street: Kramgasse
                city: Bern
            phones:
                - 123
                - 456
    code]

    Nice!

    Easy to read and write.
    
    At first sight it might seem that we could use such a noise-less syntax for all kinds of data structures, including markup code.

    It turns out that would be a very bad idea. The problem with YAML and all other languages that use indentation to define structure is this: It works well for small, simple structures (such as config files). But if we need to manage big documents with deeply nested structures then it quickly becomes error-prone and unmaintainable.

    Moreover, while using indentation to define structure effectively reduces verbosity, it also leads to much more lines of code for certain types of documents. The reason is that each child element [i must] be written on a new line.

    To illustrate this, let's see how the simple HTML one-liner we used in the previous chapter would be written in YAML. Here is a reprint of the HTML:
    [code lang=HTML
        <p style="color:red;"><i>foo</i> <b>bar</b></p>
    code]

    In YAML the code would look like this:
    [code lang=YAML
        p:
            style: 'color:red;'
            content:
                - i: foo
                - ' '
                - b: bar
    code]

    There are other arguments against whitespace-sensitive documents, such as the problems with mixing spaces and tabs, and code snippets that cannot be shared between different documents with different levels of indentation. These inconveniences are well known - there is no need for repetition here.

    Finally, the whitespace-significant approach forces us to use whitespace according to the rules (which can get very complex). It takes away the freedom to use whitespace to make documents more appealing and understandable.

    As for JSON, this doesn't mean that 'YAML is bad'. YAML is well suited in [i some] cases. What I want to say is that the idea of using whitespace-sensitivity in a markup language like HTML is doomed to fail. It's understandable that, according to [link url=https://en.wikipedia.org/wiki/YAML#History_and_name text = Wikipedia], the meaning of the acronym YAML was changed from "Yet Another Markup Language" to "YAML Ain't Markup Language".

    XML/HTML ignores whitespace, and that's the right choice.
]
