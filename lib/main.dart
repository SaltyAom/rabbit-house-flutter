import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:rabbit_house/pages/pages.dart';
import 'package:rabbit_house/stores/stores.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(LanguageAdapter());
  Hive.registerAdapter(LanguagesAdapter());

  runApp(
    const ProviderScope(
      child: RabbitHouseApp(),
    ),
  );
}

class RabbitHouseApp extends StatelessWidget {
  const RabbitHouseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rabbit House',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade100,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarTextStyle: TextStyle(
            color: Colors.blue,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarTextStyle: TextStyle(
            color: Colors.blue,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  build(context) {
    final tab = useState(0);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: tab.value,
        onTap: (index) {
          tab.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
      body: IndexedStack(
        index: tab.value,
        children: const [MenuPage(), SettingsPage()],
      ),
    );
  }
}
