import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/event_detail_model.dart';

import '../repository/event_repository.dart';

class EventDetailNotifier extends StateNotifier<EventDetailModel?> {
  EventDetailNotifier() : super(null);

  Future<void> loadEventDetail(int id) async {
    final eventDetail = await eventRepository.fetchEventDetail(id);
    state = eventDetail;
  }
}
