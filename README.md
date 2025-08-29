**README: Photo Library App**
**Overview**
Photo Library App is an iOS application built using Clean Architecture principles and SwiftUI. This project demonstrates how to create a maintainable, testable, and scalable mobile application by implementing clear separation of concerns, dependency injection, and protocol-oriented programming.

**Project Structure**

The application is organized into distinct layers, each with specific responsibilities:
* App: Entry point and configuration
* Presentation: UI components and view models
* Domain: Business logic and use cases
* Data: Data sources and repositories
* Infrastructure: Networking, utilities, and configurations

**Layer Responsibilities**

**App**
* PhotoLibraryApp.swift: Application entry point that initializes the dependency injection container and sets up the main view hierarchy.
Presentation
* **View**:
    * PhotoListView.swift: Main view displaying the list of photos
    * PhotoListRow.swift: Component for displaying individual photo items
* **ViewModel**:
    * PhotoListViewModel.swift: Manages UI state and communicates with the domain layer
Domain
* **Interfaces**:
    * APIProtocol.swift: Protocol defining the contract for data retrieval
* **Entities**:
    * PhotoEntity.swift: Core domain model representing photo data
* **Services**:
    * APIService.swift: Implementation of the API protocol for fetching photo data
Infrastructure
* **Networking**:
    * SSLBypassDelegate.swift: Optional networking configuration for development environments
* **Utilities**:
    * Supporting classes and extensions for common functionality
      
**Dependency Injection**

The application uses dependency injection to maintain loose coupling between components:
* ViewModels accept protocol interfaces rather than concrete implementations
* Services are injected via initializers, making them easy to replace for testing
* Mock implementations can be provided for automated testing scenarios
Testing
The project includes comprehensive test coverage:
* Swift Testing: Using the modern Swift Testing framework for declarative tests
