import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Your Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'See all',
                style: TextStyle(fontSize: 12, color: Colors.teal),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.blue.shade100,
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                Container(
                  color: Colors.green.shade100,
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.5,
                )
              ],
            ))
      ],
    );
  }
}
