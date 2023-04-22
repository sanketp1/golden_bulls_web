// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GuestModel {
  String name;
  String contact_no;
  String timeStamp;
  String reference_by;
  GuestModel({
    required this.name,
    required this.contact_no,
    required this.timeStamp, 
    required this.reference_by
  });

  GuestModel copyWith({
    String? name,
    String? contact_no,
    String? timeStamp,
    String? reference_by,
  }) {
    return GuestModel(
      name: name ?? this.name,
      contact_no: contact_no ?? this.contact_no,
      timeStamp: timeStamp ?? this.timeStamp,
      reference_by: reference_by ?? this.reference_by,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'contact_no': contact_no,
      'timeStamp': timeStamp,
      'reference_by': reference_by,
    };
  }

  factory GuestModel.fromMap(Map<String, dynamic> map) {
    return GuestModel(
      name: map['name'] as String,
      contact_no: map['contact_no'] as String,
      timeStamp: map['timeStamp'] as String,
      reference_by: map['reference_by'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestModel.fromJson(String source) =>
      GuestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GuestModel(name: $name, contact_no: $contact_no, timeStamp: $timeStamp, reference_by: $reference_by)';
  }

  @override
  bool operator ==(covariant GuestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.contact_no == contact_no &&
      other.timeStamp == timeStamp &&
      other.reference_by == reference_by;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      contact_no.hashCode ^
      timeStamp.hashCode ^
      reference_by.hashCode;
  }
}
