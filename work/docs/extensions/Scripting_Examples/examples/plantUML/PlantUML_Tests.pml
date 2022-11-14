[doc [title PlantUML Tests]

    [u:ins_file path = config/scripting/alice_bob.def]

    Alice-Bob image:
    [image source = images/alice_bob.png]

    [u:ins_file path = config/scripting/PlantUMLUtils.def]
    
    Alice-Bob image 2:

    [s:script insertPlantUMLImage ( "alice_bob_2", `@startuml
        Alice -> Bob: Hello
        Bob -> Alice: Hi
        @enduml` ); ]

    [u:ins_file path = config/scripting/PlantUMLUtils_2.def]
    
    Alice-Bob image 3:

    [s:script insertPlantUMLImage_2 ( "alice_bob_2", `@startuml
        Alice -> Bob: Hello
        Bob -> Alice: Hi
        @enduml` ); ]

    Alice-Bob image 4:

    [s:script insertPlantUMLImage_2 ( "alice_bob_2", `@startuml
        Alice -> Bob: Hello
        Bob -> Alice: Hi
        @enduml` ); ]
]
