import 'package:flutter/material.dart';

import 'package:split_it/modules/home/widgets/icon_dollar.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final double value;
  final String friends;

  const EventTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var valueToDisplay = (value > 0 ? value : value.abs())
        .toStringAsFixed(2)
        .replaceAll(".", ",");
    var dollarType = value > 0 ? IconDollarType.send : IconDollarType.receive;
    return Row(
      children: [
        IconDollar(type: dollarType),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    title,
                    style: AppTheme.textStyle.eventTileTitle,
                  ),
                  subtitle: Text(
                    subTitle,
                    style: AppTheme.textStyle.eventTileSubTitle,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'R\$ $valueToDisplay',
                        style: AppTheme.textStyle.eventTileValue,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        friends,
                        style: AppTheme.textStyle.eventTileFriend,
                      ),
                    ],
                  ),
                ),
                Opacity(
                  opacity: 0.8,
                  child: Divider(
                    thickness: 1,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
