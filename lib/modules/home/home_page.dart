import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/event_tile.dart';
import 'package:split_it/modules/home/widgets/home_app_bar.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final events = [
    EventModel(
      title: 'Churrasco',
      created: DateTime.now(),
      value: 50.5,
      friends: 2,
    ),
    EventModel(
      title: 'Aniversário',
      created: DateTime.now().subtract(Duration(days: 20)),
      value: -145.5,
      friends: 13,
    ),
    EventModel(
      title: 'Churrasco',
      created: DateTime.now(),
      value: 50.5,
      friends: 2,
    ),
    EventModel(
      title: 'Aniversário',
      created: DateTime.now().subtract(Duration(days: 20)),
      value: -145.5,
      friends: 13,
    ),
    EventModel(
      title: 'Churrasco',
      created: DateTime.now(),
      value: 50.5,
      friends: 2,
    ),
    EventModel(
      title: 'Aniversário',
      created: DateTime.now().subtract(Duration(days: 20)),
      value: -145.5,
      friends: 13,
    ),
    EventModel(
      title: 'Churrasco',
      created: DateTime.now(),
      value: 50.5,
      friends: 2,
    ),
    EventModel(
      title: 'Aniversário',
      created: DateTime.now().subtract(Duration(days: 20)),
      value: -145.5,
      friends: 13,
    ),
  ];
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
        padding: EdgeInsets.fromLTRB(32, 40, 32, 0),
        child: ListView(
          children: events
              .map((event) => EventTile(
                    model: event,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
