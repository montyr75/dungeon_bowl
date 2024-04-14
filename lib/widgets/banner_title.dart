import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainBannerTitle extends StatelessWidget {
  final String title;

  const MainBannerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return Container(
      width: 1271 * .275,
      height: 460 * .275,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: styles.displayLarge.copyWith(fontSize: 32),
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
      width: 1354 * .25,
      height: 392 * .25,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/page_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: const Alignment(0, .25),
        child: Text(
          title,
          style: styles.displayLarge,
        ),
      ),
    );
  }
}
