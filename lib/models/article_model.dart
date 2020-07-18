// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
    ArticleModel({
        this.section,
        this.subsection,
        this.title,
        this.articleModelAbstract,
        this.url,
        this.uri,
        this.byline,
        this.itemType,
        this.updatedDate,
        this.createdDate,
        this.publishedDate,
        this.materialTypeFacet,
        this.kicker,
        this.desFacet,
        this.orgFacet,
        this.perFacet,
        this.geoFacet,
        this.multimedia ,
        this.shortUrl,
    });

    String section;
    String subsection;
    String title;
    String articleModelAbstract;
    String url;
    String uri;
    String byline;
    String itemType;
    DateTime updatedDate;
    DateTime createdDate;
    DateTime publishedDate;
    String materialTypeFacet;
    String kicker;
    List<String> desFacet;
    List<String> orgFacet;
    List<String> perFacet;
    List<dynamic> geoFacet;
    List<Multimedia> multimedia;
    String shortUrl;

    ArticleModel copyWith({
        String section,
        String subsection,
        String title,
        String articleModelAbstract,
        String url,
        String uri,
        String byline,
        String itemType,
        DateTime updatedDate,
        DateTime createdDate,
        DateTime publishedDate,
        String materialTypeFacet,
        String kicker,
        List<String> desFacet,
        List<String> orgFacet,
        List<String> perFacet,
        List<dynamic> geoFacet,
        List<Multimedia> multimedia,
        String shortUrl,
    }) => 
        ArticleModel(
            section: section ?? this.section,
            subsection: subsection ?? this.subsection,
            title: title ?? this.title,
            articleModelAbstract: articleModelAbstract ?? this.articleModelAbstract,
            url: url ?? this.url,
            uri: uri ?? this.uri,
            byline: byline ?? this.byline,
            itemType: itemType ?? this.itemType,
            updatedDate: updatedDate ?? this.updatedDate,
            createdDate: createdDate ?? this.createdDate,
            publishedDate: publishedDate ?? this.publishedDate,
            materialTypeFacet: materialTypeFacet ?? this.materialTypeFacet,
            kicker: kicker ?? this.kicker,
            desFacet: desFacet ?? this.desFacet,
            orgFacet: orgFacet ?? this.orgFacet,
            perFacet: perFacet ?? this.perFacet,
            geoFacet: geoFacet ?? this.geoFacet,
            multimedia: multimedia ?? this.multimedia,
            shortUrl: shortUrl ?? this.shortUrl,
        );

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        section: json["section"],
        subsection: json["subsection"],
        title: json["title"],
        articleModelAbstract: json["abstract"],
        url: json["url"],
        uri: json["uri"],
        byline: json["byline"],
        itemType: json["item_type"],
        updatedDate: DateTime.parse(json["updated_date"]),
        createdDate: DateTime.parse(json["created_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        materialTypeFacet: json["material_type_facet"],
        kicker: json["kicker"],
        desFacet: List<String>.from(json["des_facet"].map((x) => x)),
        orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
        perFacet: List<String>.from(json["per_facet"].map((x) => x)),
        geoFacet: List<dynamic>.from(json["geo_facet"].map((x) => x)),
        multimedia: json["multimedia"] == null ? null : List<Multimedia>.from(json["multimedia"].map((x) => Multimedia.fromJson(x))),
        shortUrl: json["short_url"],
    );

    Map<String, dynamic> toJson() => {
        "section": section,
        "subsection": subsection,
        "title": title,
        "abstract": articleModelAbstract,
        "url": url,
        "uri": uri,
        "byline": byline,
        "item_type": itemType,
        "updated_date": updatedDate.toIso8601String(),
        "created_date": createdDate.toIso8601String(),
        "published_date": publishedDate.toIso8601String(),
        "material_type_facet": materialTypeFacet,
        "kicker": kicker,
        "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
        "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
        "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
        "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
        "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
        "short_url": shortUrl,
    };
}

class Multimedia {
    Multimedia({
        this.url,
        this.format,
        this.height,
        this.width,
        this.type,
        this.subtype,
        this.caption,
        this.copyright,
    });

    String url;
    String format;
    int height;
    int width;
    String type;
    String subtype;
    String caption;
    String copyright;

    Multimedia copyWith({
        String url,
        String format,
        int height,
        int width,
        String type,
        String subtype,
        String caption,
        String copyright,
    }) => 
        Multimedia(
            url: url ?? this.url,
            format: format ?? this.format,
            height: height ?? this.height,
            width: width ?? this.width,
            type: type ?? this.type,
            subtype: subtype ?? this.subtype,
            caption: caption ?? this.caption,
            copyright: copyright ?? this.copyright,
        );

    factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
    };
}
