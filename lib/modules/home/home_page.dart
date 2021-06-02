import 'package:flutter/material.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/modules/home/widgets/event_tile.dart';
import 'package:split_it/modules/home/widgets/home_app_bar.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';

import 'models/info_card_model.dart';
import 'repositories/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getEvents(() {
      setState(() {});
    });
    controller.getInfoCardValues(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        infoCardModel: controller.infoCardModel,
        context: context,
        user: user,
        addButtonOnTap: () {},
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(32, 40, 32, 0),
          child:
              // ternary: check home state to return Widget
              (controller.state is HomeStateLoading)
                  ? Center(child: CircularProgressIndicator())
                  : (controller.state is HomeStateFailure)
                      ? Text((controller.state as HomeStateFailure).message)
                      : ListView(
                          children: (controller.state as HomeStateSuccess)
                              .events
                              .map((event) => EventTile(
                                    model: event,
                                  ))
                              .toList(),
                        )),
    );
  }
}
