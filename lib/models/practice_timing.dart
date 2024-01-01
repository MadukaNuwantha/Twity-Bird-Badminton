class PracticeTiming {
  String? day;
  String? startTime;
  String? endTime;

  PracticeTiming({
    this.day,
    this.startTime,
    this.endTime,
  });

  factory PracticeTiming.fromJson(Map<String, dynamic> json) {
    return PracticeTiming(
      day: json['day'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
