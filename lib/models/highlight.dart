class Highlight {
  final int id;
  final int matchId;
  final int clickTimestamp;
  final String videoPath;
  final String createdAt;

  Highlight({
    required this.id,
    required this.matchId,
    required this.clickTimestamp,
    required this.videoPath,
    required this.createdAt,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      id: json['id'],
      matchId: json['match_id'],
      clickTimestamp: json['click_timestamp'],
      videoPath: json['video_path'],
      createdAt: json['created_at'],
    );
  }
}
