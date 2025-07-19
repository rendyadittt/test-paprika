// To parse this JSON data, do
//
//     final meModel = meModelFromJson(jsonString);

import 'dart:convert';

MeModel meModelFromJson(String str) => MeModel.fromJson(json.decode(str));

String meModelToJson(MeModel data) => json.encode(data.toJson());

class MeModel {
    Record record;
    Metadata metadata;

    MeModel({
        required this.record,
        required this.metadata,
    });

    factory MeModel.fromJson(Map<String, dynamic> json) => MeModel(
        record: Record.fromJson(json["record"]),
        metadata: Metadata.fromJson(json["metadata"]),
    );

    Map<String, dynamic> toJson() => {
        "record": record.toJson(),
        "metadata": metadata.toJson(),
    };
}

class Metadata {
    String id;
    bool private;
    DateTime createdAt;
    String name;

    Metadata({
        required this.id,
        required this.private,
        required this.createdAt,
        required this.name,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        id: json["id"],
        private: json["private"],
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "private": private,
        "createdAt": createdAt.toIso8601String(),
        "name": name,
    };
}

class Record {
    String name;
    String photo;
    int balance;

    Record({
        required this.name,
        required this.photo,
        required this.balance,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        name: json["name"],
        photo: json["photo"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "balance": balance,
    };
}
