import 'dart:convert';

import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:amazon_clone_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/user_provider.dart';

class AuthService {
//signUp the user using nodejs
  Future signUpUser(
      String email, String password, String name, BuildContext context) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      final url = Uri.parse('$uri/api/signup');
      var response = await http.post(
        url,
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.body.isEmpty) {}
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            showSnackbar(
                context, 'User created successfully, You can now Log in');
          });

      // var responseData = json.decode(response.body);
      // if (response.statusCode == 200) {
      //   return responseData;
      // } else {
      //   throw HttpException(responseData['message']);
      // }
    } catch (error) {
      showSnackbar(context, error.toString());
      rethrow;
    }
  }

  Future signInUser(String email, String password, BuildContext context) async {
    try {
      final url = Uri.parse('$uri/api/signin');
      var response = await http.post(
        body: json.encode({
          'email': email,
          'password': password,
        }),
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      if (response.body.isEmpty) {}
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);

            await prefs.setString(
                'x-auth-token', json.decode(response.body)['token']);
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          });
    } catch (error) {
      showSnackbar(context, error.toString());
      rethrow;
    }
  }
}
