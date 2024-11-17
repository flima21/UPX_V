import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:upxv/pages/administration_page.dart';
import 'package:upxv/pages/hello_page.dart';
import 'package:upxv/pages/monitory_page.dart';

class WorkspacePage extends StatefulWidget {
  const WorkspacePage({super.key, required this.actually});

  @override
  State<WorkspacePage> createState() => _WorkspacePageState();

  final Widget actually;
}

class _WorkspacePageState extends State<WorkspacePage> {
  late Widget widgetSelected;
  
  @override
  void initState() {
    // TODO: implement initState
    isSignIn();
    super.initState();
    widgetSelected = widget.actually;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              accountName: Text(loremIpsum(words: 2), style: TextStyle(color: Colors.black),), 
              accountEmail: Text(loremIpsum(words: 1), style: TextStyle(color: Colors.black),),
              currentAccountPicture: FlutterLogo(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton(
                onPressed: (){
                  setState(() {
                    widgetSelected = AdministrationPage();
                  });
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AdministrationPage()));
                }, 
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    Text("Administração"),
                  ],
                ), 
                style: ButtonStyle(alignment: AlignmentDirectional.bottomStart),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton(
                onPressed: (){
                  setState(() {
                    widgetSelected = MonitoryPage();
                  });
                }, 
                child: Row(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(width: 10,),
                    Text("Monitoramento"),
                  ],
                ), 
                style: ButtonStyle(alignment: AlignmentDirectional.bottomStart),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton(
                onPressed: onSignOut,
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10,),
                    Text("Logout"),
                  ],
                ), 
                style: ButtonStyle(alignment: AlignmentDirectional.bottomStart),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Center(child: widgetSelected),
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

  void isSignIn() async {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/login');
      } 
    });
  }
}