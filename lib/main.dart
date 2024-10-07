import 'package:flutter/material.dart';
import 'package:upxv/pages/hello_page.dart';
import 'package:upxv/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      darkTheme: ThemeData(
      //   useMaterial3: true,
      //   // scaffoldBackgroundColor: Color.fromARGB(162, 22, 140, 169),
      //   floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     // backgroundColor: const Color.fromARGB(255, 0, 115, 145),
      //     // foregroundColor: Colors.white
      //   ),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //       // backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 0, 115, 145)),
      //     )
      //   ),
        appBarTheme: AppBarTheme(
          shadowColor: Theme.of(context).colorScheme.shadow,
          scrolledUnderElevation: 10,
          // backgroundColor: const Color.fromARGB(255, 0, 115, 145),
          // foregroundColor: Colors.white
        ),
        cardTheme: CardTheme(
          elevation: 10,
          shadowColor: Colors.red,
      //     // color: Color.fromARGB(255, 166, 223, 237)
        )
      ),  
      
      // theme: ThemeData(
      //   brightness: ThemeData.dark,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //   useMaterial3: true,
      // ),
      home: const HelloPage(),
    );
  }
}
