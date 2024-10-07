import 'package:flutter/material.dart';
import 'package:upxv/pages/help_page.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:upxv/widget/home_started_button_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BEM VINDO CROSS LINE"),
        // leading: FlutterLogo(size: 12),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: .3,
            image: AssetImage("assets/securityLogo.png"),
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ListView(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text(loremIpsum(words: 60),textAlign: TextAlign.justify,),
                            ),
                          ),
                        ),
                        
                        Container(
                          child: Card(
                            child: ListTile(
                              leading: Icon(Icons.handshake_outlined),
                              title: Text('O controle na palma da sua mão'),
                            ),
                          ),
                        ),
                              
                        Container(
                          child: Card(
                            child: ListTile(
                              leading: Image.asset('assets/mysqlLogo.png'),
                              title: Text('A flexibidade do firebase'),
                            ),
                          ),
                        ),
                              
                        Container(
                          child: Card(
                            child: ListTile(
                              leading: Image.asset('assets/pythonLogo.png'),
                              title: Text('A agilidade de python'),
                            ),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: 200, // Define uma altura fixa para o GridView
                            child: GridView.count(
                              primary: false,
                              padding: EdgeInsets.all(8),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              children: [
                                Card(
                                  borderOnForeground: true,
                                  child: Icon(Icons.lock_clock_outlined,size: 80,)
                                )
                              ],
                              physics: NeverScrollableScrollPhysics(), // Desabilita o scroll do GridView
                            ),
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                              backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber)
                            ),
                            onPressed: () {}, 
                            child: Text("FAÇA PARTE",style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ]
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}