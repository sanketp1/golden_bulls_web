import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LectureLinkModel {
  String? id;
  String? topic;
  String? link;
  String? timeStamp;

  LectureLinkModel({
    this.id,
    this.topic,
    this.link,
    this.timeStamp,
  });

  LectureLinkModel copyWith({
    String? id,
    String? topic,
    String? link,
    String? timeStamp,
  }) {
    return LectureLinkModel(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      link: link ?? this.link,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'topic': topic,
      'link': link,
      'timeStamp': timeStamp,
    };
  }

  factory LectureLinkModel.fromMap(Map<String, dynamic> map) {
    return LectureLinkModel(
      id: map['id'] != null ? map['id'] as String : null,
      topic: map['topic'] != null ? map['topic'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      timeStamp: map['timeStamp'] != null ? map['timeStamp'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LectureLinkModel.fromJson(String source) =>
      LectureLinkModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LectureLinkModel(id: $id, topic: $topic, link: $link, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(covariant LectureLinkModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.topic == topic &&
      other.link == link &&
      other.timeStamp == timeStamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      topic.hashCode ^
      link.hashCode ^
      timeStamp.hashCode;
  }
}
