import 'package:split_it/modules/home/models/info_card_model.dart';

abstract class AppBarState {}

class AppBarStateEmpty extends AppBarState {}

class AppBarStateSuccess extends AppBarState {
  InfoCardModel infoCard;
  AppBarStateSuccess({
    required this.infoCard,
  });
}

class AppBarStateFailure extends AppBarState {
  final String message;
  AppBarStateFailure({
    required this.message,
  });
}

class AppBarStateLoading extends AppBarState {}
