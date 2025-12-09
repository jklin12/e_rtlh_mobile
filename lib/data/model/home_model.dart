// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));


class HomeModel {
  List<dynamic> banner;
  List<Menu> menus;

  HomeModel({
    this.banner = const [],
    this.menus = const [],
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    banner: json["banner"] != null
        ? List<dynamic>.from(json["banner"].map((x) => x))
        : [],
    menus: json["menus"] != null
        ? List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x)))
        : [],
  );
}


class Menu {
    String title;
    String icon;
    String route;

    Menu({
        required this.title,
        required this.icon,
        required this.route,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        title: json["title"],
        icon: json["icon"],
        route: json["route"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "route": route,
    };
}
