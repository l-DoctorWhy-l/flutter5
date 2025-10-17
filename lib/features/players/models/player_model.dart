class Player {
  final String id;
  final String fullName;
  final int age;
  final int jerseyNumber;

  Player({
    required this.id,
    required this.fullName,
    required this.age,
    required this.jerseyNumber,
  });

  Player copyWith({
    String? id,
    String? fullName,
    int? age,
    int? jerseyNumber,
  }) {
    return Player(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      jerseyNumber: jerseyNumber ?? this.jerseyNumber,
    );
  }
}
