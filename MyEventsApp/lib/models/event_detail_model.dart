class EventDetailModel {
  int? _id;
  String? _type;
  String? _title;
  String? _date;
  String? _time;
  Venue? _venue;
  List<Performers>? _performers;

  EventDetailModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _type = parsedJson['type'];
    _title = parsedJson['title'];
    String rawDate = parsedJson['datetime_local'];
    _date = rawDate.substring(0, rawDate.indexOf('T'));
    _time = rawDate.substring(rawDate.indexOf('T')+1);
    _venue = Venue(parsedJson['venue']);
    List<Performers> temp = [];
    for (int i = 0; i < parsedJson['performers'].length; i++) {
      Performers result = Performers(parsedJson['performers'][i]);
      temp.add(result);
    }
    _performers = temp;
  }

  int? get id => _id;

  String? get type => _type;

  String? get title => _title;

  String? get date => _date;

  Venue? get venue => _venue;

  String? get time => _time;

  List<Performers>? get performers => _performers;
}

class Venue {
  String? name;
  String? country;
  String? address;
  String? extendedAddress;
  String? displayLocation;
  Location? location;

  Venue(venue) {
    name = venue['name'];
    country = venue['country'];
    address = venue['address'];
    extendedAddress = venue['extended_address'];
    displayLocation = venue['display_location'];
    location = Location(venue['lat'], venue['lon']);
  }
}

class Location {
  final double? lat;
  final double? lang;

  Location(this.lat, this.lang);
}

class Performers {
  int? id;
  String? type;
  String? name;
  String? image;
  String? url;
  int? upcomingEvent;

  Performers(performer) {
    id = performer['id'];
    type = performer['type'];
    name = performer['name'];
    image = performer['image'];
    url = performer['url'];
    upcomingEvent = performer['num_upcoming_events'];
  }
}
