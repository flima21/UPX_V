import 'package:flutter/material.dart';
import 'package:upxv/pages/hello_page.dart';
import 'package:upxv/pages/profile_page.dart';

class AdministrationPage extends StatelessWidget {
  const AdministrationPage({super.key});

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
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HelloPage()));
                        },
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
}
