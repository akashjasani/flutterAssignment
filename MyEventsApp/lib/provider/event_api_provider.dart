import 'dart:convert';

import 'package:http/http.dart' show Client;
import '../models/event_detail_model.dart';
import '../utils/constant.dart';

import '../models/events_model.dart';

class EventApiProvider {
  Client client = Client();

  Future<List<EventsModel>?> fetchEventList() async {
    final response = await client.get(Uri.parse(
        "${Constant.BASE_URL}/events?client_id=${Constant.CLIENT_KEY}"));
    print(response.body);
    if (response.statusCode == 200) {
      final events =  EventList.fromJson(jsonDecode(response.body));
      return events.eventList;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<EventDetailModel> fetchEventDetail(int id) async {
    final response = await client.get(Uri.parse(
        "${Constant.BASE_URL}/events/$id?client_id=${Constant.CLIENT_KEY}"));
    print(response.body);
    if (response.statusCode == 200) {
      return EventDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
