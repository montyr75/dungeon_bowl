import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';


class PageNavButton extends StatelessWidget {
  final String label;
  final ButtonColor color;
  final VoidCallback onPressed;

  const PageNavButton({
    super.key,
    required this.label,
    this.color = ButtonColor.blue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: 165,
          height: 40,
          child: InkWell(
            radius: 100,
            onTap: onPressed,
            child: Ink.image(
              image: AssetImage('assets/images/${color.name}_button.png'),
              fit: BoxFit.fill,
              child: Center(
                child: Text(
                  label,
                  style: styles.displayMedium.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonColor {
  blue,
  green,
  red;
}