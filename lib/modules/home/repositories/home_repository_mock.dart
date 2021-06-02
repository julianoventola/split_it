import 'package:split_it/modules/home/models/info_card_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock implements HomeRepository {
  final _events = [
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
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 1));
    return _events;
  }

  @override
  Future<InfoCardModel> getInfoCardValues() async {
    await Future.delayed(Duration(seconds: 1));
    var positiveValues = _events
        .where((element) => element.value > 0)
        .fold<double>(
            0, (previousValue, element) => previousValue += element.value);
    var negativeValues = _events
        .where((element) => element.value < 0)
        .fold<double>(
            0, (previousValue, element) => previousValue += element.value);

    return InfoCardModel(receive: positiveValues, send: negativeValues);
  }
}
