// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetVideoModel {
    String? url;
    String? title;
    String? siteName;
    String? description;
    String? mediaType;
    String? contentType;
    List<String>? images;
    List<String>? videos;
    List<String>? favicons;
    String? charset;
    String? responseTime;

    GetVideoModel({
        this.url,
        this.title,
        this.siteName,
        this.description,
        this.mediaType,
        this.contentType,
        this.images,
        this.videos,
        this.favicons,
        this.charset,
        this.responseTime,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'title': title,
      'siteName': siteName,
      'description': description,
      'mediaType': mediaType,
      'contentType': contentType,
      'images': images,
      'videos': videos,
      'favicons': favicons,
      'charset': charset,
      'responseTime': responseTime,
    };
  }

  factory GetVideoModel.fromMap(Map<String, dynamic> map) {
    return GetVideoModel(
      url: map['url'] != null ? map['url'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      siteName: map['siteName'] != null ? map['siteName'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      mediaType: map['mediaType'] != null ? map['mediaType'] as String : null,
      contentType: map['contentType'] != null ? map['contentType'] as String : null,
      images: map['images'] != null ? List<String>.from((map['images'] as List<dynamic>)) : null,
      videos: map['videos'] != null ? List<String>.from((map['videos'] as List<dynamic>)) : null,
      favicons: map['favicons'] != null ? List<String>.from((map['favicons'] as List<dynamic>)) : null,
      charset: map['charset'] != null ? map['charset'] as String : null,
      responseTime: map['responseTime'] != null ? map['responseTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetVideoModel.fromJson(String source) => GetVideoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
