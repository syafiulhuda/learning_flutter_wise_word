import 'package:flutter/material.dart';
import 'package:test_drive/pages/favorit_page.dart';
import 'package:test_drive/pages/history._page.dart';
import 'package:test_drive/pages/generator_page.dart';
import 'package:test_drive/widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page = const Placeholder();
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const Favoritage();
        break;
      case 2:
        page = const HistoryPage();
        break;
      default:
        page = const Placeholder(
          color: Colors.yellow,
        ); // case if no page is selected
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: const [
          Icon(Icons.info_outlined),
          SizedBox(
            width: 10,
          ),
        ],
        centerTitle: true,
        title: const Text(
          "Test Drive",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: const DrawerMenu(),
      body: page,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        indicatorColor: Colors.pinkAccent,
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star),
            icon: Icon(Icons.star_border),
            label: 'Favorit',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.work_history_rounded),
            icon: Icon(Icons.work_history_outlined),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
