import 'package:flutter/material.dart';
import 'package:upxv/services/authentication_service.dart';
import 'package:upxv/services/toast_service.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  AuthenticationService _authenticationService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REDEFINIR A SENHA"),
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
                Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed: updatePassword, child: Text("REDEFINIR A SENHA"))),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  void updatePassword() async {
    ToastService toastService = ToastService(context: context);
    
    if (emailController.text.isNotEmpty) {
      await _authenticationService.changePassword(emailController.text).then((response) => {
        toastService.colorBackground = Colors.blue,
        toastService.colorFont = Colors.black,
        toastService.message = "O link de redefinição senha foi enviado para o email ${emailController.text}",
        toastService.show(),

        Navigator.pushReplacementNamed(context, '/login')
      });
    }
    else {
      toastService.colorBackground = Colors.red;
      toastService.colorFont = Colors.black;
      toastService.message = 'Campo e-mail não pode ser vazio!';
      toastService.show();
    }
  }
}