import 'package:flutter/material.dart';
import 'package:freshcut_test/utils/utils.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        borderRadius: 35,
        blur: 9,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF775f27),
              Color((0xFF14120c)),
            ],
            stops: [
              0.1,
              0.8
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kSunGold.withOpacity(0.6),
            const Color(0xFF392904).withOpacity(0.2),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Display icon
            icon,
            const Gap(9),
            Text(
              text,
              style: const TextStyle(
                color: white,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
