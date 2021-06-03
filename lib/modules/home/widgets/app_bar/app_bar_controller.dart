import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';

class AppBarController {
  late HomeRepository homeRepository;

  AppBarState state = AppBarStateEmpty();

  AppBarController() {
    homeRepository = HomeRepositoryMock();
  }

  getInfoCardsValues(VoidCallback update) async {
    state = AppBarStateLoading();
    final response = await homeRepository.getInfoCardValues();
    state = AppBarStateSuccess(infoCard: response);
    update();
  }
}
