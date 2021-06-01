import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/home_app_bar.dart';
import 'package:split_it/modules/home/widgets/home_info_card.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        addButtonOnTap: () {},
      ),
      body: Row(
        children: [
          HomeInfoCard(
            value: 124,
          ),
          SizedBox(width: 15),
          HomeInfoCard(
            value: -144.85,
          ),
        ],
      ),
    );
  }
}
