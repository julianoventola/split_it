import 'package:split_it/shared/models/event_model.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateSuccess extends HomeState {
  List<EventModel> events;
  HomeStateSuccess({
    required this.events,
  });
}

class HomeStateFailure extends HomeState {
  final String message;
  HomeStateFailure({
    required this.message,
  });
}

class HomeStateLoading extends HomeState {}
