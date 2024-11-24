class Match {
  final int id;
  final String date;
  final String createdAt;

  Match({required this.id, required this.date, required this.createdAt});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      date: json['date'],
      createdAt: json['created_at'],
    );
  }
}
