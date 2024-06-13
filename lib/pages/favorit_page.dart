import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/controllers/my_app_state.dart';

class Favoritage extends StatelessWidget {
  const Favoritage({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.watch<MyAppState>();

    int counter = 0;

    return ListView(
      children: [
        Center(
          child: Card(
            elevation: 10,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'You have ${appState.favorite.length} Favorite:',
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        ...appState.favorite.map(
          (wp) => Column(
            children: [
              ListTile(
                onTap: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('It`s ${wp.asCamelCase}, yeay!!!!'),
                      ),
                    );
                },
                leading: Text(
                  "${++counter}.",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                title: Text(wp.asCamelCase),
                trailing: IconButton(
                  onPressed: () {
                    appState.removeFromHistory(wp);
                    // historyState.clearHistory();
                  },
                  icon: const Icon(Icons.delete),
                ),
                iconColor: Colors.pinkAccent,
              ),
              const Divider(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
