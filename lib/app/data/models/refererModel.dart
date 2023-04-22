// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RefererModel {
  String? id;
  String name;
  String tag;
  RefererModel({
    this.id,
    required this.name,
    required this.tag,
  });

  RefererModel copyWith({
    String? id,
    String? name,
    String? tag,
  }) {
    return RefererModel(
      id: id ?? this.id,
      name: name ?? this.name,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tag': tag,
    };
  }

  factory RefererModel.fromMap(Map<String, dynamic> map) {
    return RefererModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RefererModel.fromJson(String source) => RefererModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RefererModel(id: $id, name: $name, tag: $tag)';

  @override
  bool operator ==(covariant RefererModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.tag == tag;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ tag.hashCode;
}
