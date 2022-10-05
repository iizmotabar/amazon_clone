import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:amazon_clone_app/router.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth_service.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authService = AuthService();

  @override
  void initState() {
    authService.getUserData(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomNavBar()
          : const AuthScreen(),
    );
  }
}
