import 'package:flutter/material.dart';

import 'package:split_it/modules/home/widgets/icon_dollar.dart';
import 'package:split_it/theme/app_theme.dart';

class HomeInfoCard extends StatelessWidget {
  final double value;

  const HomeInfoCard({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool positiveValue = value >= 0;
    final valueToDisplay = (positiveValue ? value : value.abs())
        .toStringAsFixed(2)
        .replaceAll(".", ",");

    // ternary: checks text color based on value
    Color color = positiveValue
        ? AppTheme.colors.infoCardPositive
        : AppTheme.colors.infoCardNegative;

    var type = positiveValue ? IconDollarType.send : IconDollarType.receive;

    return Container(
      width: 156,
      height: 168,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.colors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.colors.borderButton),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDollar(type: type),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A ${positiveValue ? 'receber' : 'pagar'}',
                style: AppTheme.textStyle.infoCardTitle,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'R\$ $valueToDisplay',
                style: AppTheme.textStyle.infoCardValue.copyWith(
                  color: color,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
