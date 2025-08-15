import SwiftData
import Foundation

struct ShengData: DataPopulator {
    static var modelType: any PersistentModel.Type { ShengSection.self }
    
    static func populate(modelContext: ModelContext) {
        // MARK: - DATA POPULATION METHOD
        do {
            let sortDescriptor = SortDescriptor<ShengSection>(\.order)
            let fetchDescriptor = FetchDescriptor<ShengSection>(sortBy: [sortDescriptor])
            let sections = try modelContext.fetch(fetchDescriptor)

            if sections.isEmpty {
                // MARK: - THE SHENG -THE OLDEST FREE REED INSTRUMENT

                let oldestInstrumentSheng = ShengSection(title: "The Sheng - The Oldest Free Reed Instrument", order: 1, subsections: [
                    ShengSubsection(title: "The Oldest Free Reed Instrument", order: 1, paragraphs: [
                        ShengText(text: "The sheng is an ancient Chinese musical instrument and one of the oldest in the world that uses the **free reed principle** to create sound. Over the centuries, it served as the foundation for the development of a whole group of similar instruments, including the modern accordion. Due to its shape, it is often called the *Chinese mouth organ* in Western cultures. In the beginning, the Chinese called it *”ju”*, and its name changed throughout history depending on its shape and materials.")
                        ]),
                    ShengSubsection(title: "Origin and History", order: 2,paragraphs: [
                        ShengText(text: "While it's impossible to say for certain when and where the sheng originated, archaeological evidence points to its long history. Instruments found in China's Hubei province are over **2,400 years old**. Research in Hunan province also confirms that the sheng existed around **3,000 BCE**. According to the archaeologist Margius Yi, a sheng with metal reeds existed as early as 433 BCE."),
                        ShengText(text: "The sheng was popular during the reign of all Chinese dynasties. It was especially valued during the time of the philosopher Confucius (551-479 BCE), when it was used in Confucian ceremonial music. This was during the Zhou Dynasty (1122-256 BCE), the longest-ruling dynasty in Chinese history. The sheng has maintained its popularity into the 21st century, being used today in both folk music and as a solo instrument in Chinese operas.")
                    ]),
                    ShengSubsection(title: "The Sheng's Arrival in Europe", order: 3, paragraphs: [
                        ShengText(text: "It is quite uncertain how and when the sheng came to Europe, as there are no reliable written records. It is possible that **Marco Polo** (1254-1324) brought it from China, as he spent 20 years at the court of Emperor Kublai Khan and undoubtedly encountered the instrument. However, the only reliable record states that the French priest and missionary **Jean Joseph Marie Amiot** (1717-1793) brought a sheng from China to Paris in 1777."),
                        ShengText(text: "In the early 19th century, the sheng served as an inspiration for European musical instrument makers, leading to the development of a completely new group of free reed instruments, and ultimately, the modern **concert accordion**.")
                    ]),
                    ShengSubsection(title: "Construction and Playing Method", order: 4, paragraphs: [
                        ShengText(text: """
                            The traditional sheng most often has 17 bamboo pipes of five different lengths, bound into a ring-shaped bundle and inserted into the housing. The housing is cylindrical-paraboloid, made of copper or brass, and serves as the instrument's air chamber.  
                            \u{25CF}\t**Air Chamber:** The housing is surface-protected from corrosion, and its high silver-like shine complements the instrument's harmonious design.  
                            \u{25CF}\t**Bamboo Pipes:** At the ends of the pipes, inside the air chamber, are plates with cut-out free reeds, which function as the sound source. The pipes are symmetrically arranged into two triangular sections, giving the instrument a three-dimensional shape that symbolizes the bent wings of a phoenix.  
                            \u{25CF}\t**Playing:** The performer holds the housing in their palms and produces tones by blowing or drawing air from the air chamber. Tones are created by closing the side holes on the pipes with the fingers of the left and right hands. **Chords** can also be played on the sheng by closing multiple holes at the same time.  
                            \u{25CF}\t**Tonality:** A traditional sheng with 17 pipes typically has 13 or 14 different tones from a diatonic scale. Some pipes are designed for identical tones, and their position in the bundle is adapted to the performer's fingering for a specific musical repertoire.  
                            More recent constructions of the traditional sheng have 21 pipes, and parallel thin-walled metal tubes have been added to the outer side of the pipes to achieve a fuller tone timbre and resonant amplification.
                            """)
                    ]),
                    ShengSubsection(title: "The Modern Sheng", order: 5, paragraphs: [
                        ShengText(text: """
                            Due to its development across a large area of China, many different variants of the instrument have emerged. The modern sheng has been refined over centuries, and today it has a slightly altered construction but an identical principle of sound creation.  
                            \u{25CF}\t**Chromatic Scale:** The modern sheng was constructed at the beginning of the 20th century to create the tones of an evenly tempered chromatic scale.  
                            \u{25CF}\t**Number of Pipes:** It can have 24 or 26 pipes, and in 1950, a sheng with 36 pipes was developed.  
                            \u{25CF}\t**Registers: The tonality is adapted to the frequencies of voices such as **soprano, alto, tenor, and bass.**  
                            \u{25CF}\t**Valves:** The latest modern shengs are produced with special **valves **that serve to open and close specific holes on the bamboo pipes. This changes the functional length of the air column in the pipe, allowing tones from multiple octaves to be played in different registers.  
                            \u{25CF}\t**Instrument Size:** The number of tones, or pipes, directly affects the instrument's size. A small sheng has a pipe length of **405 mm**, a medium sheng **460 mm**, and a large sheng **800 mm.**
                            """)
                    ])
                ])
                
                // MARK: - THE CONSTRUCTION OF A TRADITIONAL SHENG
                
                let constructionTraditionalSheng = ShengSection(title: "The Construction of a Traditional Sheng", order: 2, subsections: [
                    ShengSubsection(title: "The Construction of a Traditional Sheng", order: 1, paragraphs: [
                        ShengText(text: "The traditional sheng is an elegantly designed instrument with a structure consisting of three main parts: the housing with a mouthpiece, a bundle of bamboo pipes, and the free reed mechanism. Each element is carefully crafted to achieve a unique sound and allow for easy playing.")
                    ]),
                    ShengSubsection(title: "The Sheng's Housing", order: 2, paragraphs: [
                        ShengText(text: """
                            The housing is essentially an **air chamber** with a cylindrical-paraboloid shape. Its symmetry is disrupted by a side-mounted mouthpiece through which the performer inhales or exhales air, creating the positive or negative pressure required for the free reeds to oscillate.  
                            \u{25CF}\t**Material and Thickness:** The housing is made from a copper-zinc alloy sheet, **1 mm thick.** The plate with the pipe openings is **3 mm** thick, and its cylindrical holes, with a diameter of **12 mm**, serve as guides for the conical pipe holders.  
                            \u{25CF}\t**Divided Chamber:** In newer designs, the air chamber is divided into two parts. The upper section contains a central cylinder that reduces the chamber's volume to make playing easier. The lower section collects condensed moisture and has a screw-cap opening for periodic drainage.
                            """)
                    ]),
                    ShengSubsection(title: "The Bundle of Bamboo Pipes", order: 3, paragraphs: [
                        ShengText(text: """
                            The bundle consists of finely crafted bamboo pipes of varying lengths, tightly bound into a ring. With a gentle pull, the bundle can be detached from the housing for servicing or cleaning.  
                            \u{25CF}\t**Binding Mechanism:** A ring with a screw mechanism acts as a clamping hoop, holding the pipes in a firm and stable position. A spacer within the bundle provides an opening for the performer's fingers to close the inner side holes.  
                            \u{25CF}\t**Side Holes:** Small side holes are placed on the exterior of the pipes at a precise distance from the housing for the performer's fingers. For better sealing and durability, brass ferrules are set into the holes. Pipes at the fourteenth and fifteenth positions have inner side holes, which are closed by the second and third fingers of the right hand.  
                            \u{25CF}\t**Acoustics:** Sound is produced only when a side hole is closed. Internal elongated slits define the effective acoustic length of the air column. This length and the pipe's internal diameter (Ф12.5 mm) ensure the air column resonates with the reed, initiating its oscillation.  
                            \u{25CF}\t**Details:** The length of the bamboo pipes is for design purposes and does not affect the acoustic characteristics. Modern pipes also feature external resonator tubes made of thin sheet metal, **0.3 mm** thick, to increase sound intensity and provide a distinct timbre.
                            """)
                    ]),
                    ShengSubsection(title: "The Free Reed Principle", order: 4, paragraphs: [
                        ShengText(text: """
                            The sheng is the oldest and most representative of all **free reed instruments.** Unlike reeds on instruments like a clarinet, which strike a base, the sheng's reeds have complete freedom of oscillation within their supporting frame.  
                            \u{25CF}\t**Material:** In ancient times, reeds were made from bamboo. With the discovery of metal, they are now typically made from cut-out metal plates of **copper, brass, or steel.**  
                            \u{25CF}\t**Bidirectional Airflow:** The reed plate and the reed itself have the same thickness. This allows the reed to oscillate identically whether air is flowing from the outside or the inside, enabling the performer to produce a continuous tone on both inhale and exhale.  
                            \u{25CF}\t**Tuning:** The thickness of brass reeds is **0.3 mm.** Their length and width depend on the desired tone frequency, which is precisely tuned by adding a small amount of mass (usually a sticky polymer) to the tip of the reed.  
                            \u{25CF}\t**Attachment:** The reed plate is glued to the top of the pipe with a special wax. The wax not only secures the plate but also provides a complete seal, ensuring that the only passage for airflow is through the opening created by the reed's oscillation.
                            """)
                    ])
                ])
                
                // MARK: - THE FUNCTIONAL PRINCIPLE OF THE SHENG
                
                let functionalPrincipleSheng = ShengSection(title: "The Functional Principle of the Sheng", order: 3, subsections: [
                    ShengSubsection(title: "The Functional Principle of the Sheng", order: 1, paragraphs: [
                        ShengText(text: "The functional principle of the sheng is based on the laws of acoustics and fluid dynamics, with the concept of **acoustic impedance** being central. This principle allows for the creation of tones by the oscillation of a free reed in resonance with the air column inside a bamboo pipe.")
                    ]),
                    ShengSubsection(title: "What is Acoustic Impedance?", order: 2, paragraphs: [
                        ShengText(text: """
                            \u{25CF}\tIn acoustics, impedance $(Za)$ is defined as the ratio of **sound pressure $(p)$** to **acoustic flow $(q)$**. Acoustic flow $(q = v * S)$ represents the volumetric speed of the air.  
                            \u{25CF}\t**Wave Reflection:** Any change in acoustic impedance, whether it increases or decreases, causes a sound wave to reflect. Reflection is the primary condition for the formation of a **standing wave** inside the bamboo pipe, which is crucial for producing sound.
                            """)
                    ]),
                    ShengSubsection(title: "Standing Wave Formation and Frequency", order: 3, paragraphs: [
                        ShengText(text: """
                            \u{25CF}\tA standing wave forms inside the pipe when a wave reflects at its end. The length of the acoustic air column must be equal to an integer multiple of half the standing wave's wavelength.  
                            \u{25CF}\tFundamental Frequency $(f1)$: Sheng pipes can be viewed as pipes closed at one end where the reed plate is located. The fundamental frequency is calculated using the formula:  
                            $$f1 =4Lv$$  
                            where v is the speed of sound in the air (343 m/s at 20°C), and $L$ is the length of the pipe.  
                            \u{25CF}\tHigher Harmonics: In a pipe closed at one end, the natural frequencies form a series of higher harmonics where only odd numbers appear as multiples of the fundamental frequency. The general formula for resonant frequencies is:  
                            $$fn =4Lnv (n=1,3,5,...)$$  
                            \u{25CF}\t**Tuning:** Since resonant frequencies depend on air temperature, the sheng's air chamber is often warmed before a performance to ensure the tones are accurate.
                            """)
                    ]),
                    ShengSubsection(title: "Operation When Blowing (Positive Pressure)", order: 4, paragraphs: [
                        ShengText(text: """
                            \u{25CF}\t**Pressure Creation:** Blowing air into the chamber creates a pressure of 0.1-0.3 kPa for an initial tone, while a nominal pressure of 0.6-0.8 kPa is needed for sustained playing. According to Pascal's law, this pressure acts evenly on all the reeds, pushing them towards the inside of the pipes.  
                            \u{25CF}\t**Tone Generation:** When the performer closes a side hole on a pipe with a finger, the positive pressure wave impulse travels to the end of the pipe. There, the pressure drops to atmospheric level, causing a reflection and the creation of a **negative pressure** impulse.  
                            \u{25CF}\t**Reed Oscillation:** The negative pressure impulse returns to the reed, opening it further and intensifying the airflow, which starts its oscillation.  
                            \u{25CF}\t**Tone End:** Opening the side hole disrupts the airflow, the standing wave disappears, and the reed stops oscillating.
                            """)
                    ]),
                    ShengSubsection(title: "Operation When Inhaling (Negative Pressure)", order: 5, paragraphs: [
                        ShengText(text: """
                            \u{25CF}\t**Suction Creation:** Inhaling air from the instrument's air chamber creates negative pressure. This suction force acts evenly on all reeds, bending them toward the outside of the pipes.  
                            \u{25CF}\t**Tone Generation:** When a side hole is closed, air from the atmosphere enters the chamber through the pipe. A **negative pressure** wave impulse is created, pulling the reed outward in the direction of the airflow. At the end of the pipe, the pressure rises to atmospheric, causing a reflection and creating a **positive pressure** impulse.  
                            \u{25CF}\t**Reed Oscillation:** The positive pressure impulse returns to the reed, opening it further and strengthening the airflow. This initiates the reed's oscillation and forms a stable standing wave in resonance with its frequency.  
                            \u{25CF}\t**Tone End:** The tone stops when the performer releases the side hole, which disrupts the standing wave formation, and the reed stops oscillating as the sound source.
                            """)
                    ])
                ])
                
                // MARK: - FUNDAMENTAL LAWS OF CLASSICAL PSYSICS AND REED OSCILLATION
                
                let fundamentalLawsPsychicsSheng = ShengSection(title: "Fundamental Laws of Classical Physics and Reed Oscillation", order: 4, subsections: [
                    ShengSubsection(title: "Fundamental Laws of Classical Physics and Reed Oscillation", order: 1, paragraphs: [
                        ShengText(text: """
                                  The mechanical principle of how the sheng's free reed oscillates due to airflow can be explained by fundamental laws of classical physics: the **law of conservation of mass** (expressed through the continuity equation) and **Bernoulli’s principle.** These laws explain how a unidirectional airflow can cause the reed to move back and forth at a high frequency.  
                                  **The Continuity Equation (Law of Conservation of Mass**  
                                  \u{25CF}\t**Principle:** According to this law, the mass of air flowing through any cross-section of a pipe per unit of time is constant.  
                                  \u{25CF}\tFormula: This is mathematically expressed by the equation:  
                                  $$S1 ⋅v1 =S2 ⋅v2 =S3 ⋅v3$$  
                                  where $S$ represents the cross-sectional areas and $v$ represents the air speeds.  
                                  \u{25CF}\t**Implication:** Due to this equation, if the cross-sectional area decreases (e.g., at the reed's location), the airflow speed must increase.  
                                  **Bernoulli's Principle**  
                                  \u{25CF}\t**Principle:** The sum of kinetic energy (due to speed), pressure energy, and potential energy is constant for every point in a fluid flow.  
                                  \u{25CF}\tFormula: Bernoulli's equation has the general form:  
                                  $$2v2+ρp+gh=const$$  
                                  where $v$ is speed, $p$ is static pressure, $ρ$ is air density, $g$ is gravitational acceleration, and $h$ is height.  
                                  \u{25CF}\t**Implication:** This equation shows a direct relationship: when the airflow speed increases, the pressure in that section drops.
                                  """)
                    ]),
                    ShengSubsection(title: "Reed Oscillation: The Combined Application of the Laws", order: 4, paragraphs: [
                        ShengText(text: """
                            The sheng's function is also based on **Pascal’s law,** which states that pressure in an air chamber is transmitted equally to all 17 reeds.  
                            **Beginning of the Tone**  
                            \u{25CF}\t**Pressure:** Blowing (or inhaling) air into the chamber creates pressure (**0.1-0.3 kPa** for the initial tone, **0.6-0.8 kPa** nominally) that acts on the reeds.  
                            \u{25CF}\t**Opening the Hole:** The performer closes a side hole on a pipe, allowing pressure impulses to further bend the reed and create a passage for the air.  
                            **Oscillation Mechanism**  
                            \u{25CF}\t**Reed Deflection** $(z=+Zmax)$: The airflow passes through the frontal opening. The flow speed rapidly increases **(continuity equation).**  
                            \u{25CF}\t**Pressure Drop:** The increase in speed causes a pressure drop **(Bernoulli’s principle)** on the side of the reed where the air is coming from. This negative pressure pulls the reed back.  
                            \u{25CF}\t**Neutral Position** $(z=0)$: The reed returns to the same plane as the plate, cutting off the airflow. This is the moment a tone is created.  
                            \u{25CF}\t**Opposite Deflection** $(z=−Zmax)$: The negative pressure continues to pull the reed until the elastic force of the material stops it and returns it.  
                            \u{25CF}\tReturn to Neutral Position: The reed returns, once again cutting off the airflow and creating a new tone. This process repeats at a high frequency as long as the side hole is closed.  
                            **Influential Parameters**  
                            \u{25CF}\t**Tone frequency** depends on the reed's profile, mass, width, length, and **elasticity.**  
                            \u{25CF}\t**Amplitude and tone loudness** depend on the size of the air chamber and the airflow.  
                            \u{25CF}\tIt is important that the edges of the reed and the plate are clean and free of corrosion to achieve a clear sound effect when the airflow is cut off.
                            """)
                    ])
                ])
                
                // MARK: - ACOUSTIC CHARASTERISTICS OF THE SHENG
                
                let acousticCharasteristicsSheng = ShengSection(title: "Acoustic Characteristics of the Sheng", order: 5, subsections: [
                    ShengSubsection(title: "Acoustic Characteristics of the Sheng", order: 1, paragraphs: [
                        ShengText(text: "The construction of the sheng has been refined and adapted to current musical genres throughout history, which has led to a constant increase in the number of bamboo pipes on the instrument. Today, the sheng has rich acoustic characteristics, although traditional instruments do not have a standardized tone arrangement.")
                    ]),
                    ShengSubsection(title: "Tone Arrangement and Musical Scales", order: 2, paragraphs: [
                        ShengText(text: """
                            \u{25CF}\t**Standardization:** The tones of the sheng and the arrangement of the pipes in the housing are not unified, nor is there a dependency between the frequency characteristics of the reeds and the position of the pipes they are mounted on.  
                            \u{25CF}\t**Accessibility:** The tones of the **pentatonic scale,** which is most commonly used in traditional Chinese music, are played on pipes that are easily accessible to the fingers of the left and right hands. Some pipes have identical tones, placed in the most favorable positions for fingering.  
                            \u{25CF} **Examples of tone arrangements** (for a traditional sheng with 17 pipes):  
                            \u{2023} G#¹, G¹, F#¹, E¹, C#¹, C¹, B¹, D#¹, C, C#, B, A, D, D, A, D#, F  
                            \u{2023} A, B♭, C¹, C#¹, D¹, E♭, E¹, F#¹, G¹, A¹, B¹, C#², D²  
                            \u{2023} A⁴, B♭⁴, C⁵, C#⁵, D⁵, E⁵, F#⁵, G⁵, A⁵, B⁵, C#⁶, D⁶  
                            \u{2023} A, B, C#, E, B, G, C, E, F#, G, A, D, D  
                            \u{2023} C¹, C#¹, E#¹, D¹, B¹, G¹, D#, D, F#, G#, C, G#, E  
                            \u{25CF}\t**Playing Technique:** Performers on the traditional sheng independently perfect their fingering technique according to the instrument's construction, or they choose a sheng that suits their playing style.
                            """)
                    ]),
                    ShengSubsection(title: "The Sheng in Contemporary Music", order: 3, paragraphs: [
                        ShengText(text: """
                            \u{25CF}\t**The Central Conservatory of Beijing** is the most famous institution where the sheng is studied. Today, there are a large number of young performers and composers for this instrument.  
                            \u{25CF}\t**The Modern Sheng:** Unlike the traditional sheng, which is primarily used for folk music, the modern sheng with **keys** and **36 tones of the chromatic scale** allows for the performance of all musical genres and classical music compositions, both in solo performances and with orchestras.  
                            \u{25CF}\t**Famous Artists and Composers:** Among the many sheng artists, the following can be mentioned:  
                            \u{2023} **Wu Wei** - soloist of the Shanghai Philharmonic Orchestra.  
                            \u{2023} **Hu Jianbing** - founder of the Chinese music ensemble in America.  
                            \u{2023} **Guo Chang Suo** - performs with the Chinese orchestra in Singapore.  
                            \u{2023} **Ng Cheuk Yin** - a sheng performer and composer from Hong Kong.  
                            \u{2023} **Hu Tianquan** - an artist from Dinan.  
                            \u{25CF}\t**Transcriptions and Compositions:** In recent decades, a whole galaxy of composers has emerged in China who are transcribing famous musical works for the sheng, as well as composing original pieces for this ancient instrument.
                            """)
                    ])
                ])
                

                modelContext.insert(oldestInstrumentSheng)
                modelContext.insert(constructionTraditionalSheng)
                modelContext.insert(functionalPrincipleSheng)
                modelContext.insert(fundamentalLawsPsychicsSheng)
                modelContext.insert(acousticCharasteristicsSheng)
            }
        } catch {
            print("Greška pri popunjavanju baze podataka: \(error)")
        }
    }
}
