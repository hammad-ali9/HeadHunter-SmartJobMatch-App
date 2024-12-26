import 'package:flutter/material.dart';

import '../../utils/customWidgets/my-text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MyText(text: "Profile"),
      ),
    );
  }
}
