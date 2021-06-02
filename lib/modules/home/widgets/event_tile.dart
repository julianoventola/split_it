import 'package:flutter/material.dart';

import 'package:split_it/modules/home/widgets/icon_dollar.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'package:intl/intl.dart';

class EventTile extends StatelessWidget {
  final EventModel model;

  const EventTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd MMM');

    var valueToDisplay = (model.value > 0 ? model.value : model.value.abs())
        .toStringAsFixed(2)
        .replaceAll(".", ",");
    var dollarType =
        model.value > 0 ? IconDollarType.send : IconDollarType.receive;
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
                    model.title,
                    style: AppTheme.textStyle.eventTileTitle,
                  ),
                  subtitle: Text(
                    formatter.format(model.created),
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
                        '${model.friends} pessoa${model.friends == 1 ? '' : 's'}',
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
