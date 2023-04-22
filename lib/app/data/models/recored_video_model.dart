import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecordedVideoModel {
  String? id;
  String? title;
  String? desc;
  String? timeStamp;
  String? lecture_url;
  String? cover_url;
  String? uploaded_by;
  RecordedVideoModel({
    this.id,
    this.title,
    this.desc,
    this.timeStamp,
    this.lecture_url,
    this.cover_url,
    this.uploaded_by,
  });

  RecordedVideoModel copyWith({
    String? id,
    String? title,
    String? desc,
    String? timeStamp,
    String? lecture_url,
    String? cover_url,
    String? uploaded_by,
  }) {
    return RecordedVideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      timeStamp: timeStamp ?? this.timeStamp,
      lecture_url: lecture_url ?? this.lecture_url,
      cover_url: cover_url ?? this.cover_url,
      uploaded_by: uploaded_by ?? this.uploaded_by,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'desc': desc,
      'timeStamp': timeStamp,
      'lecture_url': lecture_url,
      'cover_url': cover_url,
      'uploaded_by': uploaded_by,
    };
  }

  factory RecordedVideoModel.fromMap(Map<String, dynamic> map) {
    return RecordedVideoModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      timeStamp: map['timeStamp'] != null ? map['timeStamp'] as String : null,
      lecture_url: map['lecture_url'] != null ? map['lecture_url'] as String : null,
      cover_url: map['cover_url'] != null ? map['cover_url'] as String : null,
      uploaded_by: map['uploaded_by'] != null ? map['uploaded_by'] as String : null,
    );
  }

  factory RecordedVideoModel.empty() {
    return RecordedVideoModel(
      id: "",
      title: "",
      desc: "",
      timeStamp: "",
      lecture_url: "",
      cover_url: "",
      uploaded_by: "",
    );
  }

  String toJson() => json.encode(toMap());

  factory RecordedVideoModel.fromJson(String source) =>
      RecordedVideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecordedVideoModel(id: $id, title: $title, desc: $desc, timeStamp: $timeStamp, lecture_url: $lecture_url, cover_url: $cover_url, uploaded_by: $uploaded_by)';
  }

  @override
  bool operator ==(covariant RecordedVideoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.desc == desc &&
      other.timeStamp == timeStamp &&
      other.lecture_url == lecture_url &&
      other.cover_url == cover_url &&
      other.uploaded_by == uploaded_by;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      desc.hashCode ^
      timeStamp.hashCode ^
      lecture_url.hashCode ^
      cover_url.hashCode ^
      uploaded_by.hashCode;
  }
}
