import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
        ),
      ),
    );
  }
}
