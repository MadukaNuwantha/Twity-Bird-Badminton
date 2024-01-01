import 'package:twity_bird_badminton/models/team.dart';

class Player {
  String? id;
  String? firstName;
  String? lastName;
  String? age;
  String? dob;
  String? contactNumberCountry;
  String? contactNumber;
  String? parentContactNumberCountry;
  String? parentContactNumber;
  Team? team;

  Player({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.dob,
    this.contactNumberCountry,
    this.contactNumber,
    this.parentContactNumber,
    this.parentContactNumberCountry,
    this.team,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as String?,
      dob: json['dob'] as String?,
      contactNumberCountry: json['contactNumberCountry'] as String?,
      contactNumber: json['contactNumber'] as String?,
      parentContactNumberCountry: json['parentContactNumberCountry'] as String?,
      parentContactNumber: json['parentContactNumber'] as String?,
      team: json['team'] != null ? Team.fromJson(json['team'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'dob': dob,
      'contactNumberCountry': contactNumberCountry,
      'contactNumber': contactNumber,
      'parentContactNumberCountry': parentContactNumberCountry,
      'parentContactNumber': parentContactNumber,
      'team': team?.toJson(),
    };
  }
}
