import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SuperLabsAppbar.appbar(context, height, width),
      body: Center(
        child: Text(
          'Opps! Implementation is going on',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
