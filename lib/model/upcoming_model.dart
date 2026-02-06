class UpcomingModel {
  final String? id;
  final String? teamA;
  final String? teamB;
  final String? time;

  UpcomingModel({
    this.id,
    this.teamA,
    this.teamB,
    this.time
  });

  factory UpcomingModel.fromMap(Map<String,dynamic> map,String id) {
    return UpcomingModel(
      id: id,
      teamA: map['teamA'],
      teamB: map['teamB'],
      time: map['time']
    );
  } 

  Map<String,dynamic> toMap() {
    return {
      'teamA' : teamA,
      'teamB' : teamB,
      'time' : time
    };
  }
}