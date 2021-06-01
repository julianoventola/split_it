import 'package:flutter/material.dart';

import 'package:split_it/theme/app_theme.dart';

class HomeAddButton extends StatelessWidget {
  final VoidCallback onTap;

  const HomeAddButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: 0.75,
        child: Container(
          height: 56,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppTheme.colors.borderButton,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: AppTheme.colors.homeAddButton,
            ),
          ),
        ),
      ),
    );
  }
}
