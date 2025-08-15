//
//  ReedBlockData.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 18. 6. 2025..
//

import SwiftData
import Foundation

struct ReedBlockData: DataPopulator {
    static var modelType: any PersistentModel.Type { ReedBlockSection.self }
    
    // MARK: - DATA POPULATION METHOD
    static func populate(modelContext: ModelContext) {
        do {
            let sortDescriptor = SortDescriptor<ReedBlockSection>(\.order)
            let fetchDescriptor = FetchDescriptor<ReedBlockSection>(sortBy: [sortDescriptor])
            let sections = try modelContext.fetch(fetchDescriptor)
            
            // Check if the database is empty before populating
            if sections.isEmpty {
                // MARK: -------------------------------------------------- 11.0. REED BLOCKS --------------------------------------------------
                let reedBlock = ReedBlockSection(title: "Accordion Reed Blocks", order: 1, subsections: [
                    ReedBlockSubsection(title: "Accordion Reed Blocks", order: 1, paragraphs: [
                        ReedBlockText(text: "The **reed block** is the most crucial assembly, directly influencing an accordion's **acoustic characteristics**. It acts as a specialized carrier for the **reed plates**, with each **free reed** having its own **reed chamber**.")]),
                    ReedBlockSubsection(title: "Core Design and Purpose", order: 2, paragraphs: [
                        ReedBlockText(text: "To **maximize the space** inside the accordion's body, **reed blocks** are often **divided lengthwise into two functional sections**, with **reed plates** arranged on both sides. If **reed plates** are only on one side, this assembly is called a **half reed block**.")]),
                    ReedBlockSubsection(title: "Types of Reed Blocks", order: 3, paragraphs: [
                        ReedBlockText(text: "**Full reed blocks** are **much more common** in modern accordions. **Half reed blocks** are **exclusively used** in accordion designs with an **odd number of voices**, most often found in **five-voice accordions** with a **Stradella bass system**.")]),
                    ReedBlockSubsection(title: "Beyond Acoustics: Mounting and Airflow", order: 4, paragraphs: [
                        ReedBlockText(text: "Besides its **acoustic function**, the **reed block** serves as a **sturdy mounting platform** for the **reed plates**. It securely attaches them to the **valve board**, allowing the **valves** to open and close **airflow** through the openings (which happens when the **bellows** are opened and closed). Every note an accordion produces on both the right and left sides must have its own **reed plate** and its designated spot with a **reed chamber** on the **reed block**. That's why there are **reed blocks** on both the right and left sides of the accordion. Although their **construction differs**, the **operating principle** of the reed blocks on both sides is **identical**.")])
                ])
                
                // MARK: -------------------------------------------------- 11.1. FUNCTIONAL PRINCIPLE OF REED BLOCKS --------------------------------------------------
                let reedBlockFunctional = ReedBlockSection(title: "Functional Principle of Reed Blocks", order: 2, subsections: [
                    ReedBlockSubsection(title: "Functional Principle of Reed Blocks", order: 1, paragraphs: [
                        ReedBlockText(text: "A **reed block** only functions as **part of the complete instrument**, integrated into the accordion's body. Its operation relies on the **cooperation of several key elements**: the **valve board**, the **register slider**, the **valve**, and the **bellows**.")]),
                    ReedBlockSubsection(title: "Interacting Components", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            \u{25CF}\tThe **valve board** supports the **reed block**.  
                            \u{25CF}\tThe **register slider** is part of the **register mechanism** that activates an accordion's **voice**.  
                            \u{25CF}\tThe **valve** opens and closes the passage for **airflow** into the **reed chambers** of the **reed block**.  
                            \u{25CF}\tThe bellows initiate and drive this airflow.
                            """)]),
                    ReedBlockSubsection(title: "How Reeds Create Sound", order: 3, paragraphs: [
                        ReedBlockText(text: """
                            When a **single valve lifts**, air flows through **two openings** on the **reed block**, causing **one free reed** from each opening to oscillate. The **bellows movement direction** determines which **reeds** vibrate:  
                            \u{25CF}\t**Bellows closing:** The **outer free reeds oscillate**.  
                            \u{25CF}\t**Bellows opening:** The **inner reeds oscillate** (those inside the **reed chambers** of the **reed block**).  
                            For a **reed** to oscillate and **produce sound**, the **valve must be open**, and the **register slider** must be positioned so all openings on the **valve board**, slider, and **reed block** are **aligned**. Additionally, the **airflow needs to be intense enough** (meaning the **bellows are in motion**) to give the **reeds oscillation** the **necessary amplitude**, which determines the tone's **sound intensity**.
                            """, imageName: "11.1._rb_functional", imageTitle: "Basic Functional Elements of the Reed Block")]),
                    ReedBlockSubsection(title: "Playing and System Variations", order: 4, paragraphs: [
                        ReedBlockText(text: "An **accordionist** can **simultaneously press multiple keys** on both **keyboards**. This raises several **valves**, allowing air to pass through more openings and causing a **greater number of reeds to oscillate**—on the same or different **reed blocks**, and on both sides of the accordion."),
                        ReedBlockText(text: "Typically, each **reed block** holds **two sets of reed plates**, with **one set almost always designated for a single voice**. The **construction of reed blocks differs** between the right and left sides of the accordion, depending on the **bass system** type. **Right-hand reed blocks** and those for the **baritone bass system** share **very similar constructions**, but **Stradella bass system reed blocks** are quite different from their right-hand counterparts.")])
                ])
                
                // MARK: -------------------------------------------------- 11.2. REED BLOCK CONSTRUCTION --------------------------------------------------
                let reedBlockConstruction = ReedBlockSection(title: "Reed Block Construction", order: 3, subsections: [
                    ReedBlockSubsection(title: "Reed Block Construction", order: 1, paragraphs: [
                        ReedBlockText(text: "A classical **reed block** is made of **wood** and represents a complex lattice-like structure. It consists of several key parts: the **longitudinal central support**, the **reed block base**, **divider walls**, and the **reed chamber cover**.")]),
                    ReedBlockSubsection(title: "Parts and Their Characteristics", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            **1)\tLongitudinal Central Support**:  
                            \u{25CF}\tDivides the **reed block** into two functional sections.  
                            \u{25CF}\tIt can have a constant thickness along its entire length or a slight **wedge shape**, which creates varying **reed chamber** depths along the **reed block**. The greatest chamber depth (for the lowest frequencies) is where the support is thinnest.  
                            \u{25CF}\tA two-part, symmetrical **reed block base** with **airflow** openings is attached to it.
                            """),
                        ReedBlockText(text: """
                            **2)\tReed Chambers:**  
                            \u{25CF}\tTheir **minimum depth** is determined by the maximum oscillation amplitude of the inner **free reed** to prevent contact with the **central support beam**. This is especially important for the lowest frequency **reeds**, which can have additional masses at their tips.  
                            \u{25CF}\tHigher frequencies require shallower chamber depths. Some manufacturers reduce the **reed block's** weight by dividing the **longitudinal central support** in that area, creating an opening.  
                            \u{25CF}\tAdditional indentations in the **central support beam** can increase the chamber depth for low tones.  
                            \u{25CF}\tThe **height of the reed chambers** varies on the same side of the **reed block** due to different **reed plate** sizes.
                            """),
                        ReedBlockText(text: """
                            **3)\tReed Chamber Cover:**  
                            \u{25CF}\tForms the top side of the **reed chambers** and is attached to the **longitudinal central support**, providing additional **stiffness** to the **reed block**.  
                            \u{25CF}\tSince chamber heights often differ on both sides of the **reed block**, the covers can have different positions.  
                            \u{25CF}\tSome manufacturers use a single common cover for both sides, while others use two separate covers, one for each side.
                            """),
                        ReedBlockText(text: """
                            **4)\tReed Block Base:**  
                            \u{25CF}\tConsists of two symmetrical parts, positioned on either side of the **central longitudinal support**, with rectangular openings (one for each **reed chamber**).  
                            \u{25CF}\tSome manufacturers produce **reed blocks** with a single-piece **base** featuring two rows of cylindrical openings instead of rectangular ones for easier processing (drilling instead of cutting). However, cylindrical openings have a smaller surface area (by 27.3%), which significantly reduces the accordion's **sound intensity**.  
                            \u{25CF}\tThe **base** width is adjusted during the final processing of the **reed block** to match the spacing of the openings on the **valve board** and the necessary minimum distance to the adjacent **reed block**, ensuring the unobstructed movement of the outer free reed tip at maximum oscillation amplitude.
                            """, imageName: "11.2._rb_construction", imageTitle: "Reed Block Construction")]),
                    ReedBlockSubsection(title: "Wood Selection and Processing", order: 3, paragraphs: [
                        ReedBlockText(text: "Modern concert accordions have a greater number of **reed blocks**, the quantity depending on the **voices**, range of tones, construction, and **mechanical system** of the accordion.",imageName: "11.2._rb_design_standard", imageTitle: "Design of a standard Reed Block on the Right-Hand side"),
                        ReedBlockText(text: "**Wooden elements** are joined with high-quality, durable wood adhesive, creating a single, strong, and very **stiff** lattice-like structure of light weight. Additional **stiffness** is achieved by combining different **wood** types with varying grain directions."),
                        ReedBlockText(text: """
                            **Wood quality is crucial:**  
                            \u{25CF}\tIt must be impeccably treated through **natural drying**, which can take over 15 years.  
                            \u{25CF}\t**Resonant softwood** with a fine structure and perfectly straight longitudinal grains is most commonly used.  
                            \u{25CF}\tFor the **longitudinal central support**, hard, strong, and water-resistant **wood** with high **toughness** is chosen.  
                            \u{25CF}\t**Divider walls** are made from strong and light **wood** (around 1.8 mm thick).  
                            \u{25CF}\tThe **cover** requires **wood** with high strength and **toughness**.  
                            \u{25CF}\tThe **base** is made from **wood** with high hardness and strength.  
                            Generally, **wood** for **reed blocks** should have low density, be easy to work with, possess a uniform parallel grain structure, and be durable and resistant to moisture, chemical, and biological processes over time.
                            
                            """),
                        ReedBlockText(text: """
                            **Examples of wood types and their application:**  
                            \u{25CF}\t**South American Mahogany (Swietenia macrophylla):** Durable, very low density, easy to work with, used for **reed blocks** with exceptional  
                            \u{25CF}\t**European Spruce and Fir (Picea abies):** Belong to the group of highly **resonant** and soft **wood** types, with exceptional strength and very low weight; they have homogeneity in their regular growth ring arrangement, which is very important for their acoustic characteristics.  
                            \u{25CF}\t**Yellow Cedar (Cedrus brevifolia) / Canadian Cypress (Callitropsis nootkatensis):** Very homogeneous and stable **resonant wood**, resistant to cracks.  
                            \u{25CF}\t**Indian Rosewood (Dalbergia latifolia):** Has high growth ring density with a brown color, very high durability, and exceptional mechanical characteristics; suitable for **reed block** parts intended for low-frequency tones.  
                            \u{25CF}\t**Hornbeam (Carpinus betulus):** Very hard and tough **wood** of relatively low weight, often used for **reed block bases**.  
                            \u{25CF}\t**Linden (Tilia), White Poplar (Populus alba), Aspen (Populus tremula), Ash (Fraxinus):** Used for **reed chamber** partitions and **reed block** parts not exposed to mechanical stress.
                            """)]),
                    ReedBlockSubsection(title: "Protection and Alternatives", order: 4, paragraphs: [
                        ReedBlockText(text: "To increase the **durability** of **reed blocks**, their **moisture resistance**, and chemical protection (against fungi, insects, and larvae that attack **wood**), **reed blocks** are **impregnated** with special solutions (salts, wax, oils, and other substances) that deeply penetrate the **wood’s** structure. An **impregnated reed block** is further coated with a special **lacquer**. **Lacquering** the **reed chambers** is particularly important to ensure the chamber walls provide appropriate **sound wave reflection**. If a **reed chamber** on the **reed block** were not properly processed and adequately **lacquered**, the porous organic surface of the **wood** chamber walls would have an **absorbing effect** on the wave motion of air particles, which would reduce the accordion's **sound intensity**."),
                        ReedBlockText(text: "During the 1990s, some manufacturers experimented with **polymer reed blocks** for amateur and student accordions. However, despite the continuous development of new **polymer** technologies, it's very difficult to find an adequate substitute for **wood** among synthetic and **polymer** materials for **reed block** construction. **Polymers** do not have satisfactory resistance to aging, nor do they possess the adequate acoustic and mechanical characteristics of **wood**, and they certainly cannot be an adequate material for **reed blocks** intended for concert accordions.")])
                ])
                
                // MARK: -------------------------------------------------- 11.3. ATTACHING REED PLATES TO REED BLOCKS --------------------------------------------------
                let reedBlockAttaching = ReedBlockSection(title: "Attaching Reed Plates to Reed Blocks", order: 4, subsections: [
                    ReedBlockSubsection(title: "Attaching Reed Plates to Reed Blocks", order: 1, paragraphs: [
                        ReedBlockText(text: "Precise placement and attachment of **reed plates** are crucial for an accordion's acoustic performance. This process involves careful manual positioning and **waxing**, sometimes with additional mechanical support.", imageName: "11.3._rb_waxing_1", imageTitle: "Reed Block Waxing Process")]),
                    ReedBlockSubsection(title: "The Attachment Process", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            \u{25CF}\t**Manual Positioning: Reed plates** are carefully and precisely arranged by hand within the **reed chambers** and **airflow** openings on the **reed block.** It's essential to ensure the **reed plates** lie flat against the **divider walls** and the **reed chamber cover**, resting their lower part (with rivets) on the **reed block base**.  
                            \u{25CF}\t**Uniform Spacing:** Maintaining even **spacing** between all **reed plates** across the entire **reed block** is vital for consistent sound.  
                            \u{25CF}\t**Waxing:** After positioning, melted **wax** is poured around the **reed plates** and onto the **reed block base**. This process uses a specialized tool—a narrow, deep spoon with a thin funnel at its tip—to precisely pour the **wax** between the **reed plates**. The **wax** is poured on all sides of the **reed plate**, ensuring its firm attachment to the **reed block** and hermetic sealing of the **reed chamber**.
                            """, imageName: "11.3._rb_waxing_2")]),
                    ReedBlockSubsection(title: "Wax Quality and Additives", order: 3, paragraphs: [
                        ReedBlockText(text: """
                            The **wax** used for attachment must possess specific properties to ensure optimal performance:  
                            \u{25CF}\t**Adhesive and Sealing Properties:** It must adhere well to both metal and **wood**, providing complete airtightness to the **reed chamber**.  
                            \u{25CF}\t**Strength and Stability:** It must be strong enough to maintain the **reed plate's** stable position even at large oscillation amplitudes of the **free reed**, thus ensuring the overall **stiffness** and **dynamic stability** of the **reed block**.  
                            \u{25CF}\t**Temperature Resistance**: The **wax's** melting point must be higher than typical atmospheric temperatures to retain its characteristics over time.
                            """),
                        ReedBlockText(text: """
                            **Natural beeswax** (melting point 62-65°C), an organic compound of wax esters, is most commonly used. To improve its mechanical characteristics and increase its melting point, the following additives are added to **natural wax**:  
                            \u{25CF}\t**Rosin (Colophony):** A dark yellow, transparent amorphous mass derived from **turpentine** (a resin secreted by coniferous trees). It improves the **wax's** strength.  
                            \u{25CF}\t**Paraffin Oil:** Added in a small percentage to enhance the surface layer characteristics of the poured **wax**.
                            """),
                        ReedBlockText(text: "Many accordion manufacturers keep the **wax** composition a technological secret, as its quality is crucial for the instrument's acoustic performance. Only adequately prepared **wax** with appropriate additives can enable an accordion to produce top-quality tones.",imageName: "11.3._rb_wax", imageTitle: "Reed Wax Tool")]),
                    ReedBlockSubsection(title: "Additional Mechanical Fastening", order: 4, paragraphs: [
                        ReedBlockText(text: """
                            In addition to **waxing**, an **additional mechanical connection** is often used to increase the **dynamic stiffness** of the joint between the **reed plate** and the **reed block**:  
                            \u{25CF}\t**Nails or Screws: Reed plates** are fastened by driving special nails with enlarged heads or by inserting small screws into the **divider walls** or **reed chamber cover**. The nail or screw body touches the outer edge of the **reed plate** from the side or front, while the nail head engages the **reed plate** and attaches it to the **reed block**.  
                            \u{25CF}\t**Bending Nails:** Some manufacturers partially drive nails from the front side of the **reed plate** into the **reed chamber cover**, then cut off the head and bend the nail body over the **reed plate** to ensure a more stable position on the **reed block**.  
                            \u{25CF}\t**Damping Effect:** Driving nails along the outer edges of the **free reed plates**, besides increasing joint **stiffness** with the **reed block**, also has an additional **damping effect** on **plate** vibrations that occur as a reaction to the oscillation of the **free reed**.
                            """)]),
                    ReedBlockSubsection(title: "Importance of Reed Blocks", order: 5, paragraphs: [
                        ReedBlockText(text: "The design and manufacturing of **reed blocks** are fundamental technical and technological elements that largely determine the acoustic quality of a modern concert accordion. The design of **reed blocks**, the dimensioning of **reed chambers**, and combinations of different **wood** types in the construction of **wooden elements** and indentations in the **reed chambers** for larger **free reed** oscillation amplitudes are constantly modified and improved in line with contemporary knowledge and research findings."),
                        ReedBlockText(text: "The method of **reed block** production is continuously refined with new technologies for **wood** processing and surface protection against external influences, so the most renowned accordion manufacturers keep their **reed block** manufacturing process a technological secret. Recently, **reed block** production has been undertaken by specialized companies with highly automated **wood** processing machines, such as RCR Ragnini Cristian Rolando & C.Sas from Castelfidardo.")])
                ])
                
                // MARK: -------------------------------------------------- 11.4. RIGHT-HAND REED BLOCK --------------------------------------------------
                let reedBlockRightHand = ReedBlockSection(title: "Right-Hand Reed Blocks", order: 5, subsections: [
                    ReedBlockSubsection(title:"Right-Hand Reed Blocks", order: 1, paragraphs: [
                        ReedBlockText(text: "**Right-hand reed blocks** are meticulously designed to adapt to the specific number, arrangement, and frequency of the tones they produce. Their construction is vital for the instrument's acoustic performance.")]),
                    ReedBlockSubsection(title: "Shape and Dimensions", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            **Right-hand reed blocks** often have a **trapezoidal shape** along their longitudinal axis, meaning their height gradually decreases.  
                            \u{25CF}\tThe **greatest height** is at the end holding the **reed chambers** for **low frequencies**.  
                            \u{25CF}\tThe **smallest height** is at the opposite end, where the chambers for **high frequencies** are located.
                            """),
                        ReedBlockText(text: """
                        **Height examples:**  
                        \u{25CF}\tFor **nominal frequency** tones: around 60 mm (for lower tones) down to 36 mm (for higher tones).  
                        \u{25CF}\tFor tones an **octave lower**: from 62 mm (for lower tones) to 45 mm (for higher tones).
                        """)]),
                    ReedBlockSubsection(title: "Mounting Lug", order: 3, paragraphs: [
                        ReedBlockText(text: """
                            At the end of the **reed block** with the tallest chambers (for the lowest tones), you'll find a **prismatic mounting lug**.  
                            \u{25CF}\tThis **lug** serves to **firmly attach the reed block** to the upper side of the right-hand accordion body, by being placed beneath the **reed block** holder.  
                            \u{25CF}\tThe contacting surface of the **reed block base** on this **lug** has a slight incline for **easier installation**.  
                            \u{25CF}\tThe **lug's height** is identical across all **reed blocks** that are installed under the same holder, as it depends on the holder's position.
                            """,imageName: "11.4._rb_lug", imageTitle: "Mounting Lug")]),
                    ReedBlockSubsection(title: "Specific Dimensions (1960s reference)", order: 4, paragraphs: [
                        ReedBlockText(text: """
                            In accordions from the 1960s, **reed chambers** on the right side were typically 15 mm wide, separated by **divider walls** about 5 mm thick.  
                            \u{25CF}\tChamber heights ranged from 50 mm (for low tones) down to 18 mm (for high tones).  
                            \u{25CF}\tThe **reed chamber cover** had a thickness ranging from 5 mm to 10 mm.  
                            \u{25CF}\tThe rectangular **airflow** openings on the **reed block base** were commonly 10 mm wide and 11 mm long.  
                            \u{25CF}\tThe **longitudinal central support** varied in thickness among different **right-hand reed blocks**.  
                            \u{25CF}\tOpenings on the **reed block base** were in the center of the **reed chambers**, with a **spacing** of typically 10 mm. The **perforation pitch** of the **base** was 20 mm, which had to be identical to the **pitch** of the openings on the **valve board** and the distance between valves for proper **airflow**.
                            """),
                        ReedBlockText(text: "**Important**: The dimensions of **reed chambers** and other **reed block** parts are **not standardized** and vary between manufacturers and models. Given that modern concert accordions have reduced in size and weight compared to 1960s instruments, **reed block** dimensions have also been partially reduced.",imageName: "11.4._rb_specific_dimension", imageTitle: "Settimio Soprani Artist VI Professional")]),
                    ReedBlockSubsection(title: "Reed Block Base Angle", order: 5, paragraphs: [
                        ReedBlockText(text: """
                            On **right-hand reed blocks**, the **base** isn't at a right angle to the **longitudinal central support**.  
                            \u{25CF}\tThis creates an **additional angle** for the **reed plates** relative to the slant of the side walls.  
                            \u{25CF}\tThe **base angle (α)** relative to the **longitudinal central support** ranges from **92° to 98°** (viewed clockwise in the frontal plane on the side of greater **reed block** height).  
                            \u{25CF}\tThis small **angling** of the **reed block** allows for an optimal arrangement of **reed plates** within the right-hand accordion body, improving static pressure during **bellows** operation and enhancing space utilization. More internal space allows for advanced **bass reed block** designs.  
                            \u{25CF}\tThe correct arrangement of **reed blocks** is crucial for **sound wave** formation and propagation, especially when playing chords.  
                            \u{25CF}\tOptimal positioning of right-hand and left-hand **reed blocks** prevents them from colliding when the **bellows** are fully closed, which allows for a thinner **bellows** and reduces the overall size of the accordion.  
                            \u{25CF}\tThe **base angle** is especially important for **baritone bass systems**, where the **reed blocks** for extremely low tones on the left side are significantly taller than in accordions with a **Stradella bass system**.
                            """)]),
                    ReedBlockSubsection(title: "Stability and Sealing", order: 6, paragraphs: [
                        ReedBlockText(text: """
                            **Standard construction reed blocks** must sit firmly on the **valve board** to ensure the **base** is stable and provides airtightness for the **reed chambers**.  
                            \u{25CF}\tFor greater stability and better sealing, long reed blocks are sometimes divided into **two shorter reed blocks**. These are attached not only at the ends of the accordion body but also in the middle (where the register mechanism is located).  
                            \u{25CF}\tTwice the number of shorter **reed blocks** are used in some models for the American market, where all **reed blocks** are positioned parallel to the **airflow**.
                            """)]),
                    ReedBlockSubsection(title: "Final Adjustment", order: 7, paragraphs: [
                        ReedBlockText(text: "**Waxing** the **reed plates** onto the **reed blocks** is one of the final operations. It's done only after the **reed block's mounting lug** dimensions are fully synchronized with the accordion's body. At this stage, it's critical to adjust the width of the **reed block base** to their relative positions, ensuring the **alignment** of the **airflow** openings through the **reed chambers** with the openings on the **valve board**.")])
                ])
                
                // MARK: -------------------------------------------------- 11.5. RIGHT-HAND REED BLOCK CONSTRUCTION --------------------------------------------------
                let reedBlockRightHandConstruction = ReedBlockSection(title: "Right-Hand Reed Block Construction", order: 6, subsections: [
                    ReedBlockSubsection(title: "Right-Hand Reed Block Construction", order: 1, paragraphs: [
                        ReedBlockText(text: """
                            The construction of **right-hand reed blocks** varies among manufacturers and models. A classic example is a **four-voice piano accordion** with **41 distinct tones** on the right side, featuring two **voices** in the **treble** (outside the **cassotto**) and two **voices** in the **cassotto**, with body dimensions of **470 x 200 mm**. These characteristics are typical for the most common piano accordions, regardless of whether they have a **Stradella bass system** or a **baritone bass system**. The **reed block** construction for this piano accordion model can be considered a classic variant, while **button accordions** feature a wider range of specific design solutions.  
                            In **four-voice piano accordions**, the most common **voices** are **bassoon, clarinet, soprano, and piccolo**.
                            """)]),
                    ReedBlockSubsection(title: "Reed Blocks for Bassoon and Clarinet Voices", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            These **reed blocks** are larger and carry **reed plates** for the **lowest frequencies**. The largest **reed plate** is placed first in the sequence and produces the lowest tone playable on the accordion.  
                            \u{25CF}\t**Primary Tone Reed Block:** Contains **24 reed plates**, arranged side-by-side.  
                            \u{25CF}\t**Accidental Tone Reed Block:** Contains **17 reed plates**, with empty **reed chambers** between them, analogous to the black keys of a piano keyboard.
                            """),
                        ReedBlockText(text: """
                        **Module and Reed Block Dimensions:**  
                        \u{25CF}\t**Reed plate** thickness: **3 mm**  
                        \u{25CF}\t**Reed plate** width: **16.5 mm**  
                        \u{25CF}\t**Reed plate spacing:** **0.82 mm**  
                        \u{25CF}\t**Reed plate height** for **bassoon: 54-35 mm** (primary tones), **54-36 mm** (accidental tones).  
                        \u{25CF}\t**Reed plate height** for **clarinet: 51-27 mm** (primary and accidental tones).  
                        \u{25CF}\t**Longitudinal central support (ARK)** thickness: **4 mm** (lower tones), **11 mm** (higher tones).
                        """),
                        ReedBlockText(text: """
                        **Valves:**  
                        \u{25CF}\tFor lower tones: **Leather valves with polymer springs**.  
                        \u{25CF}\tFor higher tones: **Polyethylene terephthalate (PET)** strips with reinforcements.  
                        \u{25CF}\tFor the highest tones: Without **one-way valves** (or non-return valves).
                        """)]),
                    ReedBlockSubsection(title: "Reed Blocks for Soprano and Piccolo Voices", order: 3, paragraphs: [
                        ReedBlockText(text: """
                            These **reed blocks** are smaller and located in the **treble side**, carrying **reed plates** for the **highest frequencies**. They hold the smallest **reed plate**, which creates the highest tone playable on the accordion.  
                            \u{25CF}\t**Reed plate** dimensions are the same as for **bassoon-clarinet reed blocks** (**3 mm** thickness, **16.5 mm** width, **0.82 mm spacing**).  
                            \u{25CF}\tThe **longitudinal central support (ARK)** has the same thickness **(4-11 mm)**.  
                            \u{25CF}\tSome **reed plates** for high tones **(b³-a⁴)** have a **plate thickness of 2 mm** and are oriented oppositely to other **reed plates**, without **one-way valves**.  
                            \u{25CF}\t**Reed plate height for soprano: 51 mm** (lowest primary and accidental tones) to **27 mm** (highest primary and accidental tones).  
                            \u{25CF}\t**Reed plate height for piccolo: 44-21 mm** (primary and accidental tones).
                            """),
                        ReedBlockText(text: """
                        **Common Reed Block Characteristics:**  
                        \u{25CF}\tThe **total length** of all **reed blocks** (including **mounting lugs** in the **treble** and **cassotto**) must be **identical**.  
                        \u{25CF}\t**Reed blocks** for primary and accidental tones of the same pair of **voices** are typically **identical**, with only minor differences in **reed plate** height.
                        """)]),
                    ReedBlockSubsection(title: "Factors Influencing Reed Block Construction Differences", order: 4, paragraphs: [
                        ReedBlockText(text: """
                            While **reed blocks** on professional accordions may look similar, they differ significantly acoustically due to the following factors:  
                            **Piano Accordions:**  
                            \u{25CF}\tThe number of distinct tones on the right side directly affects the number of **reed plates** on the **reed blocks**, which are divided into **primary tone reed blocks** and **accidental tone reed blocks** according to the **keyboard concept** and **mechanical system** of the accordion.  
                            \u{25CF}\tConcert piano accordions with **41 distinct tones** on the right side have **24 reed plates** on their **primary tone reed blocks** and **17 reed plates** on their **accidental tone reed blocks**.  
                            \u{25CF}\tStandard piano accordions designed for folk music may have some **primary tone reed plates** on the **accidental tone reed blocks** to avoid large dimensional differences between the **reed blocks**.
                            """),
                        ReedBlockText(text: """
                        **Button Accordions:**  
                        \u{25CF}\t**Reed blocks** are not divided into primary and accidental tones as in piano accordions, but rather according to the **mechanical system concept** and the position of the keys on the **keyboard**.  
                        \u{25CF}\tDue to differences in **key arrangement systems**, the layout of **reed plates on button accordions** directly depends on the **mechanical system** and the number of distinct tones on the right side of the accordion. Therefore, it's not possible to uniquely define the arrangement of **reed plates** on **button accordion reed blocks** by a predetermined rule.  
                        \u{25CF}\tIn professional concert **button accordions** with **55, 58, 61, or 64 distinct tones** on the right side and a modern **mechanical system**, the sequence of **reed plates** on the **reed blocks** corresponds to the sequence of keys in the primary rows of the **right-hand keyboard**:  
                        \t**-\tOuter Reed Block:** Key sequence of the first primary row.  
                        \t**-\tMiddle Reed Block:** Key sequence of the second primary row.  
                        \t**-\tInner Reed Block:** Key sequence of the third primary row.  
                        \u{25CF}\tThe outer and inner **reed blocks** almost always have the **same number of reed plates**, while the middle **reed block** usually has one more.  
                        \u{25CF}\tThe number of tones increases by adding one **reed plate** to each of the three **reed blocks** (e.g., an accordion with **55 distinct tones** has **19 reed plates** on the middle **reed block**, and **18** each on the outer and inner **reed blocks**). The largest **keyboard** can have **64 distinct tones**.
                        """),
                        ReedBlockText(text: """
                        **Accordion Voice Type:**  
                        \u{25CF}\tThe arrangement of **reed plates** directly depends on the **voices**. If an accordion, for instance, does not have a **piccolo voice**, it will not have a **reed block** with the smallest **reed plate** sizes that produce the highest frequency tones.  
                        \u{25CF}\tIf an accordion does not have a **cassotto**, the **reed blocks** will be adapted to that **acoustic configuration**.
                        """)]),
                    ReedBlockSubsection(title: "Conclusion", order: 5, paragraphs: [
                        ReedBlockText(text: "The construction of **reed blocks** and the arrangement of **reed plates** cannot be considered independently from the accordion's **mechanical system** and **valve board**. The position of each **reed plate** on the **reed block** must be adequately determined by the positions of the **valves**, especially in **button accordions**.")])
                ])
                
                // MARK: -------------------------------------------------- 11.6. LEFT-HAND REED BLOCK CONSTRUCTION --------------------------------------------------
                let reedBlockLeftHandConstruction = ReedBlockSection(title: "Left-Hand Reed Block Construction", order: 7, subsections: [
                    ReedBlockSubsection(title: "Left-Hand Reed Block Construction", order: 1, paragraphs: [
                        ReedBlockText(text: "The construction of an accordion's **left-hand reed blocks** directly depends on the number of **voices** on the left side and the type of **bass system**. Modern concert accordions use two main types of left-hand **reed blocks**: those for the **Stradella bass system** and those for the **baritone bass system**.")]),
                    ReedBlockSubsection(title: "Reed Blocks for the Stradella Bass System", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            Accordions with a **Stradella bass system** most commonly have **five voices** on the left side. These **voices** are distributed across:  
                            \u{25CF}\t**Two reed blocks** (each with two voices).  
                            \u{25CF}\t**One half reed block** (with a single voice).
                            """),
                        ReedBlockText(text: """
                        **Stradella bass system reed blocks** have identical **reed chamber** and **reed plate** dimensions for the same **voice**. The arrangement of **voices** is as follows:  
                        \u{25CF}\t**Low-Tone Reed Block:** This is the largest **reed block** and contains **reed plates** for the **bass** and **tenor voices**.  
                        \u{25CF}\t**High-Tone Reed Block:** This **reed block** is smaller and contains **reed plates** for the **contralto** and **alto voices**.  
                        \u{25CF}\t**High-Tone Half Reed Block:** This is the smallest **half reed block** and contains **reed plates** for the **soprano voice**.
                        """)]),
                    ReedBlockSubsection(title: "Reed Blocks for the Baritone Bass System", order: 3, paragraphs: [
                        ReedBlockText(text: """
                            Concert accordions with a **baritone bass system** offer more diverse configurations:  
                            **1)\tTwo Baritone Bass Voices (55 or 58 distinct tones):**  
                            This configuration requires **three reed blocks**:  
                            \u{25CF}\tOne **low-tone reed block** (with 14 or 15 **reed plates**).  
                            \u{25CF}\tTwo **high-tone reed blocks** (one with 20 or 21 **reed plates**, and the other with 21 or 22 **reed plates**).  
                            **2)\tThree Baritone Bass Voices (58 distinct tones):**  
                            This configuration includes:  
                            \u{25CF}\tA **combined low-tone reed block** (with 15 **reed plates**).  
                            \u{25CF}\t**Low and high-tone reed blocks** (with two voices).  
                            \u{25CF}\tA **high-tone reed block** (with a single **baritone bass voice**).  
                            \u{25CF}\tIn total, 43 **reed plates** are distributed across these **reed blocks**.
                            """)])
                ])
                
                // MARK: -------------------------------------------------- 11.7. STRADELLA BASS SYSTEM REED BLOCKS --------------------------------------------------
                let reedBlockStradellaSystem = ReedBlockSection(title: "Stradella Bass System Reed Blocks", order: 8, subsections: [
                    ReedBlockSubsection(title: "Stradella Bass System Reed Blocks", order: 1, paragraphs: [
                        ReedBlockText(text: "**Bass reed blocks** on the left side of the accordion, while similar in construction to right-hand **reed blocks**, differ in shape and dimensions, tailored to the **bass system**. For the **Stradella bass system**, left-hand **reed blocks** each have twelve **reed chambers** and come in three primary forms:"),
                        ReedBlockText(text: """
                            **Low-Tone Reed Block (Primary Bass Reed Block):**  
                            \u{25CF}\tThe largest **reed block** with two sets of **reed plates**.  
                            \u{25CF}\tProduces primary and accidental tones of the chromatic scale for the **bass** and **tenor voices**, spanning one octave.
                            """),
                        ReedBlockText(text: """
                        **High-Tone Reed Block:**  
                        \u{25CF}\tSmaller than the **low-tone reed block**, also with two sets of **reed plates**.  
                        \u{25CF}\tCreates primary and accidental tones of the chromatic scale for primary basses and fixed chords for the **contralto** and **alto voices**, spanning one octave.
                        """),
                        ReedBlockText(text: """
                            **High-Tone Half Reed Block:**  
                            \u{25CF}\tThe smallest, with a single set of **reed plates**.  
                            \u{25CF}\tProduces primary and accidental tones of the chromatic scale for primary basses and fixed chords for the **soprano voice**, spanning one octave.
                            """,imageName: "11.6._rb_stradella_system", imageTitle: "Standard Bass System Reed Blocks")]),
                    ReedBlockSubsection(title: "Dimensions and Characteristics", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            **Low-Tone Reed Block:**  
                            \u{25CF}\tGreatest height: up to 80 mm.  
                            \u{25CF}\t**Reed block base** width: around 43 mm.
                            Dimensions of openings on the **reed block base**: 14x12 mm (for **bass voice**), 12x12 mm (for **baritone voice**).  
                            \u{25CF}\t**Longitudinal central support** thickness: 4-5 mm.  
                            \u{25CF}\t**Reed chamber** height for **bass voice**: around 60 mm.  
                            \u{25CF}\t**Reed chamber** height for **baritone voice**: around 50 mm.
                            """),
                        ReedBlockText(text: """
                        **High-Tone Reed Block:**  
                        \u{25CF}\t**Reed chamber** height is smaller than on the **low-tone reed block**.  
                        \u{25CF}\tChamber height: around 46 mm (for **contralto voice**), around 42 mm (for **alto voice**).
                        """),
                        ReedBlockText(text: """
                        **High-Tone Half Reed Block:**  
                        \u{25CF}\tSmallest **reed chamber** height, consistent across the entire **half reed block**: around 35 mm (for **soprano voice**).
                        """),
                        ReedBlockText(text: """
                        **General Dimensions of Left-Hand Reed Blocks:**  
                        \u{25CF}\t**Reed chamber** width: most commonly 15 mm (identical for all).  
                        \u{25CF}\t**Divider wall** thickness: around 10 mm.  
                        \u{25CF}\t**Reed plate spacing** (pitch): around 25 mm. For larger **reed blocks**, the **pitch** can be 26 mm or 27 mm, with wider chambers (16-17 mm), but maintaining a **divider wall** thickness of about 10 mm.  
                        \u{25CF}\t**Airflow** openings on the **high-tone reed block** and **half reed block**: most commonly 10x10 mm, but always smaller than the openings on the **low-tone reed block**.  
                        \u{25CF}\tActive **reed block** length: around 310 mm (for 25 mm pitch), 320 mm (for 26 mm pitch), 335 mm (for 27 mm pitch).  
                        \u{25CF}\tThe total length of the **reed block** with **mounting lugs** is adjusted to the size of the left-hand accordion body. 
                        \u{25CF}\tThe height of left-hand **reed blocks** depends on the size of the **reed plates** – they're largest on the **low-tone reed block** and smallest on the **high-tone half reed block**.  
                        \u{25CF}\t**Important:** The size of the **reed block**, the number of **reed chambers**, and the number of **reed plates** in the **Stradella bass system** do **not** depend on the number of keys on the left-hand keyboard.
                        """)]),
                    ReedBlockSubsection(title: "Reed Plate Arrangement", order: 3, paragraphs: [
                        ReedBlockText(text: "The arrangement of 12 **reed plates** for chromatic scale tones within a single octave is **identical on all left-hand reed blocks** in the **Stradella bass system**, following the musical scale. These tones can be within the same octave or structured across two adjacent octaves."),
                        ReedBlockText(text: """
                        The most common arrangement is **C-B**, which follows the order of chromatic scale tones: C, C#/Db, D, D#/Eb, E, F, F#/Gb, G, G#/Ab, A, A#/Bb, and B. Other arrangement systems used by individual manufacturers on their accordion models include:  
                        \u{25CF}\t**F#/Gb-F:** F#/Gb, G, G#/Ab, A, A#/Bb, B, C, C#/Db, D, D#/Eb, E, and F.  
                        \u{25CF}\t**Quintuplet arrangement:** F#/Gb, C#/Db, G#/Ab, D#/Eb, A#/Bb, B, E, A, D, G, C, and F.  
                        \u{25CF}\tOther variations.
                        """),
                        ReedBlockText(text: "The arrangement of **reed plates** on the **reed blocks** directly depends on the **left-hand mechanical system** of the accordion and is irrelevant to the performer, for whom only the arrangement of tones on the left-hand keyboard keys is important during performance.", imageName: "11.6._rb_stradella_bass", imageTitle: "Bass Reed Block")]),
                    ReedBlockSubsection(title: "Special Constructions for Acoustic Effects", order: 4, paragraphs: [
                        ReedBlockText(text: "To achieve an **additional resonant effect** for low tones on the left side of the accordion (particularly characteristic for jazz accordions), the **reed chamber** is extended with an additional channel that brings **airflow** to the **reed**, so the tips of one set of **reeds** are located at the **reed block base**."),
                        ReedBlockText(text: "\u{25CF}\t**Reed blocks** with this construction are **thicker** due to the doubled chamber length, which enhances the resonant effect during **sound wave** creation."),
                        ReedBlockText(text:"\u{25CF}\tNewer design solutions for **low-tone reed blocks** with extended **reed chambers** involve placing an additional **reed block** extension at a 90° angle relative to the main **reed block** body with its **base**. This **angled construction** of the **low-tone reed block** allows one set of **reed plates** for a single **voice** to be placed perpendicular to the position of the **free reeds** for other **voices** on the left side, thereby achieving a special acoustic effect.",imageName: "11.6._rb_angular_bass_side",imageTitle: "Angular Bass Reed Block Side View"),
                        ReedBlockText(text: "\u{25CF}\tAlmost all modern professional concert accordion models with a **Stradella bass system** use this **angled construction** for their **low-tone reed blocks**.",imageName: "11.6._rb_angular_bass", imageTitle: "Angular Bass Reed Block Front View"),
                        ReedBlockText(text: "To achieve maximum **stiffness** between the **reed block** and the **reed plates**, and thus create special acoustic effects for a strong, sharp, and rich sound on the left side of the accordion, some manufacturers frequently install **reed plates** for the **bass** and **tenor voices** on the **low-tone reed block** in a **reed bank** (or block assembly). This design solution is inspired by the Russian bayan, which uses a single metal plate with openings for all **reeds** along the entire side of the **low-tone reed block**, instead of individual plates for each tone.", imageName: "11.6._rb_russian_bayan", imageTitle: "Cassette Reed Blocks"),
                        ReedBlockText(text: "The position of the **reed block** within the left-hand accordion body, and thus the position of the **free reeds** relative to the direction of **airflow**, significantly impacts the accordion's acoustic performance. **Reed blocks** are installed in the left-hand body in accordance with the **mechanical system** and **bass mechanism** of the accordion. For example, with a C-B (H) arrangement, the **reed plates** for the C tone are on the lower side of the left-hand body, while **reed plates** with higher frequencies are on the upper side."),
                        ReedBlockText(text: "All left-hand **reed blocks** have an identical total length including their **mounting lugs**, and the same **mounting lug** height. Left-hand **reed blocks** rest their **bases** on the **valve board** and are attached by easily detachable **mounting lugs**, allowing each **reed block** to be removed independently to check the oscillation frequency of each **free reed** and then reinstalled.")])
                ])
                
                // MARK: -------------------------------------------------- 11.8. CLASSIC CONSTRUCTION OF STRADELLA BASS SYSTEM --------------------------------------------------
                let reedBlockClassicConstruction = ReedBlockSection(title: "Classic Construction of Stradella Bass System", order: 9, subsections: [
                    ReedBlockSubsection(title: "Classic Construction of Stradella Bass System", order: 1, paragraphs: [
                        ReedBlockText(text: "The construction of **Stradella bass system reed blocks** is precisely dimensioned to ensure a balanced **sound intensity** between the left and right sides of the accordion. Excessive dominance from the left side diminishes melodic expression, while a weak bass reduces the impact of chord accompaniment."),
                    ReedBlockText(text: """
                        The classic construction of left-hand **reed blocks** is unified and includes:  
                        \u{25CF}\t**Low-Tone Reed Block (Primary Bass Reed Block):** Most commonly used. **Reed plates** for the **bass voice** are on the inner side (facing the **high-tone reed block**), while those for the **tenor voice** are on the outer side (facing the rear of the left-hand accordion body).  
                        \u{25CF}\t**High-Tone Reed Block**.  
                        \u{25CF}\t**High-Tone Half Reed Block**.  
                        Besides the classic design, **reed blocks** with **reed banks** (or block assemblies), extended **reed chamber** channels, or **angled low-tone reed blocks** can also be used.
                        """)]),
                    ReedBlockSubsection(title: "Reed Plate and Reed Block Characteristics", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            \u{25CF}\t**Valves:** All **reed plates** on **Stradella bass system reed blocks** primarily use **leather valve straps with metal leaf springs** as **valves**.  
                            \u{25CF}\t**Opening Pitch:** On the **bass valve board**, the **pitch **between **airflow** openings into the **reed chambers** is most commonly **25 or 26 mm**.  
                            \u{25CF}\t**Reed Plate Dimensions:** Although left-hand **reed blocks** contain reeds for identical frequencies as the right side, the **reed plate** dimensions do differ slightly. **Reed plates** for the lowest tones of the **bass voice** often don't exist on the right side, as such low frequencies aren't present there.  
                            \u{25CF}\t**Mounting Technology: Reed plates** are mounted and **waxed** onto left-hand **reed blocks** in a manner identical to that of right-hand **reed blocks**.
                            """),
                    ReedBlockText(text: """
                        **Specific Reed Plate Dimensions:**  
                        **Plate Thickness:**  
                        \u{25CF}\t**Bass voice**: 7 mm  
                        \u{25CF}\t**Tenor voice**: 6.5 mm  
                        \u{25CF}\t**Contralto, Alto, Soprano voices**: 3.5 mm  
                        **Plate Width (for 26 mm pitch reed blocks):**  
                        \u{25CF}\t**Bass voice**: 23 mm (**spacing** 3 mm)  
                        \u{25CF}\t**Tenor voice**: 20.5 mm (**spacing** 5.5 mm)  
                        \u{25CF}\t**Contralto, Alto, Soprano voices**: 16.5 mm (**spacing** 9.5 mm) on the **high-tone reed block and high-tone half reed block**.  
                        \u{25CF}\tThe width of 16.5 mm is identical to the width of **reed plates** on the right side of the accordion and for the **baritone bass system**.  
                        **Reed Plate Height:**  
                        \u{25CF}\t**Bass voice**: 67 mm  
                        \u{25CF}\t**Tenor voice**: 58.5 mm  
                        \u{25CF}\t**Contralto voice**: 49 mm  
                        \u{25CF}\t**Alto voice**: 46 mm  
                        \u{25CF}\t**Soprano voice**: 39.5 mm
                        """)]),
                    ReedBlockSubsection(title: "Mounting Lugs and Bases", order: 3, paragraphs: [
                        ReedBlockText(text: """
                            **Prismatic Mounting Lug Height:** Approximately 15 mm for all left-hand **reed blocks**, matching the height of the **reed block** holders and the lower **stop** where the **reed block connectors** are installed.  
                            **Base Arrangement:** The **reed block base** of the **low-tone reed block** rests on a **retaining pin**, while the **bases** of the **high-tone reed block** and **high-tone half reed block** are positioned adjacent to each other.  
                            **Base Width:**  
                            \u{25CF}\t**Low-tone reed block**: Approximately 43 mm  
                            \u{25CF}\t**High-tone reed block**: 34 mm  
                            \u{25CF}\t**High-tone half reed block**: 19 mm  
                            \u{25CF}\t**Total width of all Stradella bass system reed block bases**: Approximately 96 mm.  
                            **Base Length:** Approximately 354 mm for all left-hand **reed blocks** (for standard **mechanical system** construction).  
                            **Mounting Lug Length:** Differs for the **low-tone reed block** compared to the **high-tone reed block** and **half reed block** due to variations in the dimensions of the openings on the **reed block base**.
                            """)]),
                    ReedBlockSubsection(title: "Position and Orientation", order: 4, paragraphs: [
                        ReedBlockText(text: """
                            Conventional **Stradella bass system reed blocks** are positioned so that the sets of **free reeds** for the **bass** and **contralto voices** are next to the sets for the **alto** and **soprano voices**. The empty side of the **high-tone half reed block** faces the bass register mechanism.  
                            \u{25CF}\t**Low-Tone Reed Block Base:** Perpendicular to the **reed block** body.  
                            \u{25CF}\t**High-Tone Reed Block and Half Reed Block Bases:** Positioned at a small angle (3° to 5°) to optimally direct the **airflow** and correctly distribute the space between **reed blocks** for the required oscillation amplitude of the **free reeds**.
                            """)])
                ])
                
                // MARK: -------------------------------------------------- 11.9. BARITONE BASS SYSTEM REED BLOCK --------------------------------------------------
                let reedBlockBaritoneBass = ReedBlockSection(title: "Baritone Bass System Reed Blocks", order: 10, subsections: [
                    ReedBlockSubsection(title: "Baritone Bass System Reed Blocks", order: 1, paragraphs: [
                        ReedBlockText(text: "**Baritone bass system reed blocks** on the left side of the accordion differ significantly from the **Stradella bass system**. They feature a greater number of **reed plates** and **reed chambers** of varying heights, enabling the production of individual tones across a much wider range than a single octave. These accordions are designed so that the left-hand **reed blocks** function simultaneously for both the **baritone bass system** and the **Stradella bass system**.", imageName: "11.9._rb_bariton_bass", imageTitle: "Baritone Bass System Reed Blocks")]),
                    ReedBlockSubsection(title: "Structure and Module Count", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            **Baritone bass system reed blocks consist of one low-tone reed block and two or more high-tone reed blocks**.  
                            The **low-tone reed block** is similar to the one found in the **Stradella bass system**. The number of **reed plates** on it depends on the total number of distinct **baritone bass** tones:  
                            \u{25CF}\tFor 58 distinct **baritone bass** tones: 15 **reed plates** per **voice**.  
                            \u{25CF}\tFor 55 distinct **baritone bass** tones: 14 **reed plates**.  
                            \u{25CF}\tFor a smaller number of **baritone bass** tones: 12 **reed plates** (in this case, the **baritone bass system low-tone reed block** is quite similar to the **Stradella bass system low-tone reed block)**.  
                            The **high-tone reed blocks** are quite similar to the right-hand **reed blocks**. If an accordion has two **baritone bass voices**, there are usually two **high-tone reed blocks** on which the **reed plates** of the chromatic scale's tone sequence are alternately arranged up to the highest frequency tone.
                            """, imageName: "11.9._rb_55free_bass", imageTitle: "Stradella and C-System Chromatic Free-bass")]),
                    ReedBlockSubsection(title: "Reed Block Arrangement within the Body", order: 3, paragraphs: [
                        ReedBlockText(text: """
                            \u{25CF}\tThe **low-tone reed block** is most often placed first, next to the left-hand register mechanism, meaning near the keyboard on the front side of the left-hand accordion body.  
                            \u{25CF}\tBehind it are the **high-tone reed blocks**: one is **inner** (in the middle of the body, immediately next to the **low-tone reed block**), and the other is **outer** (near the rear of the left-hand accordion body).
                            """),
                        ReedBlockText(text: """
                            Number of Modules on High-Tone Reed Blocks (Examples):  
                            \u{25CF}\tFor 58 distinct **baritone bass** tones: The inner **high-tone reed block** has 21 **reed plates**, and the outer one has 22 **reed plates**.  
                            \u{25CF}\tFor 55 distinct **baritone bass** tones: The inner **high-tone reed block** has 20 **reed plates**, and the outer one has 21 **reed plates**.
                            """)]),
                    ReedBlockSubsection(title: "Modern Concert Accordions (58 Tones, Three Voices)", order: 4, paragraphs: [
                        ReedBlockText(text: """
                            Modern concert accordions with 58 distinct tones and three **baritone bass voices** have a specific module arrangement:  
                            \u{25CF}\tOne **reed block** with two **low-tone voices**.  
                            \u{25CF}\tOne **half reed block** with one **high-tone voice**.
                            """),
                    ReedBlockText(text: "On the **low-tone reed block** (with two **voices**), 15 **reed plates** are arranged in a **reed bank** with extended **reed chambers**. On the **half reed block**, 15 individual **reed plates** are installed. The remaining 43 **reed plates** for the three **voices** are distributed across three additional **reed blocks**: two **low and high-tone reed blocks**, and one **high-tone reed block**."),
                    ReedBlockText(text: "To arrange 43 **reed plates** sequentially according to the chromatic scale for three **voices**, a design solution involving **two-part valves** and a **reed block** arrangement in accordance with the **mechanical system** is used. In this case, the **low-tone reed block** is not first next to the register mechanism; instead, the **high-tone half reed block** is, which is significantly lower and prevents collision with the oscillating low-tone **reeds.**")]),
                    ReedBlockSubsection(title: "Module Adaptation and Acoustic Effects", order: 5, paragraphs: [
                        ReedBlockText(text: "The size of **reed plates** on **baritone bass system reed blocks** generally decreases gradually with increasing oscillation frequency. However, there are exceptions, where the plate thickness on the **low-tone reed block** (for the 16' **voice**) might not be the same for all **reed plates**. Additionally, the **low-tone reed block** can have several smaller **reed plates**, and similarly, **high-tone reed blocks** can have 4 or 5 larger **reed plates** for the lowest frequencies. Combining **reed plates** for tones from different octaves achieves a richer **baritone bass** tone in a concert accordion."),
                    ReedBlockText(text: "If the **bass system** requires a large number of low frequencies that cannot be accommodated on a single **low-tone reed block**, some **reed plates** are also placed on **high-tone reed blocks** that have larger **reed chambers** at one end. In such cases, these **reed blocks** serve simultaneously as **low and high-tone reed blocks**. The increased height of **high-tone reed blocks** at one end can adversely affect the stability of the **reed block base's** seating on the **valve board**. Stability is then improved by **transverse connecting elements** (braces) that connect the **high-tone reed blocks** into a single unit, ensuring greater static **stiffness**.")])
                ])
                
                // MARK: -------------------------------------------------- 11.10. BARITONE BASS BLOCK: TWO-VOICE DESIGN --------------------------------------------------
                let reedBlockTwoVoice = ReedBlockSection(title: "Baritone Bass Blocks: Two-Voice Design", order: 11, subsections: [
                    ReedBlockSubsection(title: "Baritone Bass Blocks: Two-Voice Design", order: 1, paragraphs: [
                        ReedBlockText(text: """
                        The classic construction of the **baritone bass system reed block** applies to accordions with two **baritone bass voices**. In these cases, the **reed plates** for 55 or 58 different **baritone bass** tones are distributed across three **reed blocks**:  
                        \u{25CF}\t**Low-Tone Reed Block:** The largest, positioned near the left-hand register mechanism (i.e., towards the front of the left-hand accordion body).  
                        \u{25CF}\t**Inner High-Tone Reed Block:** Significantly lower in height, located in the center of the left-hand accordion body.  
                        \u{25CF}\t**Outer High-Tone Reed Block:** Also significantly lower in height, situated at the rear of the left-hand accordion body.
                        """)]),
                    ReedBlockSubsection(title: "Low-Tone Reed Block Characteristics", order: 2, paragraphs: [
                        ReedBlockText(text: """
                            **1)\tLongitudinal Central Support:** Has a consistent thickness of **1.8 mm**, ensuring the same **reed chamber** depth for all **reed plates**, both for the 16' **voice** and the 8' **voice**.  
                            **2)\tReed Chamber Depth:**  
                            \u{25CF}\tFor the 16' voice: 9.2 mm (at the **reed block base**) up to 17 mm (at the top, where the **reed** oscillates).  
                            \u{25CF}\tFor the 8' **voice**: 13 mm (at the **reed block base**) up to 15.5 mm (at the top). The difference is smaller due to the narrower oscillation zone of the **reed** tips.  
                            **3)\tIdentification:** Easily recognizable by its height and the uniformity of its **reed plates**.  
                            **4)\tValves:** All **valves** are **leather valve straps** reinforced with a leaf spring made of highly elastic **polymer**.  
                            **5)\tModule Arrangement:**  
                            \u{25CF}\t**Reed plates** for the 16' **voice** (70 mm long) are on one side.  
                            \u{25CF}\t**Reed plates** for the 8' **voice** (60 mm long) are on the other side.  
                            \u{25CF}\tThe **reed block** is positioned so that the set of **reed plates** for the 8' **voice** is on the outer side (towards the left-hand keyboard and register mechanism, i.e., towards the front of the left-hand accordion body), while the set for the 16' **voice** faces the inner **high-tone reed block**.  
                            **6)\tPosition:** Must be aligned with the **bass mechanism**, so the lowest frequency **reed plates** (E for 16' **voice** and e for 8' **voice**) are on the lower side of the left-hand accordion body.
                            """),
                    ReedBlockText(text: """
                        **Number of Reed Plates on the Low-Tone Reed Block:**  
                        \u{25CF}\tFor 55 distinct **baritone bass** tones: 14 **reed plates** (16' **voice** in the E-f interval, 8' **voice** in the e-f¹ interval).  
                        \u{25CF}\tFor 58 distinct **baritone bass** tones: The **reed block** has the same construction and **reed chamber** dimensions.
                        """),
                    ReedBlockText(text: """
                        **Dimensions of Reed Plates and Openings on the Low-Tone Reed Block (for 55 tones):**  
                        \u{25CF}\t**16' voice**: 23.5 x 70 mm, plate thickness 4.5 mm, **spacing** 3 mm.  
                        \u{25CF}\t**8' voice**: 20.5 x 60 mm, **spacing** 6 mm.  
                        \u{25CF}\t**Rectangular openings** on the **reed block base**: 15 x 14 mm (for 16'), 13.5 x 16 mm (for 8'). The **spacing** between openings is 12 mm, with the rectangular opening in the central part of the **reed chamber**.  
                        \u{25CF}\t**Base Inclination**: At one end, the **reed block base** has a slight incline for effective placement of the **mounting lug** under the **reed block** holder, while the other end is fastened with a special **connector**.
                        """)]),
                    ReedBlockSubsection(title: "High-Tone Reed Block Characteristics", order: 3, paragraphs: [
                        ReedBlockText(text: "Accordions with two **baritone bass voices** (55 or 58 tones) have two **high-tone reed blocks** that are identical in construction and dimensions but are placed in different positions. These **reed blocks** carry **reed plates** for both **baritone bass** and **bass chords** (in the **Stradella bass system** option)."),
                    ReedBlockText(text: """
                        **Number of Reed Plates on High-Tone Reed Blocks (for 58 tones):**  
                        \u{25CF}\t**Outer High-Tone Reed Block:** Typically has 22 distinct tones (16' voice in the g-c³ interval, 8' **voice** in the g¹-c interval). The difference between adjacent tones is one whole step.  
                        \u{25CF}\t**Inner High-Tone Reed Block:** Contains **reed plates** for 21 distinct **baritone bass** tones (16' **voice** in the g#-c³ interval, 8' **voice** in the g#¹-c⁴ interval). The difference between adjacent tones is also one whole step, thus forming a chromatic series across multiple octaves by alternating **reed plate** arrangement on these two **reed blocks**.
                        """),
                    ReedBlockText(text: """
                        **Number of Reed Plates on High-Tone Reed Blocks (for 55 tones):**  
                        \u{25CF}\t**Inner High-Tone Reed Block:** Most commonly has 20 distinct tones (16' **voice** in the g-a³ interval, 8' **voice** in the g¹-a⁴ interval). The difference between adjacent tones is one whole step.  
                        \u{25CF}\t**Outer High-Tone Reed Block:** Contains **reed plates** for 21 distinct **baritone bass** tones (16' **voice** in the f#-a# interval, 8' **voice** in the f#¹-a# interval). The difference between adjacent tones is also one whole step, similar to the inner **high-tone reed block**.
                        """),
                    ReedBlockText(text: """
                        **Thickness of Reed Plates on High-Tone Reed Blocks (for 55 tones, two voices):**  
                        \u{25CF}\tAll **reed plates** are **3.5 mm thick**, except for the last **reed plate** in the 8' **voice** series (tone A#), which has a thickness of **2 mm** and is oriented with its **reed** tip towards the **airflow** entrance into the **reed chamber**.  
                        \u{25CF}\tAll **reed plates are 16.5 mm wide** with a **spacing** of **1.5 mm**.
                        """),
                    ReedBlockText(text: """
                        **Height of Reed Plates on High-Tone Reed Blocks (for 55 tones):**  
                        \u{25CF}\t**Inner High-Tone Reed Block:** 16' **voice** (57-36 mm height), 8' **voice** (51-27 mm height).  
                        \u{25CF}\t**Outer High-Tone Reed Block:** 16' **voice** (57-35 mm height), 8' **voice** (51-25 mm height).
                        """),
                    ReedBlockText(text: """
                        **Openings on the Base of High-Tone Reed Blocks:**  
                        \u{25CF}\t**Inner High-Tone Reed Block:** 16' **voice** (12.5 x 10.5 mm), 8' **voice** (11.5 x 10.5 mm).  
                        \u{25CF}\t**Outer High-Tone Reed Block:** 16' **voice** (13.5 x 10.5 mm), 8' **voice** (11.5 x 10.5 mm), same as for the 8' **voice** on the inner **high-tone reed block**.
                        """),
                    ReedBlockText(text: """
                        **Thickness of the Central Longitudinal Support (ARK) on High-Tone Reed Blocks:**  
                        \u{25CF}\t**Inner High-Tone Reed Block:** 5 mm at one end, 7 mm at the other.  
                        \u{25CF}\t**Outer High-Tone Reed Block:** 5 mm at one end, 11 mm at the other.  
                        \u{25CF}\tThe greater ARK thickness is found at the end of the **reed block** with smaller **reed plates** for higher frequency tones.
                        """)]),
                    ReedBlockSubsection(title: "Important Note on Standardization and Design", order: 4, paragraphs: [
                        ReedBlockText(text: "While these dimensions are typical for the classic construction of the **baritone bass system** in standard modern accordions, the dimensions of **baritone bass system reed blocks** are **not standardized**. Different manufacturers and models of concert accordions have significantly varied design solutions, concerning the number and arrangement of **reed plates**, the geometric shape and dimensions of **reed blocks**, and even the number of **reed blocks** and **half reed blocks** themselves, depending on the number of **baritone bass voices**. The acoustic design of an accordion aims for an optimal construction and arrangement of **reed blocks** for the corresponding left-hand **voices**.")]),
                    ReedBlockSubsection(title: "Valves on High-Tone Reed Blocks", order: 5, paragraphs: [
                        ReedBlockText(text: """
                            \u{25CF}\t**16' voice: Leather valve straps** with **polymer** leaf springs and **Polyethylene terephthalate (PET)** strips with reinforcements at the lower part.  
                            \u{25CF}\t**8' voice: Leather valve straps** with **polymer** leaf springs, **Polyethylene terephthalate (PET)** strips with reinforcements at the lower part, and a certain number of **reed plates** for high-frequency tones are **without one-way valves**.
                            """)]),
                    ReedBlockSubsection(title: "Unique Concert Instruments", order: 6, paragraphs: [
                        ReedBlockText(text: "Modern professional concert accordions, used by world-renowned artists, are often designed and constructed as unique instruments with special acoustic and functional characteristics. In these instruments, each functional assembly of the accordion has an original solution, optimized for performance rather than production costs or selling price. Top-performing concert accordions can even feature **four baritone bass system voices** and over ten **baritone bass registers.** This wide tonal range requires a greater number of **reed blocks** with modified construction to ensure an adequate timbre for the tones of individual **voices**."),
                    ReedBlockText(text: "These concert accordions also use **angled low-tone reed blocks**, where **reed plates** for two **low-tone voices** are positioned perpendicularly, while **reed plates** for the other two **voices** are positioned parallel to the direction of the static air pressure from the **bellows**. The frequency levels of the **baritone bass voices** are adjusted to the performance style, musical genres, and compositions from the performer's repertoire, as well as to their artistic expression.")])
                ])
                
                
                
                modelContext.insert(reedBlock)
                modelContext.insert(reedBlockFunctional)
                modelContext.insert(reedBlockConstruction)
                modelContext.insert(reedBlockAttaching)
                modelContext.insert(reedBlockRightHand)
                modelContext.insert(reedBlockRightHandConstruction)
                modelContext.insert(reedBlockLeftHandConstruction)
                modelContext.insert(reedBlockStradellaSystem)
                modelContext.insert(reedBlockClassicConstruction)
                modelContext.insert(reedBlockBaritoneBass)
                modelContext.insert(reedBlockTwoVoice)
                
            }
        } catch {
            print("Error loading Reed Block data: \(error)")
        }
    }
}

