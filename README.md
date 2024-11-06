# Kran-Z App

The Kran-Z app is designed to enhance the safety, health monitoring, and connectivity experience for users of the Kran-Z smart helmet. Built using **Flutter**, this app provides a user-friendly interface to monitor helmet status, track locations, access emergency contacts, and manage helmet settings.

## Table of Contents

- [Features](#features)
- [Screens](#screens)
  - [Loading Screen](#loading-screen)
  - [Home Page](#home-page)
  - [Profile Screen](#profile-screen)
- [Installation](#installation)
- [Dependencies](#dependencies)
- [App Structure](#app-structure)
- [Usage](#usage)
- [License](#license)

## Features

- **Helmet Status Monitoring**: View the helmet’s battery status and connectivity.
- **Quick Connect/Disconnect**: Easily connect to or disconnect from the helmet.
- **Profile Management**: Manage user profile information, including emergency contacts.
- **Helmet Health & Timeline**: Monitor helmet health and view helmet activity history.
- **Location Tracking**: Track helmet location in real-time.
- **Customization**: Change turn signal colors and access helmet information.
- **Accessible Drawer Menu**: A drawer menu provides quick navigation to helmet and user features.

## Screens

### Loading Screen

The **LoadingScreen** displays the Kran-Z logo and a loading bar. Once loading completes, it navigates automatically to the Home Page.

### Home Page

The **HomePage** displays:

- Helmet status (battery level, connection status).
- A connect/disconnect button.
- A navigation drawer with additional features:
  - Helmet Health
  - Helmet Timeline
  - Location Tracking
  - Change Turn Signal Colors
  - About Kran-Z

### Profile Screen

The **ProfileScreen** allows users to:

- View profile information (name, email, and emergency contact).
- Edit profile and logout options.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/Kran-Z-App.git
   cd Kran-Z-App
   ```
2. **Install Flutter dependencies**:

   ```bash
   flutter pub get
   ```
3. **Run the app**:

   ```bash
   flutter run
   ```
4. Ensure the required assets (e.g., `kranz_logo.png`, `helmet.svg`) are added to `assets/` and specified in `pubspec.yaml`.

## Dependencies

The Kran-Z app uses the following dependencies:

- **google_fonts**: For using custom Google Fonts in the app.
- **percent_indicator**: For the loading bar on the loading screen.
- **flutter_svg**: To display SVG assets for helmet icons.

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^3.0.1
  percent_indicator: ^4.2.2
  flutter_svg: ^1.1.3
```

## App Structure

```plaintext
lib/
├── main.dart                   # Main application file
├── screens/
│   ├── LoadingScreen.dart       # Loading screen with progress indicator
│   ├── HomePage.dart            # Home page with helmet status and connectivity
│   └── ProfileScreen.dart       # Profile screen with user information
assets/
├── kranz_logo.png               # App logo image
└── helmet.svg                   # SVG image of the helmet
```

## Usage

1. **Loading**: Open the app, and the loading screen will display until resources are loaded.
2. **Home Page**: After loading, view helmet status. Connect to or disconnect from the helmet using the button provided.
3. **Profile**: View and manage user details by clicking the profile icon.
