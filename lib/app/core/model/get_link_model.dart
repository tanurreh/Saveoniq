// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetLinkModel {
    String url;
    String responseTime;

    GetLinkModel({
        required this.url,
        required this.responseTime,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'responseTime': responseTime,
    };
  }

  factory GetLinkModel.fromMap(Map<String, dynamic> map) {
    return GetLinkModel(
      url: map['url'] as String,
      responseTime: map['responseTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetLinkModel.fromJson(String source) => GetLinkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
