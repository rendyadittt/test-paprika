// To parse this JSON data, do
//
//     final advertisingModel = advertisingModelFromJson(jsonString);

import 'dart:convert';

AdvertisingModel advertisingModelFromJson(String str) => AdvertisingModel.fromJson(json.decode(str));

String advertisingModelToJson(AdvertisingModel data) => json.encode(data.toJson());

class AdvertisingModel {
    List<Advertising> record;
    Metadata metadata;

    AdvertisingModel({
        required this.record,
        required this.metadata,
    });

    factory AdvertisingModel.fromJson(Map<String, dynamic> json) => AdvertisingModel(
        record: List<Advertising>.from(json["record"].map((x) => Advertising.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
    );

    Map<String, dynamic> toJson() => {
        "record": List<dynamic>.from(record.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
    };
}

class Metadata {
    String id;
    bool private;
    DateTime createdAt;

    Metadata({
        required this.id,
        required this.private,
        required this.createdAt,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        id: json["id"],
        private: json["private"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "private": private,
        "createdAt": createdAt.toIso8601String(),
    };
}

class Advertising {
    String image;
    String desc;

    Advertising({
        required this.image,
        required this.desc
    });

    factory Advertising.fromJson(Map<String, dynamic> json) => Advertising(
        image: json["image"],
        desc: json["desc"]
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "desc": desc
    };
}
