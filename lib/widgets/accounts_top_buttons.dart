import 'package:flutter/material.dart';

import 'single_account_button.dart';

class AccountsTopButtons extends StatelessWidget {
  const AccountsTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SingleAccountButton(
              title: 'Your Orders',
              onTap: () {},
            ),
            SingleAccountButton(
              title: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SingleAccountButton(
              title: 'Log Out',
              onTap: () {},
            ),
            SingleAccountButton(
              title: 'Your Wish List',
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
