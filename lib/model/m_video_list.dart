import 'dart:convert';

VideoListModel videoListModelFromJson(String str) =>
    VideoListModel.fromJson(json.decode(str));

String videoListModelToJson(VideoListModel data) => json.encode(data.toJson());

class VideoListModel {
  VideoListModel({
    this.kind,
    this.etag,
    this.items,
    this.nextPageToken,
    this.pageInfo,
    this.error,
  });

  String? kind;
  String? etag;
  List<Item>? items;
  String? nextPageToken;
  PageInfo? pageInfo;
  VideoListModelError? error;

  factory VideoListModel.fromJson(Map<String, dynamic> json) => VideoListModel(
        kind: json["kind"],
        etag: json["etag"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        nextPageToken: json["nextPageToken"],
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
        error: json["error"] == null
            ? null
            : VideoListModelError.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "nextPageToken": nextPageToken,
        "pageInfo": pageInfo?.toJson(),
      };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.contentDetails,
    this.status,
    this.statistics,
    this.player,
  });

  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;
  ContentDetails? contentDetails;
  Status? status;
  Statistics? statistics;
  Player? player;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet:
            json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
        contentDetails: json["contentDetails"] == null
            ? null
            : ContentDetails.fromJson(json["contentDetails"]),
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        statistics: json["statistics"] == null
            ? null
            : Statistics.fromJson(json["statistics"]),
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet?.toJson(),
        "contentDetails": contentDetails?.toJson(),
        "status": status?.toJson(),
        "statistics": statistics?.toJson(),
      };
}

class ContentDetails {
  ContentDetails({
    required this.duration,
    required this.dimension,
    required this.definition,
    required this.caption,
    required this.licensedContent,
    required this.contentRating,
  });

  String duration;
  String dimension;
  String definition;
  String caption;
  bool licensedContent;
  ContentRating contentRating;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        duration: json["duration"],
        dimension: json["dimension"],
        definition: json["definition"],
        caption: json["caption"],
        licensedContent: json["licensedContent"],
        contentRating: ContentRating.fromJson(json["contentRating"]),
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "dimension": dimension,
        "definition": definition,
        "caption": caption,
        "licensedContent": licensedContent,
        "contentRating": contentRating.toJson(),
      };
}

class ContentRating {
  ContentRating();

  factory ContentRating.fromJson(Map<String, dynamic> json) => ContentRating();

  Map<String, dynamic> toJson() => {};
}

class RegionRestriction {
  RegionRestriction({
    this.blocked,
  });

  List<String>? blocked;

  factory RegionRestriction.fromJson(Map<String, dynamic> json) =>
      RegionRestriction(
        blocked: json["blocked"] == null
            ? null
            : List<String>.from(json["blocked"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "blocked":
            blocked == null ? null : List<dynamic>.from(blocked!.map((x) => x)),
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.defaultLanguage,
    this.localized,
    this.defaultAudioLanguage,
  });

  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  List<String>? tags;
  String? categoryId;
  String? liveBroadcastContent;
  String? defaultLanguage;
  Localized? localized;
  String? defaultAudioLanguage;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        categoryId: json["categoryId"],
        liveBroadcastContent: json["liveBroadcastContent"],
        defaultLanguage: json["defaultLanguage"],
        localized: json["localized"] == null
            ? null
            : Localized.fromJson(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"],
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toJson(),
        "channelTitle": channelTitle,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "categoryId": categoryId,
        "liveBroadcastContent": liveBroadcastContent,
        "defaultLanguage": defaultLanguage,
        "localized": localized?.toJson(),
        "defaultAudioLanguage": defaultAudioLanguage,
      };
}

class Player {
  Player({
    this.embedHtml,
  });

  String? embedHtml;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        embedHtml: json["embedHtml"],
      );

  Map<String, dynamic> toJson() => {
        "embedHtml": embedHtml,
      };
}

class Localized {
  Localized({
    this.title,
    this.description,
  });

  String? title;
  String? description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault:
            json["default"] == null ? null : Default.fromJson(json["default"]),
        medium:
            json["medium"] == null ? null : Default.fromJson(json["medium"]),
        high: json["high"] == null ? null : Default.fromJson(json["high"]),
        standard: json["standard"] == null
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
        "standard": standard?.toJson(),
        "maxres": maxres?.toJson(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Statistics {
  Statistics({
    this.viewCount,
    this.likeCount,
    this.favoriteCount,
    this.commentCount,
  });

  String? viewCount;
  String? likeCount;
  String? favoriteCount;
  String? commentCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
      };
}

class Status {
  Status({
    this.uploadStatus,
    this.privacyStatus,
    this.license,
    this.embeddable,
    this.publicStatsViewable,
    this.madeForKids,
  });

  String? uploadStatus;
  String? privacyStatus;
  String? license;
  bool? embeddable;
  bool? publicStatsViewable;
  bool? madeForKids;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        uploadStatus: json["uploadStatus"],
        privacyStatus: json["privacyStatus"],
        license: json["license"],
        embeddable: json["embeddable"],
        publicStatsViewable: json["publicStatsViewable"],
        madeForKids: json["madeForKids"],
      );

  Map<String, dynamic> toJson() => {
        "uploadStatus": uploadStatus,
        "privacyStatus": privacyStatus,
        "license": license,
        "embeddable": embeddable,
        "publicStatsViewable": publicStatsViewable,
        "madeForKids": madeForKids,
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int? totalResults;
  int? resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}

class VideoListModelError {
  VideoListModelError({
    required this.code,
    required this.message,
    required this.errors,
  });

  int code;
  String message;
  List<ErrorElement> errors;

  factory VideoListModelError.fromJson(Map<String, dynamic> json) =>
      VideoListModelError(
        code: json["code"],
        message: json["message"],
        errors: List<ErrorElement>.from(
            json["errors"].map((x) => ErrorElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class ErrorElement {
  ErrorElement({
    required this.message,
    required this.domain,
    required this.reason,
  });

  String message;
  String domain;
  String reason;

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
