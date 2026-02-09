class LeagueModel {
  final String? id;
  final String? imageUrl;
  final String? name;
  final String? place;

  LeagueModel({
    this.id,
    this.imageUrl,
    this.name,
    this.place
  });

  factory LeagueModel.fromMap(Map<String,dynamic> map,String id) {
    return LeagueModel(
      id: id,
      imageUrl: map['imageUrl'],
      name: map['name'],
      place: map['place']
    );
  }

  Map<String,dynamic> toMap() {
    return {
      'imageUrl' : imageUrl,
      'name' : name,
      'place' : place
    };
  }
}