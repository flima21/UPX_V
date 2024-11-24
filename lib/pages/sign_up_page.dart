import 'package:flutter/material.dart';
import 'package:upxv/services/authentication_service.dart';
import 'package:upxv/services/toast_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthenticationService _authenticationService = AuthenticationService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CADASTRE-SE"),
      ),
            body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed: onSignUp, child: Text("CADASTRAR"))),
                  ],
                ),
              ],
            ),
          ),
        )
      ),

    );
  }

  void onSignUp() async {
    ToastService toastService = ToastService(context: context);

    if (emailController.text.isNotEmpty & passwordController.text.isNotEmpty) {
      _authenticationService.register(emailController.text, passwordController.text).then((response) => {
        Navigator.pushReplacementNamed(context, '/workspace')
      });
    } 
    else {
      toastService.colorBackground = Colors.red;
      toastService.colorFont = Colors.black;
      toastService.message = 'Campo e-mail/senha não pode ser vazio!';
      toastService.show();
    }
  }
}