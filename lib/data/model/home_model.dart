// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

import 'berita_model.dart';
import 'menu_model.dart';
 

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));


class HomeModel {
  List<BeritaModel> banner;
  List<MenuModel> menus;

  HomeModel({
    this.banner = const [],
    this.menus = const [],
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    banner:  json["banner"] == null ? [] : List<BeritaModel>.from(json["banner"]!.map((x) => BeritaModel.fromJson(x))),
        
    menus: json["menus"] != null
        ? List<MenuModel>.from(json["menus"].map((x) => MenuModel.fromJson(x)))
        : [],
  );
}



