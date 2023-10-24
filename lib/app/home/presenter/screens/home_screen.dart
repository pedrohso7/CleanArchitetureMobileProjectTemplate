import 'package:flutter/material.dart';
import '../../../../core/widgets/default_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.onPressLogoutButton,
  }) : super(key: key);
  final VoidCallback onPressLogoutButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultButton(
        label: 'Logout',
        onPressed: onPressLogoutButton,
      ),
    );
  }
}
