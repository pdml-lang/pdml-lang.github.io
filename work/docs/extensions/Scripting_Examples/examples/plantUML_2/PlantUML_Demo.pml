[doc [title PlantUML Demo]

    [u:ins_file path = config/scripting/PlantUMLUtils.def]

    Euler’s Identity, the most beautiful math equation:

    [s:script
        ~~~
        insertPlantUMLImage ( "euler_identity",  `
        @startmath
        e^(ipi)+1=0
        @endmath` );
        ~~~
    ]

    Time dilation in Einstein's special relativity:

    [s:script
        ~~~
        insertPlantUMLImage ( "time_dilation",  `
        @startmath
        t'=t1/sqrt(1-v^2/c^2)
        @endmath` );
        ~~~
    ]

    Brain boosters:

    [s:script
        ~~~
        insertPlantUMLImage ( "brain_boosters",  `
        @startmindmap
        <style>
        mindmapDiagram {
        .level_1 {
            BackgroundColor orange
        }
        .level_2 {
            BackgroundColor yellow
        }
        }
        </style>
        * brain boosters <<level_1>>
        ** body <<level_2>>
        *** eat healthy food
        *** exercise regularly
        *** sleep well
        ** mind <<level_2>>
        *** relax
        *** socialize
        *** meditate
        ** environment <<level_2>>
        *** clean air
        *** quiet
        *** kind people
        @endmindmap` );
        ~~~
    ]
]
