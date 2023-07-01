import '../models/event_detail_model.dart';

import '../models/events_model.dart';
import '../provider/event_api_provider.dart';

class EventRepository {
  final eventApiProvider = EventApiProvider();

  Future<List<EventsModel>?> fetchEventList() =>
      eventApiProvider.fetchEventList();

  Future<EventDetailModel> fetchEventDetail(int id) =>
      eventApiProvider.fetchEventDetail(id);
}

final eventRepository = EventRepository();
