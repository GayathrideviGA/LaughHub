# Laugh Hub

This is a Flutter app that displays dad jokes fetched from the icanhazdadjoke API. It allows users to fetch random jokes or search for jokes based on a specific term.

## Getting Started

To get started with the Dad Joke App, follow these steps:

1. Install Flutter on your machine. You can find the installation instructions in the [Flutter documentation](https://flutter.dev/docs/get-started/install).
2. Clone this repository or download the source code.
3. Open the project in your preferred Flutter IDE.
4. Run the app using the `flutter run` command or the run button in your IDE.

## Dependencies

The Dad Joke App uses the following dependencies:

- `flutter/material.dart`: The Flutter material library, which provides widgets and classes for building user interfaces.
- `provider/provider.dart`: The Provider package, which allows for state management using the Provider pattern.
- `http/http.dart`: The HTTP package, which provides functions for making HTTP requests.
- `dart:convert`: The Dart convert library, which provides functions for encoding and decoding JSON.

## App Structure

The app consists of the following files:

- `main.dart`: The entry point of the application. It sets up the provider and starts the app by running the `DadJokeApp` widget.
- `view/joke_screen.dart`: The main screen of the app, which displays the fetched jokes and allows users to fetch random jokes or search for jokes.
- `view/utils/constants.dart`: A file that contains constant strings used in the app.
- `view/utils/background.dart`: A file that contains background custom painter for the app.
- `viewmodel/joke_view_model.dart`: The view model class for the app. It handles fetching jokes, managing the app state, and providing data to the UI.
- `models/joke_model.dart`: The model class for the app. It contains the logic for fetching jokes from the API and managing the joke data.

## Usage

When the app starts, it initializes the `JokeViewModel` and sets up the necessary animation controllers. The `JokeViewModel` is then provided to the entire app using the `ChangeNotifierProvider`. The `DadJokeApp` widget is the main widget of the app and sets the title of the app and the initial screen to `JokeScreen`.

The `JokeViewModel` class is responsible for fetching jokes from the API and managing the joke data. It provides methods for fetching random jokes and searching for jokes based on a specific term. It also manages the selected joke and the loading state of the app.

The `JokeScreen` widget is the main screen of the app. It displays the fetched jokes, the selected joke, and a button to fetch a random joke. Users can also search for jokes by entering a search term in the search field.

The app uses the `http` package to make HTTP requests to the icanhazdadjoke API. It sends GET requests to fetch random jokes or search for jokes based on a term. The response is then decoded using the `dart:convert` package.

If an error occurs during the API request, an error dialog is shown using the `showErrorDialog` method. The dialog displays an error title and message and allows the user to dismiss it.

## License

This project is licensed under the MIT License. Feel free to use and modify the code according to your needs.
