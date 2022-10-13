import 'package:flutter/material.dart';

class SuperLabsAppbar {
  static appbar(BuildContext context, double height, double width) {
    return AppBar(
      centerTitle: true,
      title: SizedBox(
        width: 300,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.1,
              child: const Image(
                image: AssetImage(
                  'assets/images/lab_logo.png',
                ),
              ),
            ),
            Text(
              'My Super Labs Pathology Center',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
