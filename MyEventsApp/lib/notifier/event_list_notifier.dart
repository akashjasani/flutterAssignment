import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/events_model.dart';
import '../repository/event_repository.dart';

class EventListNotifier extends StateNotifier<List<EventsModel>> {
  EventListNotifier() : super([]);

  Future<void> loadEvent() async {
    final events = await eventRepository.fetchEventList();
    state = events ?? [];
  }
}
