import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class ImageOptionButton extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Widget? icon;
  final VoidCallback onPressed;

  const ImageOptionButton({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Material(
        color: Colors.black54,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: 250,
            height: 110,
            padding: paddingAllM,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(imagePath),
                  ),
                ),
                boxM,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title, style: styles.displayMedium),
                          if (icon != null) icon!,
                        ],
                      ),
                      const Divider(color: Colors.white54),
                      Text(description, style: styles.displaySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
