import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    return Container(
      color: const Color(0xFFEAEAEA),
      child: Center(
        child: Text(user.name.toString()),
      ),
    );
  }
}
