[doc [title Conditional Text Test]

    [s:def const forTeachers = false;]

    Question: What is the answer?

    [s:script
        ~~~
        if ( forTeachers ) {
            doc.insertText ( "Answer: The answer is 42." );
        }
        ~~~
    ]
]
