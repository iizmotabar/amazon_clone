import 'dart:convert';

import 'package:amazon_clone_app/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandling(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, json.decode(response.body)['msg']);
      break;
    case 500:
      showSnackbar(context, '${response.statusCode}: Internal Server Error');
      break;
    default:
      showSnackbar(context, response.body);
      
  }
}
