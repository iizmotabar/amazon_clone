import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/widgets/accounts_top_buttons.dart';
import 'package:amazon_clone_app/widgets/app_bar_greetings.dart';
import 'package:amazon_clone_app/widgets/orders.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_logo.png',
                  width: 120,
                  height: 120,
                  color: Colors.black,
                ),
              ),
              Container(
                child: Row(
                  children: const [
                    Icon(Icons.notifications_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.search_outlined)
                  ],
                ),
              )
            ],
          ),
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: Column(
        children: const [
          AppBarGreetings(),
          SizedBox(
            height: 10,
          ),
          AccountsTopButtons(),
          SizedBox(
            height: 30,
          ),
          Orders()
        ],
      ),
    );
  }
}
