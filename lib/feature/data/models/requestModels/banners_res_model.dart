// To parse this JSON data, do
//
//     final bannersResModel = bannersResModelFromJson(jsonString);

import 'dart:convert';

BannersResModel bannersResModelFromJson(String str) => BannersResModel.fromJson(json.decode(str));

String bannersResModelToJson(BannersResModel data) => json.encode(data.toJson());

class BannersResModel {
  final bool success;
  final String? message;
  final List<Banners>? data;

  BannersResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory BannersResModel.fromJson(Map<String, dynamic> json) => BannersResModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Banners>.from(json["data"]!.map((x) => Banners.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Banners {
  final int? id;
  final int? userId;
  final String? image;
  final String? imageName;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Banners({
    this.id,
    this.userId,
    this.image,
    this.imageName,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
    imageName: json["image_name"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
    "image_name": imageName,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
