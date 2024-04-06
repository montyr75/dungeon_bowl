import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBannerTitle extends StatelessWidget {
  final String title;

  const MainBannerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return Container(
      width: 370 * .8,
      height: 160 * .8,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, .3),
            child: Text(
              title,
              style: styles.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class PageBannerTitle extends StatelessWidget {
  final String title;

  const PageBannerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return Container(
      width: 360 * .7,
      height: 150 * .7,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/page_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: styles.displayLarge,
        ),
      ),
    );
  }
}
