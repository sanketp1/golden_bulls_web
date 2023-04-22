// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarouselModel {
  String? id;
  String src;
  CarouselModel({
    this.id,
    required this.src,
  });

  CarouselModel copyWith({
    String? id,
    String? src,
  }) {
    return CarouselModel(
      id: id ?? this.id,
      src: src ?? this.src,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'src': src,
    };
  }

  factory CarouselModel.fromMap(Map<String, dynamic> map) {
    return CarouselModel(
      id: map['id'] != null ? map['id'] as String : null,
      src: map['src'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarouselModel.fromJson(String source) =>
      CarouselModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CarouselModel(id: $id, src: $src)';

  @override
  bool operator ==(covariant CarouselModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.src == src;
  }

  @override
  int get hashCode => id.hashCode ^ src.hashCode;
}
