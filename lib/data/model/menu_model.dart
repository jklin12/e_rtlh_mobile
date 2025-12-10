class MenuModel {
    String title;
    String icon;
    String route;

    MenuModel({
        required this.title,
        required this.icon,
        required this.route,
    });

    factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
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