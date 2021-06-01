import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

enum IconDollarType { send, receive }

class IconDollar extends StatelessWidget {
  final IconDollarType type;
  const IconDollar({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ternary: checks colors based on IconDollarType
    Color backInfoColor = type == IconDollarType.send
        ? AppTheme.colors.backgroundIconInfoCardPositive
        : AppTheme.colors.backgroundIconInfoCardNegative;

    String iconDisplay = type == IconDollarType.send
        ? 'assets/images/positive-arrow.png'
        : 'assets/images/negative-arrow.png';

    return Container(
      width: 48,
      height: 48,
      child: Center(
        child: Image.asset(
          iconDisplay,
          height: 24,
          width: 24,
        ),
      ),
      decoration: BoxDecoration(
        color: backInfoColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
