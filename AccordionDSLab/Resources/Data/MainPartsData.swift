//
//  MainPartData.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 4. 2025..
//
import SwiftData

// MARK: - MAIN PARTS DATA
// A static array of data that describes the main parts of an accordion
let mainPartsData: [MainPartsModel] = [
    // MARK: - RIGHT-HAND SIDE
    MainPartsModel(
        part: .rightHand,
        description1: "The **stationary side** of the instrument, secured with **straps** to the performer's body for stability on the chest during playing. It is intended for playing with the right hand, and several **functional units** are integrated on this side:",
        description2: """
\u{25CF}\t**The right-hand manual**, which is located on a special **bracket** and includes **white and black keys** that can be of various shapes.  
\u{25CF}\t**Treble case**.  
\u{25CF}\t**Treble valve plate with air vents**.  
\u{25CF}\t**Reed block** in the **right-hand body**, on which sets of **reed plates** are mounted, sealed with special **wax**.  
\u{25CF}\t**Treble action**, which includes **key levers** with **springs** and **pallets**.  
\u{25CF}\t**Right-hand registers** for changing the **timbre** of the **treble**.  
\u{25CF}\t**Treble grille** - the **pallets cover** and protection for the **treble action** of the accordion.  
\u{25CF}\t**Right-hand hardware**, which includes **straps** for holding the accordion during performance and **buckles** for securing the **bellows** in the closed position.
""",
        description3: "**Differences in the keyboard**, the **number and arrangement of reeds**, **tuning**, and **treble registers** are **key distinctions** among different models of **concert accordions**.",
        imageCaption: "Functional components of the right side"),
    
    // MARK: - LEFT-HAND SIDE
    MainPartsModel(
        part: .leftHand,
        description1: "The **left-hand side** is a **movable part** that **synchronizes** with the **bellows** during left-hand playing. Primarily used for **chord accompaniment**, it also enables **melodic playing** on models with **baritone** or **converter bass systems**. It comprises:",
        description2: """
\u{25CF}\t**The left-hand manual - bass buttons**, which is located on a special **mechanism** and typically includes **buttons** arranged in the **Stradella system** for **standard bass** and **chord accompaniment**, with some models also featuring **buttons** for a **baritone bass system**.  
\u{25CF}\t**Bass case**.  
\u{25CF}\t**Bass valve plate** with **air vents**.  
\u{25CF}\t**Reed block** in the **left-hand body**, on which sets of **reed plates** sealed with special **wax** are placed.  
\u{25CF}\t**Bass action**, a **mechanical system** of **levers** and **pins** that activates the **bass pallets** connected to the **bass buttons**.  
\u{25CF}\t**Left-hand registers** for changing the **timbre** of the **bass**.  
\u{25CF}\t**Bass grill** - the **bass mechanism cover** and protection for the **bass action** of the accordion.  
\u{25CF}\t**The left-hand side equipment**, which includes a **shoulder strap** and **adjuster** for opening and closing the **bellows**, an **air valve** for releasing air from the **bellows**, and **supports** for placing the accordion when not in use.
""",
        description3: """
            The **bass action** inside the **bass case** is a **mechanical system** that opens the corresponding **bass pallets** with **bass key carriers** upon pressing the **buttons**, according to a predefined arrangement (**standard or baritone bass**). The **converter bass mechanism** enables the use of both systems.  
            \t  
            **Constructional differences** of the **left-hand side** vary significantly between **accordion models** and influence their purpose and the player's choice of instrument.
            """,
        imageCaption: "Functional components of the left side"),
    
    // MARK: - BELLOWS - AIR CHAMBER
    MainPartsModel(
        part: .bellows,
        description1: "The **bellows** represent a **flexible** and **expandable air chamber** of conventional construction, essential for **sound production** on the accordion. Its opening and closing alters the **volume** and **direction of the airflow** through the **tone chambers** of the **reed blocks**, which causes the **free reeds** to **oscillate** and generate **tones**. ",
        description2: "As a **hermetically sealed system**, the **bellows** must withstand **pressure variations** during playing. Furthermore, the **movement of the bellows** directly influences the **articulation of tones**: faster movement results in a louder sound, while slower movement produces quieter tones. Without **airflow** through the **bellows**, the accordion cannot function and produce sound, making it a **vital part** of the instrument.",
        description3: "",
        imageCaption: "Bellows")
]
