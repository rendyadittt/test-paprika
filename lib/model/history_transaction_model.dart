// To parse this JSON data, do
//
//     final historyTransactionModel = historyTransactionModelFromJson(jsonString);

import 'dart:convert';

HistoryTransactionModel historyTransactionModelFromJson(String str) => HistoryTransactionModel.fromJson(json.decode(str));

String historyTransactionModelToJson(HistoryTransactionModel data) => json.encode(data.toJson());

class HistoryTransactionModel {
    List<HistoryList> record;
    Metadata metadata;

    HistoryTransactionModel({
        required this.record,
        required this.metadata,
    });

    factory HistoryTransactionModel.fromJson(Map<String, dynamic> json) => HistoryTransactionModel(
        record: List<HistoryList>.from(json["record"].map((x) => HistoryList.fromJson(x))),
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

class HistoryList {
    bool status;
    int total;
    DateTime date;
    String method;

    HistoryList({
        required this.status,
        required this.total,
        required this.date,
        required this.method,
    });

    factory HistoryList.fromJson(Map<String, dynamic> json) => HistoryList(
        status: json["status"],
        total: json["total"],
        date: DateTime.parse(json["date"]),
        method: json["method"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
        "date": date.toIso8601String(),
        "method": method,
    };
}
