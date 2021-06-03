import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';

import '../home_info_card.dart';

class BottomAppBarWidget extends StatefulWidget {
  BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    super.initState();
    controller.getInfoCardsValues(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.state.runtimeType) {
      case AppBarStateLoading:
        return Center(child: CircularProgressIndicator());
      case AppBarStateSuccess:
        final infoCardModel = (controller.state as AppBarStateSuccess).infoCard;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeInfoCard(
              value: infoCardModel.receive,
            ),
            SizedBox(width: 15),
            HomeInfoCard(
              value: infoCardModel.send,
            ),
          ],
        );

      case AppBarStateFailure:
        final message = (controller.state as AppBarStateFailure).message;
        return Text('Error loading cards: $message');

      default:
        return Container();
    }
  }
}
