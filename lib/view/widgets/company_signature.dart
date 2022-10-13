import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CompanySignature extends StatelessWidget {
  const CompanySignature({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '©',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(color: black),
          ),
          TextSpan(
            text: ' Envate Technologies',
            style:
                Theme.of(context).textTheme.headline6!.copyWith(color: black),
          )
        ],
      ),
    );
  }
}
