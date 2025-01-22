# ModularisationStarter

This project demonstrates a modular architecture for iOS applications, showcasing how to separate features into independent modules and manage dependencies effectively. This approach improves code organization, reusability, testability, and allows for parallel development by different teams.

## Project Structure Overview

The project is structured into three main categories:

*   **Packages:** Contains shared, reusable components and dependencies used across multiple modules. These are often Swift Packages.
*   **Modules:** Represents distinct features of the application, implemented as independent units of code. These can be frameworks or static libraries.
*   **Frameworks:** External or pre-built frameworks used by the project, often from third-party libraries or internal shared components.

### Packages

The `Packages` directory houses shared resources and dependencies, promoting code reuse and maintainability.

*   **SharedDependencies:** This package likely contains fundamental dependencies like networking libraries (e.g., `Alamofire`), JSON parsing libraries (e.g., `Codable`, `SwiftyJSON`), or core data models. This centralizes dependency management and ensures consistency across modules.
*   **Utilities:** Contains utility classes and functions, such as helper methods for string manipulation, date formatting, UI extensions, or common logic used throughout the app.
*   **Analytics:** Implements analytics tracking functionality. This module would handle sending analytics events to different analytics providers (e.g., Firebase, Mixpanel).
*   **AnalyticsInterface:** Defines the interface (protocols) for the Analytics module. This allows for swapping different analytics implementations without affecting other modules, adhering to the Dependency Inversion Principle.
*   **CommonModels:** Defines data models shared between different modules. This avoids code duplication and ensures data consistency. For example, an `Artist` or `Song` model might be defined here.
*   **Localisation:** Handles localization resources (strings files, assets) and logic for supporting multiple languages.

### Modules

The `Modules` directory contains the core features of the application, each implemented as a separate module. This promotes code isolation, testability, and parallel development.

*   **Home:** The main screen or entry point of the application. This module might orchestrate the display of other feature modules.
    *   **ArtistDetail:** A module responsible for displaying detailed information about an artist.
        *   `ArtistDetailInterface`: Defines the public interface (protocols) that other modules can use to interact with the ArtistDetail module. This is crucial for decoupling.
        *   `ArtistDetail`: Contains the implementation of the ArtistDetail module:
            *   `Gateway`: Handles data fetching and interaction with external services (e.g., network requests, database access). This isolates data access logic.
            *   `Artist.swift`: Data model for Artist objects. If this is very generic it should be in CommonModels
            *   `ArtistDetailsCoordinator.swift`: Manages navigation and flow within the ArtistDetail module, using the Coordinator pattern. This keeps view controllers lean and focused on presentation.
            *   `ArtistDetailsEventNames.swift`: Defines event names for inter-module communication using notifications or a similar mechanism.
            *   `ArtistDetailsView.swift`: The user interface for the artist details screen.
            *   `ArtistDetailsViewModel.swift`: The view model responsible for managing the view's data and logic, following the MVVM pattern.
            *   `ArtistService.swift`: A service responsible for fetching artist data, potentially using the Gateway.
        *   `Tests`: Unit tests for the ArtistDetail module, ensuring its functionality is correct and isolated.
    *   **SongDetails:** A module responsible for displaying detailed information about a song. It follows a similar structure to the ArtistDetail module.

*   **Root:** The root module of the application, responsible for setting up the main UI and coordinating navigation between modules.
    *   `RootCoordinator.swift`: Manages the overall navigation flow of the application, acting as the main coordinator.
    *   `RootTabBarController.swift`: Implements the main tab bar interface, if the app uses one.
    *   `AppDelegate.swift`, `SceneDelegate.swift`: Standard application lifecycle components.
    *   `AppDependencyConfigurar.swift`: Likely responsible for configuring dependencies between modules using a Dependency Injection Container.

### Frameworks

*   **DependencyContainer.xcframework:** A pre-built framework responsible for managing dependencies within the application. This is crucial for decoupling modules and enabling dependency injection, likely using a dependency injection framework like Swinject or similar.

## Key Architectural Decisions and Patterns

*   **Modular Architecture:** The project uses a modular architecture to improve code organization, reusability, and maintainability.
*   **Interfaces (Protocols):** Interfaces are extensively used to decouple modules and promote loose coupling.
*   **Dependency Injection:** A dependency injection container is used to manage dependencies between modules, making the code more testable and maintainable.
*   **Coordinator Pattern:** The Coordinator pattern is used for navigation, keeping view controllers lean and focused on presentation.
*   **MVVM (Model-View-ViewModel):** The MVVM pattern is used for structuring the UI logic within modules.
*   **Gateway Pattern:** The Gateway pattern is used to abstract data access logic.
