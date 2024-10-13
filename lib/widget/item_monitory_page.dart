import 'package:flutter/material.dart';
import 'package:upxv/utils/monitory.dart';

class ItemMonitoryPage extends StatelessWidget {
  const ItemMonitoryPage({super.key, required this.monitory});

  final Monitory monitory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 2,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(monitory.dateTime.toIso8601String().toString()),
                    SizedBox(width: 10,),
                    Text(monitory.message),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(monitory.image),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}