# 🌸 Flower App

A modern **Flutter e-commerce application** built with Clean Architecture.  
The app allows users to browse products, add them to cart, and manage orders efficiently.

---

## 📱 Features
- 🔑 User authentication (Signup / Login with JWT)
- 🛒 Add, update, and remove items from the cart
- 💳 Checkout process
- 📦 Product listing and details
- 🎨 Responsive UI with Material Design
- 🧱 Clean Architecture (API, Data, Domain, Presentation layers)
- 
---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>= 3.x)
- Android Studio / VSCode
- Emulator or physical device

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Aswani20/flower_app.git
    ```

2. Navigate to the project directory:
    ```bash
    cd flower_app
    ```

3. Install dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app:
    ```bash
    flutter run
    ```
#### Folder Structure

lib/
│
├── api_layer/          # Retrofit/Dio API setup
├── data_layer/         # Data sources & repositories
├── domain_layer/       # Use cases & entities
├── presentation_layer/ # UI & state management (Cubit/Bloc)
└── main.dart
