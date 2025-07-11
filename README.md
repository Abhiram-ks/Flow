# flow

# Project Overview:
  
This Flutter project is a high-performance, multi-screen mobile application designed to fetch and parse JSON data in an optimized way using Dart isolates (multi-threading). The app features a clean and modern UI built according to Figma-based UI/UX designs, and is architected using Clean Architecture principles for scalability and maintainability.
The main goal of the application is to display a home screen and a notifications screen, where the latter dynamically loads and displays data from a remote API endpoint. To ensure smooth and responsive UI rendering, heavy JSON parsing is offloaded to a background isolate, keeping the UI thread free from jank or delay. The architecture ensures modularity, allowing each layer (presentation, domain, data) to evolve independently with clearly defined responsibilities.
This project is ideal for demonstrating advanced Flutter skills, including state management, asynchronous programming, clean architecture, multi-threading with isolates, and integration with modern design tools like Figma.

# Key Features(🚀):
* Two-Screen Navigation: A fully functional Home screen and Notifications screen.
* Remote JSON Integration: Fetches real-time data from a remote API.
* Isolate-Based JSON Parsing: Heavy parsing is handled in the background using Dart isolates for maximum performance.
* Clean Architecture: Layered structure with clear separation between UI, business logic, and data access.
* Figma-Based UI: Fully responsive and professionally styled UI implemented from a Figma design. 
* State Management: Uses Bloc, Provider, or another pattern to manage screen states efficiently.
* Error Handling: Handles network failures, invalid data, and loading states gracefully.
* Optional Unit Tests: Demonstrates testability of core logic and service layers (if implemented).

# Tools & Technologies (🛠️):
* Flutter	| Dart	Programming language | HTTP / Dio	Networking & API calls | Bloc / Cubit	State management | Figma	UI/UX design reference  | Isolates Background processing for heavy tasks
