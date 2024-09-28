// To parse this JSON data, do
//
//     final eventsResModel = eventsResModelFromJson(jsonString);

import 'dart:convert';

EventsResModel eventsResModelFromJson(String str) => EventsResModel.fromJson(json.decode(str));

String eventsResModelToJson(EventsResModel data) => json.encode(data.toJson());

class EventsResModel {
  final bool success;
  final String? message;
  final List<Events>? data;

  EventsResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory EventsResModel.fromJson(Map<String, dynamic> json) => EventsResModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Events>.from(json["data"]!.map((x) => Events.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Events {
  final int? id;
  final String? eventName;
  final String? eventUrl;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Events({
    this.id,
    this.eventName,
    this.eventUrl,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Events.fromJson(Map<String, dynamic> json) => Events(
    id: json["id"],
    eventName: json["event_name"],
    eventUrl: json["event_url"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_name": eventName,
    "event_url": eventUrl,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
