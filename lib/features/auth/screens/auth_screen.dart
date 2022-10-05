import 'package:amazon_clone_app/services/auth_service.dart';
import 'package:amazon_clone_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../widgets/custom_textfields.dart';

enum Auth { CreateAccount, SignIn }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth? _authInstance = Auth.CreateAccount;
  final _registerFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUpUser() {
    _authService.signUpUser(_emailController.text, _passwordController.text,
        _nameController.text, context);
  }

  void signInUser() {
    _authService.signInUser(
        _emailController.text, _passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              tileColor: _authInstance == Auth.CreateAccount
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                'Create Account.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio<Auth>(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.CreateAccount,
                groupValue: _authInstance,
                onChanged: (Auth? value) {
                  setState(() {
                    _authInstance = value;
                  });
                },
              ),
            ),
            if (_authInstance == Auth.CreateAccount)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _registerFormKey,
                  child: Column(children: [
                    CustomTextField(
                      hintText: 'Name',
                      controller: _nameController,
                    ),
                    CustomTextField(
                      hintText: 'Email',
                      controller: _emailController,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (_registerFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        }),
                  ]),
                ),
              ),
            ListTile(
              tileColor: _authInstance == Auth.SignIn
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                'Sign In.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio<Auth>(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.SignIn,
                groupValue: _authInstance,
                onChanged: (Auth? value) {
                  setState(() {
                    _authInstance = value;
                  });
                },
              ),
            ),
            if (_authInstance == Auth.SignIn)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _signInFormKey,
                  child: Column(children: [
                    CustomTextField(
                      hintText: 'Email',
                      controller: _emailController,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (_signInFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        }),
                  ]),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
