import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/joke_view_model.dart';
import 'utils/background.dart';
import 'utils/constants.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Trigger fetchRandomJoke on screen launch
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final jokeViewModel = Provider.of<JokeViewModel>(context, listen: false);
      jokeViewModel.fetchRandomJoke(context);
    });
  }

  /// Builds the search text field widget.
  Widget buildSearchTextField(
      JokeViewModel jokeViewModel, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        autofocus: false,
        onChanged: (value) {
          jokeViewModel.fetchJokesBySearchTerm(value, context);
        },
        decoration: InputDecoration(
          hintStyle: AppTextStyles.searchTextStyle,
          hintText: AppStrings.searchJokes,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.searchIcon,
          ),
        ),
      ),
    );
  }

  /// Builds the joke content widget based on the state of the jokeViewModel.
  Widget buildJokeContent(JokeViewModel jokeViewModel, BuildContext context) {
    if (jokeViewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (jokeViewModel.selectedJoke != null) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: MediaQuery.of(context).size.width / 1.3,
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: jokeViewModel.selectedJoke != null ? 1.0 : 0.0,
            child: ScaleTransition(
              scale: jokeViewModel.animation,
              child: Text(
                jokeViewModel.selectedJoke!,
                textAlign: TextAlign.center,
                style: AppTextStyles.jokeTextStyle,
              ),
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: jokeViewModel.jokes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Hero(
              tag: 'joke_$index',
              child: Material(
                color: Colors.transparent,
                child: Text(jokeViewModel.jokes[index]),
              ),
            ),
            onTap: () {
              jokeViewModel.setSelectedJoke(jokeViewModel.jokes[index]);
              jokeViewModel.animationController.reset();
              jokeViewModel.animationController.forward();
              controller.clear();
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final jokeViewModel = Provider.of<JokeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: const Text(AppStrings.appName),
      ),
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Column(
          children: [
            buildSearchTextField(jokeViewModel, context),
            Expanded(
              child: buildJokeContent(jokeViewModel, context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: AppColors.fabColor,
        onPressed: () {
          jokeViewModel.fetchRandomJoke(context);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
