import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upxv/pages/administration_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                    // suffix: TextButton(onPressed: () { setIsObscured(); }, child: _isLock),
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
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty & password.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
          showToast('Usuário logado',Colors.green),
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdministrationPage()))
        });
      } on FirebaseAuthException catch(e) {
        showToast(e.message.toString(), Colors.red);
      }
    } 
    else {
      showToast("Usuário e Senha são obrigatórios",Colors.red);
    }
  }

  void showToast(String message, Color color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: color,
      ),
    );
   }
}