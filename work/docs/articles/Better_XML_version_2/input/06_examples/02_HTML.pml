[ch HTML Code

    Now we'll look at some HTML code - the most common use of XML. To keep the example short, we'll just look at an HTML snippet, leaving off the HTML header and footer.

    [b HTML]

    The following code represents a chapter with three paragraphs and a picture:

    [code lang = XML id=html_chapter_example
        <section>
            <h2>Harmonic States</h2>

            <p>The <i>initial</i> state looks like this:</p>
            <img src="images/state_1.png" />

            <p>After just a few <i><b>micro</b>seconds</i> the state changes.</p>
            
            <p>More text ...</p>
        </section>
    code]


    [b JSON]

    In a [xref node_id=JSON_alternative text=previous] chapter we saw already that JSON is not a good fit to write HTML-like code. Nevertheless, let's a have look at the JSON version of our HTML snippet - just to confirm our previous conclusion:
    [code lang = JSON
        { "section": [
            { "h2": "Harmonic States" },

            { "p": [ "The ", { "i": "initial" }, " state looks like this:" ] },
            { "img": { "src": "images/state_1.png" } },

            { "p": [ "After just a few ", { "i": [ { "b": "micro" }, "seconds" ] }, " the state changes." ] },
            { "p": "More text ..." }
        ] }
    code]

    If we prettify, the 7 lines of code turn into 38 (!) lines with more whitespace than text:
    [code lang = JSON
        {
            "section":[
                {
                    "h2":"Harmonic States"
                },
                {
                    "p":[
                        "The ",
                        {
                            "i":"initial"
                        },
                        " state looks like this:"
                    ]
                },
                {
                    "img":{
                        "src":"images/state_1.png"
                    }
                },
                {
                    "p":[
                        "After just a few ",
                        {
                            "i":[
                                {
                                    "b":"micro"
                                },
                                "seconds"
                            ]
                        },
                        " the state changes."
                    ]
                },
                {
                    "p":"More text ..."
                }
            ]
        }
    code]

    Who would enjoy writing and maintaining code like this? Yet this is just a simple toy example. Imagine a code base with real-world, big and complex HTML code!


    [b pXML]

    This is the pXML version:

    [code lang = none
        [section
            [h2 Harmonic States]

            [p The [i initial] state looks like this:]
            [img (src=images/state_1.png)]

            [p After just a few [i [b micro]seconds] the state changes.]
            
            [p More text ...]
        ]
    code]


    [b PML]

    As said already, PML has a [xref node_id=lenient_PML text=lenient syntax mode] that allows for succinct markup code:

    [code lang = none
        [ch Harmonic States

            The [i initial] state looks like this:
            [image images/state_1.png]

            After just a few [i [b micro]seconds] the state changes.
            
            More text ...
        ]
    code]

    [note
        If we embed the above code in a [c doc] element (as [xref node_id=pml_lenient_example text=shown before]), save the code into file [c test.pml], and run the [i PML to HTML Converter] with the OS command [c pmlc test.pml], a complete HTML file is created (with header and footer). Here is an excerpt of this file (CSS code removed):
        [code
            <section id="ch__1">
                <h2>Harmonic States</h2>
                <p>The <i>initial</i> state looks like this:</p>
                <figure>
                    <img src="images/state_1.png" />
                </figure>
                <p>After just a few <i><b>micro</b>seconds</i> the state changes.</p>
                <p>More text ...</p>
            </section>
        code]

        As can be seen, it is very similar to the [xref node_id=html_chapter_example text=initial HTML code] we would write by hand.
    ]


    [b Verbosity]

    Let's look at numbers. How much effort does it take to write the code in the four languages? If we extract the markup code (i.e. remove whitespace and text displayed in the browser) we get this, from worst to best:

    [code
        JSON: {"section":[{"h2":""},{"p":["",{"i":""},""]},{"img":{"src":""}},{"p":["",{"i":[{"b":""},""]},""]},{"p":""}]}
        
        HTML: <section><h2></h2><p><i></i></p><imgsrc=""/><p><i><b></b></i></p><p></p></section>

        pXML: [section[h2][p[i]][img(src=)][p[i[b]]][p]]
        
        PML:  [ch[i][image][i[b]]]
    code]

    Counting the number of characters gives us the following table:
    [table_data
        Language	Markup length	Percentage of HTML
        -
        JSON	108	132%
        HTML	82	100%
        pXML	42	51%
        PML	20	24%
    table_data]

    A graph of these numbers looks like this:
    [image images/bar_graph_characters.png width=500 html_alt=Number of characters in JSON, HTML, pXML, and PML]

    Of course this is not a representative result. Other HTML examples would lead to more or less different numbers. However, it clearly shows the impact of syntax. Syntax affects complexity, space and time, and  usability. Succinct syntax makes it easier and more enjoyable to read and write code.
]
