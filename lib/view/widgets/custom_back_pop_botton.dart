import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/common_functions.dart';
import '../../utils/colors.dart';

class CustomBackPopButton extends StatelessWidget {
  const CustomBackPopButton({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            // color: Colors.amber,
            width: width * 0.2,
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.angleLeft,
                  size: 20,
                  color: black,
                ),
                CommonFunction.blankSpace(context, 0, 0.01),
                Text(
                  'Back',
                  style: Theme.of(context).textTheme.headline5!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
