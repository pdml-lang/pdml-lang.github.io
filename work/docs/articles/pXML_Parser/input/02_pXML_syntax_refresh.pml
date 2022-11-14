[ch [title pXML Syntax Refresh]

    If you never heard of pXML you might want to read [link url=https://pxml-lang.github.io/docs/articles/suggestion-for-better-xml-html/index.html text="Suggestion For a Better XML/HTML Syntax"] first. That article introduces pXML and explains its rationale.
    
    Here is a copy of chapter [link url=https://pxml-lang.github.io/docs/articles/suggestion-for-better-xml-html/index.html#ch__26 text="Syntax Comparison"]:

    Empty element:
    [code
        XML:  <br />
        pXML: [br]
    code]

    Element with text content:
    [code
        XML:  <summary>text</summary>
        pXML: [summary text]
    code]

    Element with child elements:
    [code
        XML:  <ul>
                  <li>
                      <div>A <i>friendly</i> dog</div>
                  </li>
              </ul>

        pXML: [ul
                  [li
                      [div A [i friendly] dog]
                  ]
              ]
    code]

    Attributes:
    [code
        XML:  <div id="unplug_warning" class="warning big-text">Unplug power cord before opening!</div>
        pXML: [div (id=unplug_warning class="warning big-text")Unplug power cord before opening!]
    code]

    Escaping:
    [code
        XML:  <note>Watch out for &lt;, &gt;, &quot;, &apos;, &amp;, [, ], and \ characters</note>
        pXML: [note Watch out for <, >, ", ', &, \[, \], and \\ characters]    
    code]

    Comments:
    [code
        Single comment:
        XML:  <!-- text -->
        pXML: [- text -]

        Nested comments:
        XML:  not supported
        pXML: [- text [- nested -] -]
    code]
]
