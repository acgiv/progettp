import 'package:d4m/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4m/screen/documenti.dart';
import 'package:d4m/screen/help_desk.dart';
import 'package:d4m/screen/percorrenza_auto.dart';
import 'package:d4m/provider/navigator_provider.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.black,
    surface: const Color.fromRGBO(
        244, 244, 243, 1), // colore di sfondo dell' applicazione
    onSurface: Colors.black, // colore della superfice ( esempio topbar)
    primary: const Color.fromRGBO(38, 137, 13, 1.0),
    secondary: const Color.fromRGBO(85, 85, 85, 1.0),
    tertiary: Colors.white);

var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 9, 99, 125),
    brightness: Brightness.dark);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const DocumentiPage(),
    const PercorrenzaAuto(),
    const HelpDesk()
  ];

  //  @override
  // void initState() {
  //   super.initState();
  //   initialization();
  // }

  // void initialization() async {
  //   // This is where you can initialize the resources needed by your app while
  //   // the splash screen is displayed.  Remove the following example because
  //   // delaying the user experience is a bad design practice!
  //   // ignore_for_file: avoid_print
  //   print('ready in 3...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 2...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 1...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('go!');
  //   FlutterNativeSplash.remove();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map elem = ref.watch(pageProvider);

    Widget getPage() {
      final entry = elem.entries.firstWhere((e) => e.value == true);
      return _pages[elem.keys.toList().indexOf(entry.key)];
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: kColorScheme,
          drawerTheme: DrawerThemeData(
            backgroundColor: kColorScheme.onSurface,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onSurface,
              iconTheme: IconThemeData(color: kColorScheme.surface),
              foregroundColor: kColorScheme.surface),
          cardTheme: const CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer)),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle:
                  const TextStyle(color: Colors.grey), // Colore per l'hintText
              prefixStyle: TextStyle(color: kColorScheme.onSurface)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(color: kColorScheme.onSecondaryContainer))),
      themeMode: ThemeMode.system,
      home: getPage(),
    );
  }
}
