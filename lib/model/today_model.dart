import 'package:cloud_firestore/cloud_firestore.dart';

class TodayModel {
  final String? id;
  final String? teamA;
  final String? teamB;
  final String? time;
  final DateTime? date;

  TodayModel({this.id, this.teamA, this.teamB, this.time, this.date});

  factory TodayModel.fromMap(Map<String, dynamic> map, String id) {
    return TodayModel(
      id: id,
      teamA: map['teamA'],
      teamB: map['teamB'],
      time: map['time'],
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamA': teamA,
      'teamB': teamB,
      'time': time,
      'date': date != null ? Timestamp.fromDate(date!) : Timestamp.now(),
    };
  }
}
