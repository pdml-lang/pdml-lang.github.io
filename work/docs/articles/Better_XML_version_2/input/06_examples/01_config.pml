[ch Simple Config File

    A simple config file is just a (possibly nested) map of key/value pairs.


    [b JSON]

    Here is an example in JSON:

    [code lang = JSON
        {
            "size":"XL",
            "colors":{
                "background":"black",
                "foreground":"light green"
            },
            "transparent":true
        }
    code]

    Remarks:
    
    The need for quoting names and values is a bit annoying.

    Another inconvenience is the comma required at the end of each assignment, [i except the last one]. Each time we add a parameter at the end of a list, there is a risk of forgetting to add a comma at the existing second-last line.


    [b XML]

    The same config data look like this in XML:

    [code lang = XML
        <config>
            <size>XL</size>
            <colors>
                <background>black</background>
                <foreground>light green</foreground>
            </colors>
            <transparent>true</transparent>
        </config>
    code]

    Remark: The closing tags are noisy.

    Alternative syntax, using attributes:

    [code lang = XML
        <config>
            <size>XL</size>
            <colors background="black" foreground="light green" />
            <transparent>true</transparent>
        </config>
    code]
    
    Remark: Both syntaxes are not API-compatible. The change of using attributes instead of elements requires an update of the code that accesses the values of [c colors].

    [b pXML]

    The pXML version looks like this:
    
    [code lang = none
        [config
            [size XL]
            [colors
                [background black]
                [foreground light green]
            ]
            [transparent true]
        ]
    code]

    Alternative syntax, using attributes:

    [code lang = none
        [config
            [size XL]
            [colors (background=black foreground="light green")]
            [transparent true]
        ]
    code]

    Remark: Both syntaxes are API-compatible. The change of using attributes instead of elements does not require an update of the code that accesses the values of [c colors].
    
    [b Verbosity]

    To compare the verbosity of the three syntaxes, let's consider the length of the markup code needed for one parameter (excluding whitespace):

    [table_data
        Language	Markup	Length	Range	Remark
        -
        JSON	"":"",	6	3 to 6	-2 for integer, boolean, and null values (because they are not quoted); -1 for the last parameter (because it doesn't have a trailing comma)
        XML element	<></size>	9	min. 6	The length depends on the number of characters in the name
        XML attribute	=""	3	always 3	
        pXML element	[]	2	always 2	
        pXML attribute	= or =""	1 or 3	1 or 3	The length is 1 if the value doesn't need to be quoted
    table_data]

    [b Conclusion]
    
    The most verbose syntax is XML (especially for long parameter names). The least verbose one is pXML. Less noise implies 'easy to read and write for humans'.
]
