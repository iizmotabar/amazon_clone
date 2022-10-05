import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/global_variables.dart';
import '../providers/user_provider.dart';

class AppBarGreetings extends StatelessWidget {
  const AppBarGreetings({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserProvider>(context).user.name;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: RichText(
        text: TextSpan(
          text: 'Hello, ',
          style: const TextStyle(fontSize: 22, color: Colors.black),
          children: [
            TextSpan(
              text: userName,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
