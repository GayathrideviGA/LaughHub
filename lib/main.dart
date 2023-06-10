import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/joke_screen.dart';
import 'view/utils/constants.dart';
import 'viewmodel/joke_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<JokeViewModel>(
      create: (_) => JokeViewModel(),
      child: const DadJokeApp(),
    ),
  );
}

// The main application widget
class DadJokeApp extends StatelessWidget {
  const DadJokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
      home: JokeScreen(),
    );
  }
}
