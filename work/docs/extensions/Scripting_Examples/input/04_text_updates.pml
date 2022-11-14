[ch [title Automated Text Updates]

    Script nodes are often useful to automatically update text snippets in a document.

    For example, consider a web article that needs to be updated regularly.
    At the beginning of the article the following meta data are displayed:
    [code
        First published: 2021-07-06
        Latest update: 2022-01-10
    code]

    Each time a new version is published, we would have to manually change the [c Latest update] field.
    This is cumbersome and error-prone.
    It should be done automatically.

    We can do this by using an expression node:
    [code
        Latest update: [s:exp timeUtils.currentLocalDate()]
    code]
    Now the date is updated whenever the document is parsed.

    [note
        The above function applies the [link url=https://en.wikipedia.org/wiki/ISO_8601 text="ISO 8601"] standard to format the date (i.e. YYYY-MM-DD).
        [link url=[u:get PDML_ext_ref_manual_url]#timeUtils text=timeUtils] provides other functions to get a specifically formatted date, time, or date/time pair.

        For example, if we wanted to also display the time (without seconds) we could use function [link url=[u:get PDML_ext_ref_manual_url]#timeUtils-currentLocalDateTimeMinutes text=currentLocalDateTimeMinutes].
        That function would return text like this: [c 2022-01-10 14:16]
    ]

    Instead of using an expression node, we could also use a [c s:script] node that calls function [link url=[u:get PDML_ext_ref_manual_url]#doc-insertText text=doc.insertText]:
    [code
        Latest update: [s:script doc.insertText ( timeUtils.currentLocalDate() );]
    code]

    [note
        The above approach to update [c Latest update] might not be appropriate, because the date is updated each time the document is parsed, even if there are no real changes in the document.
        
        A better approach would therefore be to scan the list of files used to create the document and retrieve the timestamp of the file with the most recent modification date.
        
        One way to realize this would be to call an external program or OS script that provides the most recent timestamp.
        We'll later see how to call external programs and OS scripts.

        A dedicated PDML library function to make this super-easy might be added in the future.
    ]
]
