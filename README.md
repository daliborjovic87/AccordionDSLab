### `README.md`

# AccordionDSLab - Interactive Educational iOS Application

`AccordionDSLab` is an interactive educational iOS application designed to provide a detailed insight into the technical structure and working principles of the accordion. The app uses modern Apple technologies to allow users to explore the main parts of the instrument, its sound mechanism, and historical context through animations, interactive content, and a rich knowledge base.

## 🚀 Key Features and Skills

This project demonstrates the following key skills and implemented functionalities:

### 1. **Modern Architecture and UI/UX**
* **Project Structure:** The code is organized into `Core`, `Features`, and `Resources` folders, reflecting a professional approach to development and ease of maintenance.
* **SwiftUI and View Composition:** The entire application is developed in SwiftUI with a modular architecture. Reusable components (`ParagraphView`, `CustomToolbarView`, `MarkdownText`) have been used for efficient UI creation.
* **Animations:** Fluid animations are implemented on the home screen, where accordion parts animate from the sides to the center and pulsate to attract the user's attention. `Debounce` on search ensures a smooth experience without typing delays.

### 2. **Data Persistence and Search**
* **SwiftData:** SwiftData is used for data persistence and management, with complex models and relationships. Data is automatically populated upon the app's first launch.
* **Advanced Search:** A robust search system is implemented with the following characteristics:
    * **Multiple Data Sources:** The search runs through all implemented sections of the app (Reed Plate, Reed Block, Sheng, Voices).
    * **Debounce Optimization:** The `debounce` technique using `Combine` is employed to delay the search until the user stops typing, which significantly improves performance.
    * **UI/UX:** A custom `TextField` with an animated `Cancel` button and a `NoResultsView` for empty results provide an intuitive user experience.

### 3. **Audio and Interactivity**
* **AVFoundation:** The audio system is built with `AVFoundation` and `AVAudioEngine` for high-fidelity sound reproduction.
* **Audio Efficiency:** Audio files are optimized by loading them into memory as buffers (`AVAudioPCMBuffer`) upon app launch, which eliminates latency during note playback.
* **Interactive Keyboard:** An interactive keyboard display is implemented with register selection, where pressing the keys plays the corresponding accordion sounds with all possible tone combinations.

## 🛠️ Technologies

* **Language:** Swift
* Frameworks: SwiftUI, SwiftData, Combine, AVFoundation, UIKit
* Tools: Git & GitHub

---

### **Project Status and Future Plans**

* **Search Caching:** Planned for future implementation. The logic for caching is designed within the `DataSearcher` class, but it is currently deferred.
* **Direct-to-Paragraph Search Navigation:** Planned for future implementation. The search models are already partially prepared to store unique paragraph IDs, which is a key step towards this functionality.
* **StoreKit:** The implementation of in-app purchases for unlocking additional content categories is planned.
* **Content Expansion:** Plans include adding complete data for all keyboard systems, registers, and voices, as well as options for a dark mode and a settings menu.
