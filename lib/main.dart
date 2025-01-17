import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upxv/pages/administration_page.dart';
import 'package:upxv/pages/forgot_password_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upxv/pages/login_page.dart';
import 'package:upxv/pages/monitory_page.dart';
import 'package:upxv/pages/sign_up_page.dart';
import 'package:upxv/pages/workspace_page.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Verifique se o Firebase já está inicializado
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  
  await FirebaseAuth.instance.setPersistence(Persistence.NONE);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          shadowColor: Theme.of(context).colorScheme.shadow,
          scrolledUnderElevation: 10,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shadowColor: Colors.amber,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            animationDuration: Duration(seconds: 5),
            foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
            backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber)
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), 
            // borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
          )
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
        )

      ),  
      
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          shadowColor: Theme.of(context).colorScheme.shadow,
          scrolledUnderElevation: 10,
          elevation: 10
        ),
        cardTheme: CardTheme(
          // elevation: 2,
          // shadowColor: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            animationDuration: Duration(seconds: 5),
            foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
            backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber)
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.amber),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber), 
            // borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
          )
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
        )
      ),
      // home: const WorkspacePage(actually: AdministrationPage(),),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => SignUpPage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/workspace': (context) => WorkspacePage(actually: MonitoryPage(),),
      }
   );
  }
}
