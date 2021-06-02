import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/event_tile.dart';
import 'package:split_it/modules/home/widgets/home_app_bar.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        context: context,
        user: user,
        addButtonOnTap: () {},
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(32, 40, 32, 16),
        child: ListView(
          children: [
            EventTile(
              title: 'Churrasco',
              subTitle: '01 março',
              value: 50.35,
              friends: '2 amigos',
            ),
          ],
        ),
      ),
    );
  }
}
