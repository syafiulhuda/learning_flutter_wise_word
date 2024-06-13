// ignore_for_file: use_build_context_synchronously

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/controllers/my_app_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppState historyState = context.watch<MyAppState>();

    int counter = 0;

    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Card(
              elevation: 10,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'You have ${historyState.history.length} History:',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ...historyState.history.map(
            (wp) => Column(
              children: [
                ListTile(
                  onTap: () {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text('It`s ${wp.asCamelCase} '),
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
                  iconColor: Colors.pinkAccent,
                ),
                const Divider(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ArtDialogResponse response = await ArtSweetAlert.show(
              barrierDismissible: false,
              context: context,
              artDialogArgs: ArtDialogArgs(
                  denyButtonText: "Cancel",
                  title: "Are you sure?",
                  text: "You won't be able to revert this!",
                  confirmButtonText: "Yes, delete it",
                  type: ArtSweetAlertType.warning));

          if (response.isTapCancelButton) {
            return Navigator.pop(context);
          }

          if (response.isTapConfirmButton) {
            ArtSweetAlert.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.success, title: "Deleted!"));
            return historyState.clearHistory();
          }
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
