import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:upxv/pages/administration_page.dart';
import 'package:upxv/pages/monitory_page.dart';
import 'package:upxv/services/authentication_service.dart';
import 'package:upxv/services/toast_service.dart';

class WorkspacePage extends StatefulWidget {
  const WorkspacePage({super.key, required this.actually});

  @override
  State<WorkspacePage> createState() => _WorkspacePageState();

  final Widget actually;
}

class _WorkspacePageState extends State<WorkspacePage> {
  late Widget widgetSelected;
  final AuthenticationService _authService = AuthenticationService();
  
  @override
  void initState() {
    // TODO: implement initState
    // implement auth
    isAuth();

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
    // initiliaze auth
    ToastService toastService = ToastService(context: context);

    await _authService.logout().then((response) => {
      toastService.colorBackground = Colors.green,
      toastService.colorFont = Colors.black,
      toastService.message = 'O usuário foi deslogado',
      toastService.show(),
      
      // change screen
      Navigator.pushReplacementNamed(context, '/login')
    }).catchError((error) => {
      toastService.colorBackground = Colors.red,
      toastService.colorFont = Colors.white,
      toastService.message = error.toString(),
      toastService.show(),
    });

  }

  void isAuth() async {
    try {
      if (_authService.me() == null) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
    on Exception catch (_) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}