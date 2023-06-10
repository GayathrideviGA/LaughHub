import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../models/joke_model.dart';

class JokeViewModel with ChangeNotifier {
  late JokeModel _model;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late TickerProvider _tickerProvider;

  JokeViewModel() {
    _model = JokeModel();
    _tickerProvider = TickerProviderImpl();
    _animationController = AnimationController(
      vsync: _tickerProvider,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
  }

  List<String> get jokes => _model.jokes;
  String? get selectedJoke => _model.selectedJoke;
  bool get isLoading => _model.isLoading;
  Animation<double> get animation => _animation;
  AnimationController get animationController => _animationController;

  /// Fetches a random joke from the API.
  /// Triggers an animation when the joke is fetched.
  Future<void> fetchRandomJoke(BuildContext context) async {
    await _model.fetchRandomJoke(context);
    _animationController.reset();
    _animationController.forward();
    notifyListeners();
  }

  /// Fetches jokes based on the provided search term.
  Future<void> fetchJokesBySearchTerm(String term, BuildContext context) async {
    await _model.fetchJokesBySearchTerm(term, context);
    notifyListeners();
  }

  /// Sets the selected joke.
  void setSelectedJoke(String joke) {
    _model.selectedJoke = joke;
    notifyListeners();
  }
}

class TickerProviderImpl extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
