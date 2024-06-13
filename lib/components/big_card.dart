import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onPrimary,
      decoration: TextDecoration.lineThrough,
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 30.0,
        color: Colors.pinkAccent,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            pair.asLowerCase,
            style: style,
          ),
        ),
      ),
    );
  }
}
