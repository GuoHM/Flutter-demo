class Event {
  int eventId;
  String eventName;
  String description;

  Event(int eventId, String eventName, String description) {
    this.eventId = eventId;
    this.eventName = eventName;
    this.description = description;
  }

  Event.fromJson(Map json)
  :eventId = json['eventId'],
  eventName = json['eventName'],
  description = json['description'];

  Map toJson() {
    return {'eventId':this.eventId,'eventName':this.eventName,'description':this.description};
  }
}