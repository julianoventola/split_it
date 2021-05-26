import 'package:flutter/material.dart';

import 'package:split_it/theme/app_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String label;
  final String iconPath;

  const SocialButtonWidget({
    Key? key,
    required this.label,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 297,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppTheme.colors.borderButton,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            child: Image.asset(
              iconPath,
              width: 24,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppTheme.colors.borderButton,
                ),
              ),
            ),
          ),
          Container(
            height: 56,
            width: 239,
            child: Center(
              child: Text(
                label,
                style: AppTheme.textStyle.button,
              ),
            ),
          )
        ],
      ),
    );
  }
}
