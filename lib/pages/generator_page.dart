// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/components/big_card.dart';
import 'package:test_drive/controllers/my_app_state.dart';
import 'package:day_night_switch/day_night_switch.dart'; // Make sure to import the package

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  bool isDay = false;

  @override
  Widget build(BuildContext context) {
    TextStyle styles = TextStyle(
      fontSize: 25,
      color: isDay ? Colors.black : Colors.white,
    );

    // Favorite state
    MyAppState appState = context.watch<MyAppState>();
    WordPair pair = appState.current;

    // Logic icon button
    IconData icon;
    if (appState.favorite.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
                onPressed: () {
                  appState.toggleFavorite();

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('${appState.current} added to Favorite'),
                      ),
                    );
                },
                icon: Icon(
                  icon,
                  color: Colors.white,
                ),
                label: Text(
                  "Favorite",
                  style: styles,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
                onPressed: () {
                  appState.getNext();
                },
                child: Text(
                  "Add",
                  style: styles,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Transform.scale(
          //   scale: 0.5, // Scale down the switch
          //   child: DayNightSwitch(
          //     value: isDay,
          //     moonImage: const AssetImage('assets/moon.png'),
          //     sunImage: const AssetImage('assets/sun.png'),
          //     sunColor: Colors.yellow,
          //     moonColor: Colors.grey,
          //     dayColor: Colors.blue,
          //     nightColor: Colors.black,
          //     onChanged: (value) {
          //       setState(() {
          //         isDay = value;
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
