import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../view/utils/constants.dart';

class JokeModel {
  List<String> jokes = [];
  String? selectedJoke;
  bool isLoading = false;

  /// Fetches a random joke from the API.
  Future<void> fetchRandomJoke(BuildContext context) async {
    isLoading = true;

    try {
      final response = await http.get(
        Uri.https('icanhazdadjoke.com', '/'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final joke = jsonDecode(response.body)['joke'];
        selectedJoke = joke;
        isLoading = false;
      } else {
        showErrorDialog(context);
      }
    } catch (e) {
      showErrorDialog(context);
    }
  }

  /// Fetches jokes based on a search term from the API.
  Future<void> fetchJokesBySearchTerm(String term, BuildContext context) async {
    isLoading = true;
    selectedJoke = null;
    jokes.clear();

    try {
      final response = await http.get(
        Uri.https('icanhazdadjoke.com', '/search', {'term': term}),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jokesData = jsonDecode(response.body)['results'];
        final newJokes =
            List<String>.from(jokesData.map((joke) => joke['joke']));
        jokes.addAll(newJokes);
      } else {
        showErrorDialog(context);
      }
    } catch (e) {
      showErrorDialog(context);
    }

    isLoading = false;
  }

  /// Shows an error dialog with a title, message, and an 'OK' button.
  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(AppStrings.errorTitle),
          content: const Text(AppStrings.errorMessage),
          actions: [
            TextButton(
              child: const Text(AppStrings.ok),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
    isLoading = false;
  }
}
