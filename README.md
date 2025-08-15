# AccordionDSLab - Interactive Educational iOS Application

AccordionDSLab is an interactive educational iOS application designed to provide a comprehensive and detailed insight into the technical structure and working principles of the accordion. The app uses modern Apple technologies to allow users to explore the main parts of the instrument, its sound mechanism, and historical context through animations, interactive content, and a rich knowledge base.

## 🚀 Key Features and Skills

This project demonstrates the following key skills and implemented functionalities:

### 1. **Modern Architecture and UI/UX**
* **Project Structure:** The code is organized into `Core`, `Features`, and `Resources` folders, reflecting a professional approach to development and ease of maintenance.
* **SwiftUI and View Composition:** The entire application is developed in SwiftUI with a modular architecture. Reusable components like `MarkdownText` for rich text display and a custom `TextField` with an animated `Cancel` button were built from scratch.
* **LaTeX Formula Rendering:** The application is prepared to support LaTeX syntax for rendering complex scientific and mathematical formulas, which is essential for the detailed technical content in the database.
* **Animations:** Fluid animations are implemented on the home screen, where accordion parts animate and pulsate to attract user attention. `Debounce` on the search input ensures a smooth experience without typing delays.

### 2. **Data Persistence and Search**
* **SwiftData:** SwiftData is used for data persistence and management, with a complex data model featuring nested relationships. The application's extensive knowledge base is automatically populated upon the first launch.
* **Advanced Search:** A robust search system is implemented with the following characteristics:
    * **Multiple Data Sources:** The search runs through all implemented sections of the app (Reed Plate, Reed Block, Sheng, Voices).
    * **Debounce Optimization:** The `debounce` technique using `Combine` is employed to delay the search until the user stops typing, which significantly improves performance.
    * **UI/UX:** A custom `TextField` with an animated `Cancel` button and a `NoResultsView` for empty results provide an intuitive user experience.

### 3. **Audio and Interactivity**
* **AVFoundation:** The audio system is built with `AVFoundation` and `AVAudioEngine` for high-fidelity sound reproduction.
* **Audio Efficiency:** Audio files are optimized by loading them into memory as buffers (`AVAudioPCMBuffer`) upon app launch, which eliminates latency during note playback.
* **Interactive Keyboard:** An interactive piano keyboard display is implemented with a register selection menu, where pressing keys plays the corresponding accordion sounds with all possible tone combinations. A similar virtual keyboard is planned for the Sheng instrument.

## 🛠️ Technologies

* **Language:** Swift
* **Frameworks:** SwiftUI, SwiftData, Combine, AVFoundation, UIKit
* **Tools:** Git & GitHub

---

### **Project Status and Future Plans**

The current project is a solid and functional application. The following features represent an ambitious roadmap for future development:

* **Expanding Content:**
    * **Keyboard Systems:** A comprehensive database and interactive displays for various keyboard systems, including P, B, C, U, Quartz, and combined systems, as well as Standard Bass and Converter Bass mechanisms.
    * **History Section:** A new History of the Accordion section will be added, likely in a separate tab, to provide historical context.
    * **Other Sections:** Planned content includes Bellows (their construction and function), Spectral Frequency Analysis, Mechanical Systems, Masks, Accordion Equipment, and Maintenance.
* **Advanced Features:**
    * **Search Enhancements:** The search feature will be upgraded with direct-to-paragraph navigation, which will highlight the specific content a user searched for.
    * **StoreKit:** StoreKit will be integrated to offer in-app purchases, allowing users to unlock additional content sections.
    * **UI Customization (Hamburger Menu):** A hamburger menu will be implemented to house supplementary options, including:
        * **Settings & Appearance:** Options for dark/light mode.
        * **About App:** Display of version, terms of use, and copyright information.
        * **Purchases:** Options for restoring purchases.
        * **Share & Rate:** Links to the App Store and options to share the app.
        * **Help & Support:** Access to an FAQ page or contact options.
        * **User Profile:** Options for sign-in and sign-out.
