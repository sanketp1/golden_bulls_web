// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? roll_no;
  String? uid;
  String? name;
  String? email;
  String? contact_no;
  String? location;
  String? profile_img_link;
  String? reference_by;

  UserModel({
    this.roll_no,
    this.uid,
    this.name,
    this.email,
    this.contact_no,
    this.location,
    this.profile_img_link,
    this.reference_by,
  });

  UserModel copyWith({
    String? roll_no,
    String? uid,
    String? name,
    String? email,
    String? contact_no,
    String? location,
    String? profile_img_link,
    String? reference_by,
  }) {
    return UserModel(
      roll_no: roll_no ?? this.roll_no,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      contact_no: contact_no ?? this.contact_no,
      location: location ?? this.location,
      profile_img_link: profile_img_link ?? this.profile_img_link,
      reference_by: reference_by ?? this.reference_by,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roll_no': roll_no,
      'uid': uid,
      'name': name,
      'email': email,
      'contact_no': contact_no,
      'location': location,
      'profile_img_link': profile_img_link,
      'reference_by': reference_by,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      roll_no: map['roll_no'] != null ? map['roll_no'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      contact_no: map['contact_no'] != null ? map['contact_no'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      profile_img_link: map['profile_img_link'] != null ? map['profile_img_link'] as String : null,
      reference_by: map['reference_by'] != null ? map['reference_by'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(roll_no: $roll_no, uid: $uid, name: $name, email: $email, contact_no: $contact_no, location: $location, profile_img_link: $profile_img_link, reference_by: $reference_by)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.roll_no == roll_no &&
      other.uid == uid &&
      other.name == name &&
      other.email == email &&
      other.contact_no == contact_no &&
      other.location == location &&
      other.profile_img_link == profile_img_link &&
      other.reference_by == reference_by;
  }

  @override
  int get hashCode {
    return roll_no.hashCode ^
      uid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      contact_no.hashCode ^
      location.hashCode ^
      profile_img_link.hashCode ^
      reference_by.hashCode;
  }
}

class Credentials {
  final String email;
  final String password;
  Credentials({
    required this.email,
    required this.password,
  });

  Credentials copyWith({
    String? email,
    String? password,
  }) {
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory Credentials.fromMap(Map<String, dynamic> map) {
    return Credentials(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Credentials.fromJson(String source) =>
      Credentials.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Credentials(email: $email, password: $password)';

  @override
  bool operator ==(covariant Credentials other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}


class UserModelFields{
 static String roll_no = "Roll No";
 static String uid = "UID";
 static String name = "Name";
 static String email = "Email";
 static String contact_no = "Contact No";
 static String location = "Location";
 static String profile_img_link = "Profile Url";
 static String reference_by = "Reference By";
}