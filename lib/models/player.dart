import 'package:twity_bird_badminton/models/team.dart';

class Player {
  String? id;
  String? firstName;
  String? lastName;
  String? age;
  String? dob;
  String? contactNumber;
  String? parentContactNumber;
  Team? team;

  Player({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.dob,
    this.contactNumber,
    this.parentContactNumber,
    this.team,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as String?,
      dob: json['dob'] as String?,
      contactNumber: json['contactNumber'] as String?,
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
      'contactNumber': contactNumber,
      'parentContactNumber': parentContactNumber,
      'team': team?.toJson(),
    };
  }
}
