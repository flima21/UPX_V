import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:upxv/pages/administration_page.dart';
import 'package:upxv/pages/forgot_password_page.dart';
import 'package:upxv/pages/sign_up_page.dart';
import 'package:upxv/pages/workspace_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 500,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.all(10),
                            children: [
                              Text(
                                loremIpsum(words: 2),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                loremIpsum(words: 100),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          child: const Text('FECHAR'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.help_sharp),
      ),
      appBar: AppBar(
        title: Text("CROSS LINE"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: FlutterLogo(
                    size: 23,
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: 'E-mail',
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: 'Senha',
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                onPressed: loginMockUser,
                                child: Text("ENTRAR"),
                              )),
                              // Expanded(child: ElevatedButton(onPressed: () {
                              //   Navigator.push(context, MaterialPageRoute(builder: (context) => WorkspacePage(actually: AdministrationPage(),)));
                              // }, child: Text("ENTRAR"),)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                              }, child: Text("REGISTRAR")))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                              }, child: Text("ESQUECI A SENHA")))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginMockUser() async {
    String emailText = emailController.text;
    String password = passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailText, password: password).then((e) => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkspacePage(actually: AdministrationPage(),)))
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'USUÁRIO OU SENHA INVÁLIDA',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
