class TodayModel {
  final String? id;
  final String? teamA;
  final String? teamB;
  final String? time;
  final String? imageA;
  final String? imageB;

  TodayModel({
    this.id,
    this.teamA,
    this.teamB,
    this.time,
    this.imageA,
    this.imageB,
  });

  factory TodayModel.fromMap(Map<String, dynamic> map, String id) {
    return TodayModel(
      id: id,
      teamA: map['teamA'],
      teamB: map['teamB'],
      time: map['time'],
      imageA: map['imageA'],
      imageB: map['imageB'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamA': teamA,
      'teamB': teamB,
      'time': time,
      'imageA': imageA,
      'imageB': imageB,
    };
  }
}
