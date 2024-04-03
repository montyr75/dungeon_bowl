import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class BannerTitle extends StatelessWidget {
  final String title;

  const BannerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: paddingAllXXL,
        child: Text(
          title,
          style: styles.displayLarge,
        ),
      ),
    );
  }
}
