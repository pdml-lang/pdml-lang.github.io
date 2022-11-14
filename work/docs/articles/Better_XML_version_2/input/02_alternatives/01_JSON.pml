[ch JSON id=JSON_alternative

    In the last years, JSON has overtaken XML in terms of popularity.

    To understand why (in the context of [i syntax]), let's have a look at a simple data structure in JSON:

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

    In XML, the code could look like this:

    [code lang=XML id=albert_example
        <?xml version="1.0" encoding="UTF-8"?>
        <person>
            <name>Albert</name>
            <married>true</married>
            <address>
                <street>Kramgasse</street>
                <city>Bern</city>
            </address>
            <phones>
                <phone>123</phone>
                <phone>456</phone>
            </phones>
        </person>
    code]

    Many people prefer the JSON syntax. It is easier to read and less verbose than the XML version. Not counting indentation spaces, the above JSON code requires 144 characters to type. The XML code has 276 characters. That's an increase of 92%!

    Examples like the above one lead to an intriguing question:
    [list
        [el "Couldn't we just stop using XML and use JSON instead for everything?"]
    ]

    For example, could we use the JSON syntax to write HTML documents?

    Let's try.

    Here is a simple HTML snippet:
    [code lang=HTML
        <p>foo bar</p>
    code]

    In JSON, we could express this as follows:
    [code lang=JSON
        { "p": "foo bar" }
    code]

    Let's write [c foo] in [i italics], and [c bar] in [b bold].

    HTML:
    [code lang=HTML
        <p><i>foo</i> <b>bar</b></p>
    code]

    JSON:
    [code lang=JSON
        { "p": [ { "i":"foo" }, " ", { "b": "bar" } ] }
    code]

    Now we want to display everything in red: 

    HTML:
    [code lang=HTML
        <p style="color:red;"><i>foo</i> <b>bar</b></p>
    code]

    JSON:
    [code lang=JSON
        { "p": { "style": "color:red;", "content": [ { "i": "foo" }, " ", { "b": "bar" } ] } }
    code]

    We can prettify to make the code easier to read:
    [code lang=JSON
        {
            "p":{
                "style":"color:red;",
                "content":[
                    {
                        "i":"foo"
                    },
                    " ",
                    {
                        "b":"bar"
                    }
                ]
            }
        }    
    code]

    But now the HTML one-liner has mutated into a '14 lines monster with lots of horizontal and vertical whitespace'.

    Not quite what we are looking for.

    Besides the obvious fact that the complexity of the JSON code increases quickly, there is another worrying observation:

    [list
        [el In the first example, the [c p] element's value was a string: [c "p": "..."].]
        [el In the second example, the value becomes a JSON array: [c "p": \[...\]].]
        [el In the last example, it mutates to a JSON object: [c "p": {...}].]
    ]

    Such changes can easily lead to maintenance nightmares. Code that inspects the data structure must be updated each time the code changes. For example if we wanted to extract the text of element [c p], we would need to write different code for the three cases.

    XML doesn't have this problem. The content of [c p] is always a list of child elements.

    At this point you hopefully agree that we can stop further investigation and move on. The JSON syntax is a bad fit for describing markup code like HTML documents in a human-friendly way. That doesn't mean of course that 'JSON is bad'. JSON is a good choice in many cases. It is a native part of JavasSript, well-supported in most programming languages, and there are lots of libraries and tools available for JSON. However, in the context of our search for a better markup syntax, JSON (as well as all variations of it) is not an option. Later we'll have a look at a more complete HTML example that confirms our conclusion.
]
