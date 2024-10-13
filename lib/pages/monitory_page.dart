import 'package:flutter/material.dart';
import 'package:upxv/utils/Monitory.dart';
import 'package:upxv/widget/item_monitory_page.dart';

class MonitoryPage extends StatefulWidget {
  const MonitoryPage({super.key});

  @override
  State<MonitoryPage> createState() => _MonitoryPageState();
}

class _MonitoryPageState extends State<MonitoryPage> {

  final List<Monitory> monitory = [];

  @override
  void initState() {
    // TODO: implement initState
    populateListTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Card(
          shadowColor: Colors.amber,
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text("ACOMPANHE SEU HISTÓRICO",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for(Monitory item in monitory)
                      ItemMonitoryPage(monitory: item,),
                    
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text("Total de registros ${monitory.length.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void populateListTest() {
    setState(() {
      for (var i = 0; i < 20; i++) {
        monitory.add(Monitory(dateTime: DateTime.now(),location: "itu",message: "oi"));
      }    
    });
  }
}