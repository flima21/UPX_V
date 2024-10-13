import 'package:flutter/material.dart';
import 'package:upxv/utils/Monitory.dart';

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
            child: Row(
              children: [
                Text(monitory.dateTime.toUtc().toString()),
                SizedBox(width: 10,),
                Text(monitory.message),
              ],
            ),
          ),
        )
      ),
    );
  }
}