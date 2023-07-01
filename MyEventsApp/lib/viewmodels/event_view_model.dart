import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/event_detail_model.dart';
import '../models/events_model.dart';
import '../notifier/event_detail_notifier.dart';
import '../notifier/event_list_notifier.dart';

class EventViewModel {
  static final eventListProvider =
      StateNotifierProvider<EventListNotifier, List<EventsModel>>(
          (ref) => EventListNotifier());

  static final eventDetailProvider =
  StateNotifierProvider<EventDetailNotifier, EventDetailModel?>(
          (ref) => EventDetailNotifier());
}
