class News {
  final String title;
  final String time;

  News({
    required this.title,
    required this.time,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      time: json['time'],
    );
  }
}
