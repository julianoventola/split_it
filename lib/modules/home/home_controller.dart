import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/home/models/info_card_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeController {
  late HomeRepository repository;
  final events = <EventModel>[];
  var infoCardModel = InfoCardModel(send: 0, receive: 0);

  HomeController() {
    repository = HomeRepositoryMock();
  }

  getEvents(VoidCallback onUpdate) async {
    final response = await repository.getEvents();
    events.addAll(response);
    onUpdate();
  }

  getInfoCardValues(VoidCallback onUpdate) async {
    infoCardModel = await repository.getInfoCardValues();
    onUpdate();
  }
}
