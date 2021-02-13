// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.categories,
    this.message,
    this.status,
  });

  List<CategoryElement> categories;
  String message;
  int status;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categories: List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class CategoryElement {
  CategoryElement({
    this.id,
    this.webIcon,
    this.mobileIcon,
    this.name,
    this.categorySlug,
    this.categoryType,
    this.childCat,
    this.display,
  });

  String id;
  String webIcon;
  String mobileIcon;
  String name;
  String categorySlug;
  CategoryType categoryType;
  List<ChildCat> childCat;
  String display;

  factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
    id: json["_id"],
    webIcon: json["web_icon"],
    mobileIcon: json["mobile_icon"],
    name: json["name"],
    categorySlug: json["category_slug"],
    categoryType: categoryTypeValues.map[json["category_type"]],
    childCat: List<ChildCat>.from(json["child_cat"].map((x) => ChildCat.fromJson(x))),
    display: json["display"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "web_icon": webIcon,
    "mobile_icon": mobileIcon,
    "name": name,
    "category_slug": categorySlug,
    "category_type": categoryTypeValues.reverse[categoryType],
    "child_cat": List<dynamic>.from(childCat.map((x) => x.toJson())),
    "display": display,
  };
}

enum CategoryType { PRODUCT }

final categoryTypeValues = EnumValues({
  "product": CategoryType.PRODUCT
});

class ChildCat {
  ChildCat({
    this.id,
    this.webIcon,
    this.mobileIcon,
    this.name,
    this.categorySlug,
    this.childCat,
    this.display,
  });

  String id;
  String webIcon;
  String mobileIcon;
  String name;
  String categorySlug;
  List<ChildCat> childCat;
  String display;

  factory ChildCat.fromJson(Map<String, dynamic> json) => ChildCat(
    id: json["_id"],
    webIcon: json["web_icon"],
    mobileIcon: json["mobile_icon"],
    name: json["name"],
    categorySlug: json["category_slug"],
    childCat: List<ChildCat>.from(json["child_cat"].map((x) => ChildCat.fromJson(x))),
    display: json["display"] == null ? null : json["display"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "web_icon": webIcon,
    "mobile_icon": mobileIcon,
    "name": name,
    "category_slug": categorySlug,
    "child_cat": List<dynamic>.from(childCat.map((x) => x.toJson())),
    "display": display == null ? null : display,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
