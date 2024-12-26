import 'package:flutter/material.dart';

import '../../utils/customWidgets/my-text.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(text: "Application"),
      ),
    );
  }
}
