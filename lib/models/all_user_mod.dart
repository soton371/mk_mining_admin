// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'dart:convert';

AllUserModel allUserModelFromJson(String str) => AllUserModel.fromJson(json.decode(str));

String allUserModelToJson(AllUserModel data) => json.encode(data.toJson());

class AllUserModel {
    List<Datum>? data;
    String? message;
    int? status;

    AllUserModel({
        this.data,
        this.message,
        this.status,
    });

    factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}

class Datum {
    int? id;
    String? name;
    String? email;
    String? phone;
    dynamic emailVerifiedAt;
    String? socialId;
    String? referCode;
    String? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? referUserCount;
    Balance? balance;

    Datum({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.socialId,
        this.referCode,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.referUserCount,
        this.balance,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        socialId: json["social_id"],
        referCode: json["refer_code"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        referUserCount: json["refer_user_count"],
        balance: json["balance"] == null ? null : Balance.fromJson(json["balance"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "social_id": socialId,
        "refer_code": referCode,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "refer_user_count": referUserCount,
        "balance": balance?.toJson(),
    };
}

class Balance {
    int? id;
    String? userId;
    String? mainBalance;
    String? miningBalance;
    DateTime? createdAt;
    DateTime? updatedAt;

    Balance({
        this.id,
        this.userId,
        this.mainBalance,
        this.miningBalance,
        this.createdAt,
        this.updatedAt,
    });

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        id: json["id"],
        userId: json["user_id"],
        mainBalance: json["main_balance"],
        miningBalance: json["mining_balance"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "main_balance": mainBalance,
        "mining_balance": miningBalance,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
