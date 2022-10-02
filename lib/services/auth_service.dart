import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService {
//signUp the user using nodejs
  Future signUp(
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

      final url = Uri.parse('$uri/auth/signup');
      var response = await http.post(
        url,
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
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

  
}
