import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home_page/home_page.widget.dart';
import 'package:provider/provider.dart';

class OcpaAppState extends ChangeNotifier {
  var current = WordPair.random();

  // ↓ Add this.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class OcpaApp extends StatelessWidget {
  const OcpaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OcpaAppState(),
      child: MaterialApp(
        title: 'OcPa\'s First Flutter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomePage(),
      ),
    );
  }
}
