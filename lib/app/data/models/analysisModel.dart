// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnalysisModel {
  String? id;
  String? title;
  String? desc;
  String? imageUrl;
  String? timeStamp;
  AnalysisModel({
    this.id,
    this.title,
    this.desc,
    this.imageUrl,
    this.timeStamp,
  });

  AnalysisModel copyWith({
    String? id,
    String? title,
    String? desc,
    String? imageUrl,
    String? timeStamp,
  }) {
    return AnalysisModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      imageUrl: imageUrl ?? this.imageUrl,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'desc': desc,
      'imageUrl': imageUrl,
      'timeStamp': timeStamp,
    };
  }

  factory AnalysisModel.fromMap(Map<String, dynamic> map) {
    return AnalysisModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      timeStamp: map['timeStamp'] != null ? map['timeStamp'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalysisModel.fromJson(String source) =>
      AnalysisModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnalysisModel(id: $id, title: $title, desc: $desc, imageUrl: $imageUrl, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(covariant AnalysisModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.desc == desc &&
        other.imageUrl == imageUrl &&
        other.timeStamp == timeStamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        desc.hashCode ^
        imageUrl.hashCode ^
        timeStamp.hashCode;
  }
}
