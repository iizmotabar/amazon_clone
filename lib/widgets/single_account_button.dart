import 'package:flutter/material.dart';

class SingleAccountButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SingleAccountButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: OutlinedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    color: Colors.black12,
                    width: 0.0,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black12.withOpacity(0.1))),
            onPressed: onTap,
            child: Text(
              title.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}
