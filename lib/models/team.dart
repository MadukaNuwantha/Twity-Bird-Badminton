import 'package:twity_bird_badminton/models/practice_timing.dart';

class Team {
  String? id;
  String? name;
  List<PracticeTiming>? practiceTiming;

  Team({
    this.id,
    this.name,
    this.practiceTiming,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] as String?,
      name: json['name'] as String?,
      practiceTiming: (json['practiceTiming'] as List<dynamic>?)
          ?.map((timingJson) => PracticeTiming.fromJson(timingJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'practiceTiming': practiceTiming?.map((timing) => timing.toJson()).toList(),
    };
  }
}
