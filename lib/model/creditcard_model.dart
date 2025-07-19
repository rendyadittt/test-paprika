// To parse this JSON data, do
//
//     final creditCardModel = creditCardModelFromJson(jsonString);

import 'dart:convert';

CreditCardModel creditCardModelFromJson(String str) => CreditCardModel.fromJson(json.decode(str));

String creditCardModelToJson(CreditCardModel data) => json.encode(data.toJson());

class CreditCardModel {
    List<Holder> record;
    Metadata metadata;

    CreditCardModel({
        required this.record,
        required this.metadata,
    });

    factory CreditCardModel.fromJson(Map<String, dynamic> json) => CreditCardModel(
        record: List<Holder>.from(json["record"].map((x) => Holder.fromJson(x))),
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

class Holder {
    int id;
    String category;
    String logo;
    String cardHolder;
    int balance;
    String cardNumber;

    Holder({
        required this.id,
        required this.category,
        required this.logo,
        required this.cardHolder,
        required this.balance,
        required this.cardNumber,
    });

    factory Holder.fromJson(Map<String, dynamic> json) => Holder(
        id: json["id"],
        category: json["category"],
        logo: json["logo"],
        cardHolder: json["card-holder"],
        balance: json["balance"],
        cardNumber: json["card-number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "logo": logo,
        "card-holder": cardHolder,
        "balance": balance,
        "card-number": cardNumber,
    };
}
