import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/models/info_card_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';

class HomeController {
  late HomeRepository repository;
  var infoCardModel = InfoCardModel(send: 0, receive: 0);
  HomeState state = HomeStateEmpty();

  HomeController() {
    repository = HomeRepositoryMock();
  }

  getEvents(VoidCallback onUpdate) async {
    state = HomeStateLoading();
    final response = await repository.getEvents();
    state = HomeStateSuccess(events: response);
    onUpdate();
  }

  getInfoCardValues(VoidCallback onUpdate) async {
    infoCardModel = await repository.getInfoCardValues();
    onUpdate();
  }
}
