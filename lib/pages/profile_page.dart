import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upxv/services/authentication_service.dart';
import 'package:upxv/services/toast_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // attribute the name in email
    getUser();
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationService authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("MINHA CONTA",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    enabled: false,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller:passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: updatePassword,
                        child: Text("SALVAR")
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getUser() async {
    emailController.text = authenticationService.me()!.email.toString();
  }

  void updatePassword() async {
    ToastService toastService = ToastService(context: context);
    User? userInformation = await authenticationService.me();

    if (userInformation != null) {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        toastService.colorBackground = Colors.red;
        toastService.colorFont = Colors.black;
        toastService.message = 'Campo e-mail/senha não pode ser vazio!';
      }
      else {
        await userInformation.updatePassword(passwordController.text);
        
        toastService.colorBackground = Colors.blue;
        toastService.colorFont = Colors.black;
        toastService.message = 'A senha foi trocada com sucesso';
      }
    }
    else {
        toastService.colorBackground = Colors.red;
        toastService.colorFont = Colors.black;
        toastService.message = 'Usuário não foi identificado!';
    }
  
    toastService.show();
  }
}