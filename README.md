![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)  &nbsp;  ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white) &nbsp; [![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/) 
<p align="center">
  <img src="https://github.com/rrousselGit/riverpod/blob/master/resources/icon/Facebook%20Cover%20A.png?raw=true" width="100%" alt="Riverpod" />
</p>

---

# Project: Flutter Riverpod Starter

This is a Flutter application that serves as a starter template for using Riverpod in Flutter. It provides a basic structure and setup for using Riverpod, a state management solution for Flutter.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- State management using Riverpod
- Provider for retrieving package information
- Logging provider observer
- Responsive design using Sizer widget
- Error handling for Dio requests
- Basic UI using Flutter widgets
- Network connectivity check
- Local Database using ObjectBox
- Easy Internationalization
- Router using Go_Router
- Customizable theme ( light / dark ) with FlexSchemeTheme

## Getting Started

To get started with this project, follow these steps :

1. Clone the repository:

    ```bash
    git clone https://github.com/AnonX9/flutter_riverpod_starter.git --branch with_easy_l10n
    ```

2. Change into the project directory:

    ```bash
    cd flutter_riverpod_starter
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Generate all rivepod files:

    ```bash
    dart build_runner build --delete-conflicting-outputs
    ```

5. Generate documentation files:

    ```bash
    flutter pub get
    dart doc .
    ```

    You should see the following message at the end:

    ```text
    Success! Docs generated into /Users/me/projects/my_package/doc/api
    ```

    Now, to see the documentation, use the following commands:

    ```bash
    dart pub global activate dhttpd
    dart pub global run dhttpd --path doc/api
    ```

## Usage

This application is meant to be a starter pack for any 'real-world' application developped in flutter.
It offers basic features that are usually needed in applications along with a documentation.

## Contributing

Contributions are always welcome! Or you can simply make this whole project your own.If you'd like to contribute to this project, follow these steps:

1. Fork the repository:

   - Go to [https://github.com/your-username/flutter_riverpod_starter](https://github.com/your-username/flutter_riverpod_starter)
   - Click on the "Fork" button in the top-right corner
   - Choose your GitHub account where you want to fork the repository

2. Clone the forked repository:

   ```bash
   git clone https://github.com/your-username/flutter_riverpod_starter.git
   ```

3. Create a new branch:

    ```bash
    git checkout -b feature/my-new-feature
    ```

4. Make your changes and commit them:

    ```bash
    git add .
    git commit -m "Add a brief description of your changes"
    ```

5. Push your changes to your forked repository:

    ```bash
    git push origin feature/my-new-feature
    ```

6. Submit your pull request and we could review it together ! ✨

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

Thank you for using the Flutter Riverpod Starter project! If you have or feedback, please feel free to reach out.
