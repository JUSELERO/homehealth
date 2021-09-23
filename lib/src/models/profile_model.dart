// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    String firstname;
    String lastname;
    String documentNumber;
    String profilePicture;
    String phone;
    String address;
    String birthdate;
    String user;
    String rol;

    Profile({
      this.firstname,
      this.lastname,
      this.documentNumber,
      this.profilePicture = "",
      this.phone,
      this.address,
      this.birthdate,
      this.user,
      this.rol,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        firstname: json["firstname"],
        lastname: json["lastname"],
        documentNumber: json["document_number"],
        profilePicture: json["profile_picture"],
        phone: json["phone"],
        address: json["address"],
        birthdate: json["birthdate"],
        user: json["user"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "document_number": documentNumber,
        "profile_picture": profilePicture,
        "phone": phone,
        "address": address,
        "birthdate": birthdate,
        "user": user,
        "rol": rol,
    };
}
