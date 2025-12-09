// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_rtlh_mobile/data/model/user_model.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    UserModel user;
    String authToken;

    LoginModel({
        required this.user,
        required this.authToken,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: UserModel.fromJson(json["user"]),
        authToken: json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "auth_token": authToken,
    };
}

