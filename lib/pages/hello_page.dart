import 'package:flutter/material.dart';
import 'package:upxv/pages/home_page.dart';
import 'package:upxv/pages/login_page.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  // Color _colorBackground = Colors.transparent;
  Color _colorBackgroudButton = Colors.amber;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: .3,
            image: AssetImage("assets/securityLogo.png"),
          )
        ),

        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SEJA BEM VINDO AO CROSS LINE!",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),),
                  Text(
                    "O SEU APLICATIVO DE SEGURANÇA PARA SUA ÁREA RESIDENCIAL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            // Botão para indicar que o usuário pode tocar ou arrastar
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              pageStarted();
                            },
                            child: Text("VAMOS COMEÇAR!",style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                            style: ButtonStyle(
                              foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                              backgroundColor: WidgetStatePropertyAll<Color>(_colorBackgroudButton)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              pageLogin();
                            },
                            child: Text("JÁ SOU CLIENTE",style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pageStarted() {
    Navigator.push(
      context, 
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      )
    );
  }

  void pageLogin() {
    Navigator.push(
      context, 
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      )
    );
  }


}