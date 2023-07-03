part of '../models.dart';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
    String? name;
    String? email;
    String? message;

    ContactModel({
        this.name,
        this.email,
        this.message,
    });

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json["nombre"],
        email: json["email"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": name,
        "email": email,
        "message": message,
    };
}