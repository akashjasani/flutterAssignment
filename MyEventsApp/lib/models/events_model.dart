class EventList {
  List<EventsModel>? _eventList;

  EventList.fromJson(Map<String, dynamic> parsedJson) {
    List<EventsModel> temp = [];
    for (int i = 0; i < parsedJson['events'].length; i++) {
      EventsModel result = EventsModel(parsedJson['events'][i]);
      temp.add(result);
    }
    _eventList = temp;
  }

  List<EventsModel>? get eventList => _eventList;
}

class EventsModel {
  int? _id;
  String? _title;
  String? _date;
  String? _time;
  String? _venue;

  EventsModel(eventJson) {
    _id = eventJson['id'];
    _title = eventJson['short_title'];
    String rawDate = eventJson['datetime_local'];
    _date = rawDate.substring(0, rawDate.indexOf('T'));
    _time = rawDate.substring(rawDate.indexOf('T')+1);
    _venue = eventJson['venue']['name'];
  }

  int? get id => _id;

  String? get title => _title;

  String? get date => _date;

  String? get venue => _venue;

  String? get time => _time;
}
