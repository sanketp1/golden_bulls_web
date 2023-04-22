// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackModel {
  String? id;
  String? name;
  String? timeStamp;
  String? source_link;
  String? coverLink;
  String? sourceType;
  FeedbackModel({
    this.id,
    this.name,
    this.timeStamp,
    this.source_link,
     this.coverLink,
    this.sourceType,
  });

  FeedbackModel copyWith({
    String? id,
    String? name,
    String? timeStamp,
    String? source_link,
    String? coverLink,
    String? sourceType,
  }) {
    return FeedbackModel(
      id: id ?? this.id,
      name: name ?? this.name,
      timeStamp: timeStamp ?? this.timeStamp,
      source_link: source_link ?? this.source_link,
      coverLink: coverLink ?? this.coverLink,
      sourceType: sourceType ?? this.sourceType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'timeStamp': timeStamp,
      'source_link': source_link,
      'coverLink': coverLink,
      'sourceType': sourceType,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      timeStamp: map['timeStamp'] != null ? map['timeStamp'] as String : null,
      source_link: map['source_link'] != null ? map['source_link'] as String : null,
      coverLink: map['coverLink'] != null ? map['coverLink'] as String : null,
      sourceType: map['sourceType'] != null ? map['sourceType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackModel.fromJson(String source) =>
      FeedbackModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeedbackModel(id: $id, name: $name, timeStamp: $timeStamp, source_link: $source_link, coverLink: $coverLink, sourceType: $sourceType)';
  }

  @override
  bool operator ==(covariant FeedbackModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.timeStamp == timeStamp &&
      other.source_link == source_link &&
      other.coverLink == coverLink &&
      other.sourceType == sourceType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      timeStamp.hashCode ^
      source_link.hashCode ^
      coverLink.hashCode ^
      sourceType.hashCode;
  }
}

class SourceType {
  static final image = "image";
  static final video = "video";
}
