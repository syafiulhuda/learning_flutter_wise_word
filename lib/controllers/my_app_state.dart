import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // List to keep track of the history of WordPairs
  var history = <WordPair>[];

  // List to keep track of favorite WordPairs
  var favorite = <WordPair>[];

  void getNext() {
    // Add current WordPair to history before generating a new one
    history.add(current);
    current = WordPair.random();
    notifyListeners();
  }

  // Handle favorite list
  void toggleFavorite() {
    if (favorite.contains(current)) {
      favorite.remove(current);
    } else {
      favorite.add(current);
    }
    notifyListeners();
  }

  // handler remove some listile
  void removeFromHistory(WordPair wp) {
    favorite.remove(wp);
    notifyListeners();
  }

  // handler clear all history
  void clearHistory() {
    history.clear();
    notifyListeners();
  }
}
