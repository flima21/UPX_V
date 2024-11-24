import 'package:flutter/material.dart';
import 'package:upxv/services/monitory_repository.dart';
import 'package:upxv/utils/monitory.dart';
import 'package:upxv/widget/item_monitory_page.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class MonitoryPage extends StatefulWidget {
  const MonitoryPage({super.key});

  @override
  State<MonitoryPage> createState() => _MonitoryPageState();
}

class _MonitoryPageState extends State<MonitoryPage> {
  final MonitoryRepository monitoryRepository = MonitoryRepository();
  final TextEditingController dateController = TextEditingController();

  DateTime? selectedDate;

  List<Monitory> monitory = [];
  List<Monitory> tmpMonitory = [];

  @override
  void initState() {
    super.initState();

    monitoryRepository.findAll().then((value) => {
          setState(() {
            monitory = value;
            tmpMonitory = value;
          })
        });
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
              ListTile(
                title: Text("FILTRAR"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DateTimeField(
                        decoration: InputDecoration(
                          labelText: 'Data',
                          border: OutlineInputBorder(),
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        onChanged: (DateTime? value) => {
                          setState(() {
                            selectedDate = value;
                          })
                        },
                        value: selectedDate,
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: onFilterGrid, child: Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "ACOMPANHE SEU HISTÓRICO",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (Monitory item in monitory)
                      ItemMonitoryPage(
                        monitory: item,
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Total de registros ${monitory.length.toString()}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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

  void onFilterGrid() {
    setState(() {
      monitory = tmpMonitory;

      if (selectedDate != null) {
        var selectedDateFormat = DateFormat('yyyy-MM-dd').format(selectedDate!);

        monitory = monitory.where((element) {
          var selectedDateFilter = DateFormat('yyyy-MM-dd').format(element.dateTime); 
          return selectedDateFilter == selectedDateFormat;
        }).toList();

      }
    });
  }
}
