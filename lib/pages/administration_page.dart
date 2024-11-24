import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upxv/pages/hello_page.dart';
import 'package:upxv/pages/profile_page.dart';

class AdministrationPage extends StatefulWidget {
  const AdministrationPage({super.key});

  @override
  State<AdministrationPage> createState() => _AdministrationPageState();
}

class _AdministrationPageState extends State<AdministrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  Card(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                        child: ListTile(
                            title: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Profile"),
                          ],
                        ))),
                  ),
                  Card(
                    child: GestureDetector(
                        onTap: onSignOut,
                        child: ListTile(
                            title: Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Logout"),
                          ],
                        ))),
                  ),
                ],
              ))
            ],
          )
          // Card(
          //   child: GestureDetector(
          //     onTap: () {

          //     },
          //   ),
          // )
          ),
    );
  }

  void onSignOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((e) => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HelloPage()))
      });
    } on FirebaseAuthException catch(e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
