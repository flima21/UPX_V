import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    helper: Text(
                      "Exemplo: José da Silva",
                      style: TextStyle(
                        color: Colors.grey.shade600
                      ),
                    )
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    enabled: false,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
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
                        onPressed: () {
                      
                        }, 
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
}