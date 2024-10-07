import 'package:flutter/material.dart';
import 'package:upxv/pages/hello_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isObscured = true;
  Icon _isLock = Icon(Icons.lock);

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
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    // suffix: TextButton(onPressed: () { setIsObscured(); }, child: _isLock),
                    labelText: 'Nova Senha',
                  ),
                  obscureText: _isObscured,
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    // suffix: TextButton(onPressed: () { setIsObscured(); }, child: _isLock),
                    labelText: 'Confirme Senha',
                  ),
                  obscureText: _isObscured,
                ),
                SizedBox(height: 10,),
                CheckboxListTile(
                  title: Text("Ver senha"),
                  value: !_isObscured,
                  onChanged: (bool? value) {
                    setIsObscured();
                  },
                  secondary: _isLock
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HelloPage()));
                    }, child: Text("REDEFINIR A SENHA"))),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  void setIsObscured() {
    setState(() {
      _isObscured = _isObscured ? false : true;
      _isLock = _isObscured ? Icon(Icons.lock_open) : Icon(Icons.lock);
    });
  }
}