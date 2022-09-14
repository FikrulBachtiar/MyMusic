import 'dart:convert';

CategoryVideoModel categoryVideoModelFromJson(String str) =>
    CategoryVideoModel.fromJson(json.decode(str));

String categoryVideoModelToJson(CategoryVideoModel data) =>
    json.encode(data.toJson());

class CategoryVideoModel {
  CategoryVideoModel({
    this.kind,
    this.etag,
    this.items,
  });

  String? kind;
  String? etag;
  List<Item>? items;

  factory CategoryVideoModel.fromJson(Map<String, dynamic> json) =>
      CategoryVideoModel(
        kind: json["kind"],
        etag: json["etag"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet:
            json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet!.toJson(),
      };
}

class Snippet {
  Snippet({
    required this.title,
    required this.assignable,
    required this.channelId,
  });

  String title;
  bool assignable;
  String channelId;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        title: json["title"],
        assignable: json["assignable"],
        channelId: json["channelId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "assignable": assignable,
        "channelId": channelId,
      };
}
